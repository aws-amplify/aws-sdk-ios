//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <fullname>Amazon Elastic Compute Cloud</fullname><p>Amazon Elastic Compute Cloud (Amazon EC2) provides secure and resizable computing capacity in the AWS cloud. Using Amazon EC2 eliminates the need to invest in hardware up front, so you can develop and deploy applications faster.</p><p>To learn more about Amazon EC2, Amazon EBS, and Amazon VPC, see the following resources:</p><ul><li><p><a href="http://aws.amazon.com/ec2">Amazon EC2 product page</a></p></li><li><p><a href="http://aws.amazon.com/documentation/ec2">Amazon EC2 documentation</a></p></li><li><p><a href="http://aws.amazon.com/ebs">Amazon EBS product page</a></p></li><li><p><a href="http://aws.amazon.com/vpc">Amazon VPC product page</a></p></li><li><p><a href="http://aws.amazon.com/documentation/vpc">Amazon VPC documentation</a></p></li></ul>
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
 <p>Accept a VPC peering connection request. To accept a request, the VPC peering connection must be in the <code>pending-acceptance</code> state, and you must be the owner of the peer VPC. Use <a>DescribeVpcPeeringConnections</a> to view your outstanding VPC peering connection requests.</p><p>For an inter-region VPC peering connection request, you must accept the VPC peering connection in the region of the accepter VPC.</p>
 
 @param request A container for the necessary parameters to execute the AcceptVpcPeeringConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AcceptVpcPeeringConnectionResult`.
 
 @see AWSEC2AcceptVpcPeeringConnectionRequest
 @see AWSEC2AcceptVpcPeeringConnectionResult
 */
- (AWSTask<AWSEC2AcceptVpcPeeringConnectionResult *> *)acceptVpcPeeringConnection:(AWSEC2AcceptVpcPeeringConnectionRequest *)request;

/**
 <p>Accept a VPC peering connection request. To accept a request, the VPC peering connection must be in the <code>pending-acceptance</code> state, and you must be the owner of the peer VPC. Use <a>DescribeVpcPeeringConnections</a> to view your outstanding VPC peering connection requests.</p><p>For an inter-region VPC peering connection request, you must accept the VPC peering connection in the region of the accepter VPC.</p>
 
 @param request A container for the necessary parameters to execute the AcceptVpcPeeringConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AcceptVpcPeeringConnectionRequest
 @see AWSEC2AcceptVpcPeeringConnectionResult
 */
- (void)acceptVpcPeeringConnection:(AWSEC2AcceptVpcPeeringConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AcceptVpcPeeringConnectionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Advertises an IPv4 address range that is provisioned for use with your AWS resources through bring your own IP addresses (BYOIP).</p><p>You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time.</p><p>We recommend that you stop advertising the BYOIP CIDR from other locations when you advertise it from AWS. To minimize down time, you can configure your AWS resources to use an address from a BYOIP CIDR before it is advertised, and then simultaneously stop advertising it from the current location and start advertising it through AWS.</p><p>It can take a few minutes before traffic to the specified addresses starts routing to AWS because of BGP propagation delays.</p><p>To stop advertising the BYOIP CIDR, use <a>WithdrawByoipCidr</a>.</p>
 
 @param request A container for the necessary parameters to execute the AdvertiseByoipCidr service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AdvertiseByoipCidrResult`.
 
 @see AWSEC2AdvertiseByoipCidrRequest
 @see AWSEC2AdvertiseByoipCidrResult
 */
- (AWSTask<AWSEC2AdvertiseByoipCidrResult *> *)advertiseByoipCidr:(AWSEC2AdvertiseByoipCidrRequest *)request;

/**
 <p>Advertises an IPv4 address range that is provisioned for use with your AWS resources through bring your own IP addresses (BYOIP).</p><p>You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time.</p><p>We recommend that you stop advertising the BYOIP CIDR from other locations when you advertise it from AWS. To minimize down time, you can configure your AWS resources to use an address from a BYOIP CIDR before it is advertised, and then simultaneously stop advertising it from the current location and start advertising it through AWS.</p><p>It can take a few minutes before traffic to the specified addresses starts routing to AWS because of BGP propagation delays.</p><p>To stop advertising the BYOIP CIDR, use <a>WithdrawByoipCidr</a>.</p>
 
 @param request A container for the necessary parameters to execute the AdvertiseByoipCidr service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AdvertiseByoipCidrRequest
 @see AWSEC2AdvertiseByoipCidrResult
 */
- (void)advertiseByoipCidr:(AWSEC2AdvertiseByoipCidrRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AdvertiseByoipCidrResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allocates an Elastic IP address to your AWS account. After you allocate the Elastic IP address you can associate it with an instance or network interface. After you release an Elastic IP address, it is released to the IP address pool and can be allocated to a different AWS account.</p><p>You can allocate an Elastic IP address from an address pool owned by AWS or from an address pool created from a public IPv4 address range that you have brought to AWS for use with your AWS resources using bring your own IP addresses (BYOIP). For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">Bring Your Own IP Addresses (BYOIP)</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>[EC2-VPC] If you release an Elastic IP address, you might be able to recover it. You cannot recover an Elastic IP address that you released after it is allocated to another AWS account. You cannot recover an Elastic IP address for EC2-Classic. To attempt to recover an Elastic IP address that you released, specify it in this operation.</p><p>An Elastic IP address is for use either in the EC2-Classic platform or in a VPC. By default, you can allocate 5 Elastic IP addresses for EC2-Classic per region and 5 Elastic IP addresses for EC2-VPC per region.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AllocateAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AllocateAddressResult`.
 
 @see AWSEC2AllocateAddressRequest
 @see AWSEC2AllocateAddressResult
 */
- (AWSTask<AWSEC2AllocateAddressResult *> *)allocateAddress:(AWSEC2AllocateAddressRequest *)request;

/**
 <p>Allocates an Elastic IP address to your AWS account. After you allocate the Elastic IP address you can associate it with an instance or network interface. After you release an Elastic IP address, it is released to the IP address pool and can be allocated to a different AWS account.</p><p>You can allocate an Elastic IP address from an address pool owned by AWS or from an address pool created from a public IPv4 address range that you have brought to AWS for use with your AWS resources using bring your own IP addresses (BYOIP). For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">Bring Your Own IP Addresses (BYOIP)</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>[EC2-VPC] If you release an Elastic IP address, you might be able to recover it. You cannot recover an Elastic IP address that you released after it is allocated to another AWS account. You cannot recover an Elastic IP address for EC2-Classic. To attempt to recover an Elastic IP address that you released, specify it in this operation.</p><p>An Elastic IP address is for use either in the EC2-Classic platform or in a VPC. By default, you can allocate 5 Elastic IP addresses for EC2-Classic per region and 5 Elastic IP addresses for EC2-VPC per region.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AllocateAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AllocateAddressRequest
 @see AWSEC2AllocateAddressResult
 */
- (void)allocateAddress:(AWSEC2AllocateAddressRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AllocateAddressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allocates a Dedicated Host to your account. At a minimum, specify the instance size type, Availability Zone, and quantity of hosts to allocate.</p>
 
 @param request A container for the necessary parameters to execute the AllocateHosts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AllocateHostsResult`.
 
 @see AWSEC2AllocateHostsRequest
 @see AWSEC2AllocateHostsResult
 */
- (AWSTask<AWSEC2AllocateHostsResult *> *)allocateHosts:(AWSEC2AllocateHostsRequest *)request;

/**
 <p>Allocates a Dedicated Host to your account. At a minimum, specify the instance size type, Availability Zone, and quantity of hosts to allocate.</p>
 
 @param request A container for the necessary parameters to execute the AllocateHosts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AllocateHostsRequest
 @see AWSEC2AllocateHostsResult
 */
- (void)allocateHosts:(AWSEC2AllocateHostsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AllocateHostsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns one or more IPv6 addresses to the specified network interface. You can specify one or more specific IPv6 addresses, or you can specify the number of IPv6 addresses to be automatically assigned from within the subnet's IPv6 CIDR block range. You can assign as many IPv6 addresses to a network interface as you can assign private IPv4 addresses, and the limit varies per instance type. For information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI">IP Addresses Per Network Interface Per Instance Type</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssignIpv6Addresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssignIpv6AddressesResult`.
 
 @see AWSEC2AssignIpv6AddressesRequest
 @see AWSEC2AssignIpv6AddressesResult
 */
- (AWSTask<AWSEC2AssignIpv6AddressesResult *> *)assignIpv6Addresses:(AWSEC2AssignIpv6AddressesRequest *)request;

/**
 <p>Assigns one or more IPv6 addresses to the specified network interface. You can specify one or more specific IPv6 addresses, or you can specify the number of IPv6 addresses to be automatically assigned from within the subnet's IPv6 CIDR block range. You can assign as many IPv6 addresses to a network interface as you can assign private IPv4 addresses, and the limit varies per instance type. For information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI">IP Addresses Per Network Interface Per Instance Type</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssignIpv6Addresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssignIpv6AddressesRequest
 @see AWSEC2AssignIpv6AddressesResult
 */
- (void)assignIpv6Addresses:(AWSEC2AssignIpv6AddressesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssignIpv6AddressesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns one or more secondary private IP addresses to the specified network interface.</p><p>You can specify one or more specific secondary IP addresses, or you can specify the number of secondary IP addresses to be automatically assigned within the subnet's CIDR block range. The number of secondary IP addresses that you can assign to an instance varies by instance type. For information about instance types, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. For more information about Elastic IP addresses, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>When you move a secondary private IP address to another network interface, any Elastic IP address that is associated with the IP address is also moved.</p><p>Remapping an IP address is an asynchronous operation. When you move an IP address from one network interface to another, check <code>network/interfaces/macs/mac/local-ipv4s</code> in the instance metadata to confirm that the remapping is complete.</p>
 
 @param request A container for the necessary parameters to execute the AssignPrivateIpAddresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AssignPrivateIpAddressesRequest
 */
- (AWSTask *)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request;

/**
 <p>Assigns one or more secondary private IP addresses to the specified network interface.</p><p>You can specify one or more specific secondary IP addresses, or you can specify the number of secondary IP addresses to be automatically assigned within the subnet's CIDR block range. The number of secondary IP addresses that you can assign to an instance varies by instance type. For information about instance types, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. For more information about Elastic IP addresses, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>When you move a secondary private IP address to another network interface, any Elastic IP address that is associated with the IP address is also moved.</p><p>Remapping an IP address is an asynchronous operation. When you move an IP address from one network interface to another, check <code>network/interfaces/macs/mac/local-ipv4s</code> in the instance metadata to confirm that the remapping is complete.</p>
 
 @param request A container for the necessary parameters to execute the AssignPrivateIpAddresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssignPrivateIpAddressesRequest
 */
- (void)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Associates an Elastic IP address with an instance or a network interface. Before you can use an Elastic IP address, you must allocate it to your account.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>[EC2-Classic, VPC in an EC2-VPC-only account] If the Elastic IP address is already associated with a different instance, it is disassociated from that instance and associated with the specified instance. If you associate an Elastic IP address with an instance that has an existing Elastic IP address, the existing address is disassociated from the instance, but remains allocated to your account.</p><p>[VPC in an EC2-Classic account] If you don't specify a private IP address, the Elastic IP address is associated with the primary IP address. If the Elastic IP address is already associated with a different instance or a network interface, you get an error unless you allow reassociation. You cannot associate an Elastic IP address with an instance or network interface that has an existing Elastic IP address.</p><important><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error, and you may be charged for each time the Elastic IP address is remapped to the same instance. For more information, see the <i>Elastic IP Addresses</i> section of <a href="http://aws.amazon.com/ec2/pricing/">Amazon EC2 Pricing</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the AssociateAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateAddressResult`.
 
 @see AWSEC2AssociateAddressRequest
 @see AWSEC2AssociateAddressResult
 */
- (AWSTask<AWSEC2AssociateAddressResult *> *)associateAddress:(AWSEC2AssociateAddressRequest *)request;

/**
 <p>Associates an Elastic IP address with an instance or a network interface. Before you can use an Elastic IP address, you must allocate it to your account.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>[EC2-Classic, VPC in an EC2-VPC-only account] If the Elastic IP address is already associated with a different instance, it is disassociated from that instance and associated with the specified instance. If you associate an Elastic IP address with an instance that has an existing Elastic IP address, the existing address is disassociated from the instance, but remains allocated to your account.</p><p>[VPC in an EC2-Classic account] If you don't specify a private IP address, the Elastic IP address is associated with the primary IP address. If the Elastic IP address is already associated with a different instance or a network interface, you get an error unless you allow reassociation. You cannot associate an Elastic IP address with an instance or network interface that has an existing Elastic IP address.</p><important><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error, and you may be charged for each time the Elastic IP address is remapped to the same instance. For more information, see the <i>Elastic IP Addresses</i> section of <a href="http://aws.amazon.com/ec2/pricing/">Amazon EC2 Pricing</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the AssociateAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AssociateAddressRequest
 @see AWSEC2AssociateAddressResult
 */
- (void)associateAddress:(AWSEC2AssociateAddressRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AssociateAddressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates a set of DHCP options (that you've previously created) with the specified VPC, or associates no DHCP options with the VPC.</p><p>After you associate the options with the VPC, any existing instances and all new instances that you launch in that VPC use the options. You don't need to restart or relaunch the instances. They automatically pick up the changes within a few hours, depending on how frequently the instance renews its DHCP lease. You can explicitly renew the lease using the operating system on the instance.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDhcpOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AssociateDhcpOptionsRequest
 */
- (AWSTask *)associateDhcpOptions:(AWSEC2AssociateDhcpOptionsRequest *)request;

/**
 <p>Associates a set of DHCP options (that you've previously created) with the specified VPC, or associates no DHCP options with the VPC.</p><p>After you associate the options with the VPC, any existing instances and all new instances that you launch in that VPC use the options. You don't need to restart or relaunch the instances. They automatically pick up the changes within a few hours, depending on how frequently the instance renews its DHCP lease. You can explicitly renew the lease using the operating system on the instance.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Associates a subnet with a route table. The subnet and route table must be in the same VPC. This association causes traffic originating from the subnet to be routed according to the routes in the route table. The action returns an association ID, which you need in order to disassociate the route table from the subnet later. A route table can be associated with multiple subnets.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateRouteTableResult`.
 
 @see AWSEC2AssociateRouteTableRequest
 @see AWSEC2AssociateRouteTableResult
 */
- (AWSTask<AWSEC2AssociateRouteTableResult *> *)associateRouteTable:(AWSEC2AssociateRouteTableRequest *)request;

/**
 <p>Associates a subnet with a route table. The subnet and route table must be in the same VPC. This association causes traffic originating from the subnet to be routed according to the routes in the route table. The action returns an association ID, which you need in order to disassociate the route table from the subnet later. A route table can be associated with multiple subnets.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Associates a CIDR block with your VPC. You can associate a secondary IPv4 CIDR block, or you can associate an Amazon-provided IPv6 CIDR block. The IPv6 CIDR block size is fixed at /56.</p><p>For more information about associating CIDR blocks with your VPC and applicable restrictions, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html#VPC_Sizing">VPC and Subnet Sizing</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateVpcCidrBlock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateVpcCidrBlockResult`.
 
 @see AWSEC2AssociateVpcCidrBlockRequest
 @see AWSEC2AssociateVpcCidrBlockResult
 */
- (AWSTask<AWSEC2AssociateVpcCidrBlockResult *> *)associateVpcCidrBlock:(AWSEC2AssociateVpcCidrBlockRequest *)request;

/**
 <p>Associates a CIDR block with your VPC. You can associate a secondary IPv4 CIDR block, or you can associate an Amazon-provided IPv6 CIDR block. The IPv6 CIDR block size is fixed at /56.</p><p>For more information about associating CIDR blocks with your VPC and applicable restrictions, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html#VPC_Sizing">VPC and Subnet Sizing</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Attaches an internet gateway to a VPC, enabling connectivity between the internet and the VPC. For more information about your VPC and internet gateway, see the <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/">Amazon Virtual Private Cloud User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInternetGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AttachInternetGatewayRequest
 */
- (AWSTask *)attachInternetGateway:(AWSEC2AttachInternetGatewayRequest *)request;

/**
 <p>Attaches an internet gateway to a VPC, enabling connectivity between the internet and the VPC. For more information about your VPC and internet gateway, see the <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/">Amazon Virtual Private Cloud User Guide</a>.</p>
 
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
 <p>Attaches an EBS volume to a running or stopped instance and exposes it to the instance with the specified device name.</p><p>Encrypted EBS volumes may only be attached to instances that support Amazon EBS encryption. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For a list of supported device names, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html">Attaching an EBS Volume to an Instance</a>. Any device names that aren't reserved for instance store volumes can be used for EBS volumes. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html">Amazon EC2 Instance Store</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>If a volume has an AWS Marketplace product code:</p><ul><li><p>The volume can be attached only to a stopped instance.</p></li><li><p>AWS Marketplace product codes are copied from the volume to the instance.</p></li><li><p>You must be subscribed to the product.</p></li><li><p>The instance type and operating system of the instance must support the product. For example, you can't detach a volume from a Windows instance and attach it to a Linux instance.</p></li></ul><p>For more information about EBS volumes, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html">Attaching Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2VolumeAttachment`.
 
 @see AWSEC2AttachVolumeRequest
 @see AWSEC2VolumeAttachment
 */
- (AWSTask<AWSEC2VolumeAttachment *> *)attachVolume:(AWSEC2AttachVolumeRequest *)request;

/**
 <p>Attaches an EBS volume to a running or stopped instance and exposes it to the instance with the specified device name.</p><p>Encrypted EBS volumes may only be attached to instances that support Amazon EBS encryption. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For a list of supported device names, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html">Attaching an EBS Volume to an Instance</a>. Any device names that aren't reserved for instance store volumes can be used for EBS volumes. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html">Amazon EC2 Instance Store</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>If a volume has an AWS Marketplace product code:</p><ul><li><p>The volume can be attached only to a stopped instance.</p></li><li><p>AWS Marketplace product codes are copied from the volume to the instance.</p></li><li><p>You must be subscribed to the product.</p></li><li><p>The instance type and operating system of the instance must support the product. For example, you can't detach a volume from a Windows instance and attach it to a Linux instance.</p></li></ul><p>For more information about EBS volumes, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html">Attaching Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AttachVolumeRequest
 @see AWSEC2VolumeAttachment
 */
- (void)attachVolume:(AWSEC2AttachVolumeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2VolumeAttachment * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches a virtual private gateway to a VPC. You can attach one virtual private gateway to one VPC at a time.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachVpnGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AttachVpnGatewayResult`.
 
 @see AWSEC2AttachVpnGatewayRequest
 @see AWSEC2AttachVpnGatewayResult
 */
- (AWSTask<AWSEC2AttachVpnGatewayResult *> *)attachVpnGateway:(AWSEC2AttachVpnGatewayRequest *)request;

/**
 <p>Attaches a virtual private gateway to a VPC. You can attach one virtual private gateway to one VPC at a time.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachVpnGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AttachVpnGatewayRequest
 @see AWSEC2AttachVpnGatewayResult
 */
- (void)attachVpnGateway:(AWSEC2AttachVpnGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2AttachVpnGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>[EC2-VPC only] Adds one or more egress rules to a security group for use with a VPC. Specifically, this action permits instances to send traffic to one or more destination IPv4 or IPv6 CIDR address ranges, or to one or more destination security groups for the same VPC. This action doesn't apply to security groups for use in EC2-Classic. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. For more information about security group limits, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Appendix_Limits.html">Amazon VPC Limits</a>.</p><p>Each rule consists of the protocol (for example, TCP), plus either a CIDR range or a source group. For the TCP and UDP protocols, you must also specify the destination port or port range. For the ICMP protocol, you must also specify the ICMP type and code. You can use -1 for the type or code to mean all types or all codes. You can optionally specify a description for the rule.</p><p>Rule changes are propagated to affected instances as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSecurityGroupEgress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AuthorizeSecurityGroupEgressRequest
 */
- (AWSTask *)authorizeSecurityGroupEgress:(AWSEC2AuthorizeSecurityGroupEgressRequest *)request;

/**
 <p>[EC2-VPC only] Adds one or more egress rules to a security group for use with a VPC. Specifically, this action permits instances to send traffic to one or more destination IPv4 or IPv6 CIDR address ranges, or to one or more destination security groups for the same VPC. This action doesn't apply to security groups for use in EC2-Classic. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. For more information about security group limits, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Appendix_Limits.html">Amazon VPC Limits</a>.</p><p>Each rule consists of the protocol (for example, TCP), plus either a CIDR range or a source group. For the TCP and UDP protocols, you must also specify the destination port or port range. For the ICMP protocol, you must also specify the ICMP type and code. You can use -1 for the type or code to mean all types or all codes. You can optionally specify a description for the rule.</p><p>Rule changes are propagated to affected instances as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSecurityGroupEgress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2AuthorizeSecurityGroupEgressRequest
 */
- (void)authorizeSecurityGroupEgress:(AWSEC2AuthorizeSecurityGroupEgressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more ingress rules to a security group.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p><p>[EC2-Classic] This action gives one or more IPv4 CIDR address ranges permission to access a security group in your account, or gives one or more security groups (called the <i>source groups</i>) permission to access a security group for your account. A source group can be for your own AWS account, or another. You can have up to 100 rules per group.</p><p>[EC2-VPC] This action gives one or more IPv4 or IPv6 CIDR address ranges permission to access a security group in your VPC, or gives one or more other security groups (called the <i>source groups</i>) permission to access a security group for your VPC. The security groups must all be for the same VPC or a peer VPC in a VPC peering connection. For more information about VPC security group limits, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Appendix_Limits.html">Amazon VPC Limits</a>.</p><p>You can optionally specify a description for the security group rule.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AuthorizeSecurityGroupIngressRequest
 */
- (AWSTask *)authorizeSecurityGroupIngress:(AWSEC2AuthorizeSecurityGroupIngressRequest *)request;

/**
 <p>Adds one or more ingress rules to a security group.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p><p>[EC2-Classic] This action gives one or more IPv4 CIDR address ranges permission to access a security group in your account, or gives one or more security groups (called the <i>source groups</i>) permission to access a security group for your account. A source group can be for your own AWS account, or another. You can have up to 100 rules per group.</p><p>[EC2-VPC] This action gives one or more IPv4 or IPv6 CIDR address ranges permission to access a security group in your VPC, or gives one or more other security groups (called the <i>source groups</i>) permission to access a security group for your VPC. The security groups must all be for the same VPC or a peer VPC in a VPC peering connection. For more information about VPC security group limits, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Appendix_Limits.html">Amazon VPC Limits</a>.</p><p>You can optionally specify a description for the security group rule.</p>
 
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
 <p>Cancels an active conversion task. The task can be the import of an instance or volume. The action removes all artifacts of the conversion, including a partially uploaded volume or instance. If the conversion is complete or is in the process of transferring the final disk image, the command fails and returns an exception.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html">Importing a Virtual Machine Using the Amazon EC2 CLI</a>.</p>
 
 @param request A container for the necessary parameters to execute the CancelConversionTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CancelConversionRequest
 */
- (AWSTask *)cancelConversionTask:(AWSEC2CancelConversionRequest *)request;

/**
 <p>Cancels an active conversion task. The task can be the import of an instance or volume. The action removes all artifacts of the conversion, including a partially uploaded volume or instance. If the conversion is complete or is in the process of transferring the final disk image, the command fails and returns an exception.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html">Importing a Virtual Machine Using the Amazon EC2 CLI</a>.</p>
 
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
 <p>Cancels the specified Reserved Instance listing in the Reserved Instance Marketplace.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CancelReservedInstancesListing service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CancelReservedInstancesListingResult`.
 
 @see AWSEC2CancelReservedInstancesListingRequest
 @see AWSEC2CancelReservedInstancesListingResult
 */
- (AWSTask<AWSEC2CancelReservedInstancesListingResult *> *)cancelReservedInstancesListing:(AWSEC2CancelReservedInstancesListingRequest *)request;

/**
 <p>Cancels the specified Reserved Instance listing in the Reserved Instance Marketplace.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Copies the specified Amazon FPGA Image (AFI) to the current region.</p>
 
 @param request A container for the necessary parameters to execute the CopyFpgaImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplicateFpgaImageResult`.
 
 @see AWSEC2ReplicateFpgaImageRequest
 @see AWSEC2ReplicateFpgaImageResult
 */
- (AWSTask<AWSEC2ReplicateFpgaImageResult *> *)replicateFpgaImage:(AWSEC2ReplicateFpgaImageRequest *)request;

/**
 <p>Copies the specified Amazon FPGA Image (AFI) to the current region.</p>
 
 @param request A container for the necessary parameters to execute the CopyFpgaImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplicateFpgaImageRequest
 @see AWSEC2ReplicateFpgaImageResult
 */
- (void)replicateFpgaImage:(AWSEC2ReplicateFpgaImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplicateFpgaImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates the copy of an AMI from the specified source region to the current region. You specify the destination region by using its endpoint when making the request.</p><p>Copies of encrypted backing snapshots for the AMI are encrypted. Copies of unencrypted backing snapshots remain unencrypted, unless you set <code>Encrypted</code> during the copy operation. You cannot create an unencrypted copy of an encrypted backing snapshot.</p><p>For more information about the prerequisites and limits when copying an AMI, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html">Copying an AMI</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CopyImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplicateImageResult`.
 
 @see AWSEC2ReplicateImageRequest
 @see AWSEC2ReplicateImageResult
 */
- (AWSTask<AWSEC2ReplicateImageResult *> *)replicateImage:(AWSEC2ReplicateImageRequest *)request;

/**
 <p>Initiates the copy of an AMI from the specified source region to the current region. You specify the destination region by using its endpoint when making the request.</p><p>Copies of encrypted backing snapshots for the AMI are encrypted. Copies of unencrypted backing snapshots remain unencrypted, unless you set <code>Encrypted</code> during the copy operation. You cannot create an unencrypted copy of an encrypted backing snapshot.</p><p>For more information about the prerequisites and limits when copying an AMI, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html">Copying an AMI</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CopyImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplicateImageRequest
 @see AWSEC2ReplicateImageResult
 */
- (void)replicateImage:(AWSEC2ReplicateImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplicateImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Copies a point-in-time snapshot of an EBS volume and stores it in Amazon S3. You can copy the snapshot within the same region or from one region to another. You can use the snapshot to create EBS volumes or Amazon Machine Images (AMIs). The snapshot is copied to the regional endpoint that you send the HTTP request to.</p><p>Copies of encrypted EBS snapshots remain encrypted. Copies of unencrypted snapshots remain unencrypted, unless the <code>Encrypted</code> flag is specified during the snapshot copy operation. By default, encrypted snapshot copies use the default AWS Key Management Service (AWS KMS) customer master key (CMK); however, you can specify a non-default CMK with the <code>KmsKeyId</code> parameter.</p><p>To copy an encrypted snapshot that has been shared from another account, you must have permissions for the CMK used to encrypt the snapshot.</p><p>Snapshots created by copying another snapshot have an arbitrary volume ID that should not be used for any purpose.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html">Copying an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CopySnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplicateSnapshotResult`.
 
 @see AWSEC2ReplicateSnapshotRequest
 @see AWSEC2ReplicateSnapshotResult
 */
- (AWSTask<AWSEC2ReplicateSnapshotResult *> *)replicateSnapshot:(AWSEC2ReplicateSnapshotRequest *)request;

/**
 <p>Copies a point-in-time snapshot of an EBS volume and stores it in Amazon S3. You can copy the snapshot within the same region or from one region to another. You can use the snapshot to create EBS volumes or Amazon Machine Images (AMIs). The snapshot is copied to the regional endpoint that you send the HTTP request to.</p><p>Copies of encrypted EBS snapshots remain encrypted. Copies of unencrypted snapshots remain unencrypted, unless the <code>Encrypted</code> flag is specified during the snapshot copy operation. By default, encrypted snapshot copies use the default AWS Key Management Service (AWS KMS) customer master key (CMK); however, you can specify a non-default CMK with the <code>KmsKeyId</code> parameter.</p><p>To copy an encrypted snapshot that has been shared from another account, you must have permissions for the CMK used to encrypt the snapshot.</p><p>Snapshots created by copying another snapshot have an arbitrary volume ID that should not be used for any purpose.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html">Copying an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CopySnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplicateSnapshotRequest
 @see AWSEC2ReplicateSnapshotResult
 */
- (void)replicateSnapshot:(AWSEC2ReplicateSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplicateSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Capacity Reservation with the specified attributes.</p><p>Capacity Reservations enable you to reserve capacity for your Amazon EC2 instances in a specific Availability Zone for any duration. This gives you the flexibility to selectively add capacity reservations and still get the Regional RI discounts for that usage. By creating Capacity Reservations, you ensure that you always have access to Amazon EC2 capacity when you need it, for as long as you need it. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html">Capacity Reservations</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Your request to create a Capacity Reservation could fail if Amazon EC2 does not have sufficient capacity to fulfill the request. If your request fails due to Amazon EC2 capacity constraints, either try again at a later time, try in a different Availability Zone, or request a smaller capacity reservation. If your application is flexible across instance types and sizes, try to create a Capacity Reservation with different instance attributes.</p><p>Your request could also fail if the requested quantity exceeds your On-Demand Instance limit for the selected instance type. If your request fails due to limit constraints, increase your On-Demand Instance limit for the required instance type and try again. For more information about increasing your instance limits, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html">Amazon EC2 Service Limits</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCapacityReservation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateCapacityReservationResult`.
 
 @see AWSEC2CreateCapacityReservationRequest
 @see AWSEC2CreateCapacityReservationResult
 */
- (AWSTask<AWSEC2CreateCapacityReservationResult *> *)createCapacityReservation:(AWSEC2CreateCapacityReservationRequest *)request;

/**
 <p>Creates a new Capacity Reservation with the specified attributes.</p><p>Capacity Reservations enable you to reserve capacity for your Amazon EC2 instances in a specific Availability Zone for any duration. This gives you the flexibility to selectively add capacity reservations and still get the Regional RI discounts for that usage. By creating Capacity Reservations, you ensure that you always have access to Amazon EC2 capacity when you need it, for as long as you need it. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html">Capacity Reservations</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Your request to create a Capacity Reservation could fail if Amazon EC2 does not have sufficient capacity to fulfill the request. If your request fails due to Amazon EC2 capacity constraints, either try again at a later time, try in a different Availability Zone, or request a smaller capacity reservation. If your application is flexible across instance types and sizes, try to create a Capacity Reservation with different instance attributes.</p><p>Your request could also fail if the requested quantity exceeds your On-Demand Instance limit for the selected instance type. If your request fails due to limit constraints, increase your On-Demand Instance limit for the required instance type and try again. For more information about increasing your instance limits, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html">Amazon EC2 Service Limits</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCapacityReservation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateCapacityReservationRequest
 @see AWSEC2CreateCapacityReservationResult
 */
- (void)createCapacityReservation:(AWSEC2CreateCapacityReservationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateCapacityReservationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information to AWS about your VPN customer gateway device. The customer gateway is the appliance at your end of the VPN connection. (The device on the AWS side of the VPN connection is the virtual private gateway.) You must provide the Internet-routable IP address of the customer gateway's external interface. The IP address must be static and may be behind a device performing network address translation (NAT).</p><p>For devices that use Border Gateway Protocol (BGP), you can also provide the device's BGP Autonomous System Number (ASN). You can use an existing ASN assigned to your network. If you don't have an ASN already, you can use a private ASN (in the 64512 - 65534 range).</p><note><p>Amazon EC2 supports all 2-byte ASN numbers in the range of 1 - 65534, with the exception of 7224, which is reserved in the <code>us-east-1</code> region, and 9059, which is reserved in the <code>eu-west-1</code> region.</p></note><p>For more information about VPN customer gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><important><p>You cannot create more than one customer gateway with the same VPN type, IP address, and BGP ASN parameter values. If you run an identical request more than one time, the first request creates the customer gateway, and subsequent requests return information about the existing customer gateway. The subsequent requests do not create new customer gateway resources.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateCustomerGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateCustomerGatewayResult`.
 
 @see AWSEC2CreateCustomerGatewayRequest
 @see AWSEC2CreateCustomerGatewayResult
 */
- (AWSTask<AWSEC2CreateCustomerGatewayResult *> *)createCustomerGateway:(AWSEC2CreateCustomerGatewayRequest *)request;

/**
 <p>Provides information to AWS about your VPN customer gateway device. The customer gateway is the appliance at your end of the VPN connection. (The device on the AWS side of the VPN connection is the virtual private gateway.) You must provide the Internet-routable IP address of the customer gateway's external interface. The IP address must be static and may be behind a device performing network address translation (NAT).</p><p>For devices that use Border Gateway Protocol (BGP), you can also provide the device's BGP Autonomous System Number (ASN). You can use an existing ASN assigned to your network. If you don't have an ASN already, you can use a private ASN (in the 64512 - 65534 range).</p><note><p>Amazon EC2 supports all 2-byte ASN numbers in the range of 1 - 65534, with the exception of 7224, which is reserved in the <code>us-east-1</code> region, and 9059, which is reserved in the <code>eu-west-1</code> region.</p></note><p>For more information about VPN customer gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><important><p>You cannot create more than one customer gateway with the same VPN type, IP address, and BGP ASN parameter values. If you run an identical request more than one time, the first request creates the customer gateway, and subsequent requests return information about the existing customer gateway. The subsequent requests do not create new customer gateway resources.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateCustomerGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateCustomerGatewayRequest
 @see AWSEC2CreateCustomerGatewayResult
 */
- (void)createCustomerGateway:(AWSEC2CreateCustomerGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateCustomerGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a default subnet with a size <code>/20</code> IPv4 CIDR block in the specified Availability Zone in your default VPC. You can have only one default subnet per Availability Zone. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/default-vpc.html#create-default-subnet">Creating a Default Subnet</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDefaultSubnet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateDefaultSubnetResult`.
 
 @see AWSEC2CreateDefaultSubnetRequest
 @see AWSEC2CreateDefaultSubnetResult
 */
- (AWSTask<AWSEC2CreateDefaultSubnetResult *> *)createDefaultSubnet:(AWSEC2CreateDefaultSubnetRequest *)request;

/**
 <p>Creates a default subnet with a size <code>/20</code> IPv4 CIDR block in the specified Availability Zone in your default VPC. You can have only one default subnet per Availability Zone. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/default-vpc.html#create-default-subnet">Creating a Default Subnet</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDefaultSubnet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateDefaultSubnetRequest
 @see AWSEC2CreateDefaultSubnetResult
 */
- (void)createDefaultSubnet:(AWSEC2CreateDefaultSubnetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateDefaultSubnetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a default VPC with a size <code>/16</code> IPv4 CIDR block and a default subnet in each Availability Zone. For more information about the components of a default VPC, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/default-vpc.html">Default VPC and Default Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. You cannot specify the components of the default VPC yourself.</p><p>If you deleted your previous default VPC, you can create a default VPC. You cannot have more than one default VPC per Region.</p><p>If your account supports EC2-Classic, you cannot use this action to create a default VPC in a Region that supports EC2-Classic. If you want a default VPC in a Region that supports EC2-Classic, see "I really want a default VPC for my existing EC2 account. Is that possible?" in the <a href="http://aws.amazon.com/vpc/faqs/#Default_VPCs">Default VPCs FAQ</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDefaultVpc service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateDefaultVpcResult`.
 
 @see AWSEC2CreateDefaultVpcRequest
 @see AWSEC2CreateDefaultVpcResult
 */
- (AWSTask<AWSEC2CreateDefaultVpcResult *> *)createDefaultVpc:(AWSEC2CreateDefaultVpcRequest *)request;

/**
 <p>Creates a default VPC with a size <code>/16</code> IPv4 CIDR block and a default subnet in each Availability Zone. For more information about the components of a default VPC, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/default-vpc.html">Default VPC and Default Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. You cannot specify the components of the default VPC yourself.</p><p>If you deleted your previous default VPC, you can create a default VPC. You cannot have more than one default VPC per Region.</p><p>If your account supports EC2-Classic, you cannot use this action to create a default VPC in a Region that supports EC2-Classic. If you want a default VPC in a Region that supports EC2-Classic, see "I really want a default VPC for my existing EC2 account. Is that possible?" in the <a href="http://aws.amazon.com/vpc/faqs/#Default_VPCs">Default VPCs FAQ</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDefaultVpc service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateDefaultVpcRequest
 @see AWSEC2CreateDefaultVpcResult
 */
- (void)createDefaultVpc:(AWSEC2CreateDefaultVpcRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateDefaultVpcResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a set of DHCP options for your VPC. After creating the set, you must associate it with the VPC, causing all existing and new instances that you launch in the VPC to use this set of DHCP options. The following are the individual DHCP options you can specify. For more information about the options, see <a href="http://www.ietf.org/rfc/rfc2132.txt">RFC 2132</a>.</p><ul><li><p><code>domain-name-servers</code> - The IP addresses of up to four domain name servers, or AmazonProvidedDNS. The default DHCP option set specifies AmazonProvidedDNS. If specifying more than one domain name server, specify the IP addresses in a single parameter, separated by commas. ITo have your instance to receive a custom DNS hostname as specified in <code>domain-name</code>, you must set <code>domain-name-servers</code> to a custom DNS server.</p></li><li><p><code>domain-name</code> - If you're using AmazonProvidedDNS in <code>us-east-1</code>, specify <code>ec2.internal</code>. If you're using AmazonProvidedDNS in another region, specify <code>region.compute.internal</code> (for example, <code>ap-northeast-1.compute.internal</code>). Otherwise, specify a domain name (for example, <code>MyCompany.com</code>). This value is used to complete unqualified DNS hostnames. <b>Important</b>: Some Linux operating systems accept multiple domain names separated by spaces. However, Windows and other Linux operating systems treat the value as a single domain, which results in unexpected behavior. If your DHCP options set is associated with a VPC that has instances with multiple operating systems, specify only one domain name.</p></li><li><p><code>ntp-servers</code> - The IP addresses of up to four Network Time Protocol (NTP) servers.</p></li><li><p><code>netbios-name-servers</code> - The IP addresses of up to four NetBIOS name servers.</p></li><li><p><code>netbios-node-type</code> - The NetBIOS node type (1, 2, 4, or 8). We recommend that you specify 2 (broadcast and multicast are not currently supported). For more information about these node types, see <a href="http://www.ietf.org/rfc/rfc2132.txt">RFC 2132</a>.</p></li></ul><p>Your VPC automatically starts out with a set of DHCP options that includes only a DNS server that we provide (AmazonProvidedDNS). If you create a set of options, and if your VPC has an internet gateway, make sure to set the <code>domain-name-servers</code> option either to <code>AmazonProvidedDNS</code> or to a domain name server of your choice. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDhcpOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateDhcpOptionsResult`.
 
 @see AWSEC2CreateDhcpOptionsRequest
 @see AWSEC2CreateDhcpOptionsResult
 */
- (AWSTask<AWSEC2CreateDhcpOptionsResult *> *)createDhcpOptions:(AWSEC2CreateDhcpOptionsRequest *)request;

/**
 <p>Creates a set of DHCP options for your VPC. After creating the set, you must associate it with the VPC, causing all existing and new instances that you launch in the VPC to use this set of DHCP options. The following are the individual DHCP options you can specify. For more information about the options, see <a href="http://www.ietf.org/rfc/rfc2132.txt">RFC 2132</a>.</p><ul><li><p><code>domain-name-servers</code> - The IP addresses of up to four domain name servers, or AmazonProvidedDNS. The default DHCP option set specifies AmazonProvidedDNS. If specifying more than one domain name server, specify the IP addresses in a single parameter, separated by commas. ITo have your instance to receive a custom DNS hostname as specified in <code>domain-name</code>, you must set <code>domain-name-servers</code> to a custom DNS server.</p></li><li><p><code>domain-name</code> - If you're using AmazonProvidedDNS in <code>us-east-1</code>, specify <code>ec2.internal</code>. If you're using AmazonProvidedDNS in another region, specify <code>region.compute.internal</code> (for example, <code>ap-northeast-1.compute.internal</code>). Otherwise, specify a domain name (for example, <code>MyCompany.com</code>). This value is used to complete unqualified DNS hostnames. <b>Important</b>: Some Linux operating systems accept multiple domain names separated by spaces. However, Windows and other Linux operating systems treat the value as a single domain, which results in unexpected behavior. If your DHCP options set is associated with a VPC that has instances with multiple operating systems, specify only one domain name.</p></li><li><p><code>ntp-servers</code> - The IP addresses of up to four Network Time Protocol (NTP) servers.</p></li><li><p><code>netbios-name-servers</code> - The IP addresses of up to four NetBIOS name servers.</p></li><li><p><code>netbios-node-type</code> - The NetBIOS node type (1, 2, 4, or 8). We recommend that you specify 2 (broadcast and multicast are not currently supported). For more information about these node types, see <a href="http://www.ietf.org/rfc/rfc2132.txt">RFC 2132</a>.</p></li></ul><p>Your VPC automatically starts out with a set of DHCP options that includes only a DNS server that we provide (AmazonProvidedDNS). If you create a set of options, and if your VPC has an internet gateway, make sure to set the <code>domain-name-servers</code> option either to <code>AmazonProvidedDNS</code> or to a domain name server of your choice. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Launches an EC2 Fleet.</p><p>You can create a single EC2 Fleet that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet.html">Launching an EC2 Fleet</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateFleetResult`.
 
 @see AWSEC2CreateFleetRequest
 @see AWSEC2CreateFleetResult
 */
- (AWSTask<AWSEC2CreateFleetResult *> *)createFleet:(AWSEC2CreateFleetRequest *)request;

/**
 <p>Launches an EC2 Fleet.</p><p>You can create a single EC2 Fleet that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet.html">Launching an EC2 Fleet</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateFleetRequest
 @see AWSEC2CreateFleetResult
 */
- (void)createFleet:(AWSEC2CreateFleetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateFleetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates one or more flow logs to capture information about IP traffic for a specific network interface, subnet, or VPC. </p><p>Flow log data for a monitored network interface is recorded as flow log records, which are log events consisting of fields that describe the traffic flow. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/flow-logs.html#flow-log-records">Flow Log Records</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>When publishing to CloudWatch Logs, flow log records are published to a log group, and each network interface has a unique log stream in the log group. When publishing to Amazon S3, flow log records for all of the monitored network interfaces are published to a single log file object that is stored in the specified bucket.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/flow-logs.html">VPC Flow Logs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFlowLogs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateFlowLogsResult`.
 
 @see AWSEC2CreateFlowLogsRequest
 @see AWSEC2CreateFlowLogsResult
 */
- (AWSTask<AWSEC2CreateFlowLogsResult *> *)createFlowLogs:(AWSEC2CreateFlowLogsRequest *)request;

/**
 <p>Creates one or more flow logs to capture information about IP traffic for a specific network interface, subnet, or VPC. </p><p>Flow log data for a monitored network interface is recorded as flow log records, which are log events consisting of fields that describe the traffic flow. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/flow-logs.html#flow-log-records">Flow Log Records</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>When publishing to CloudWatch Logs, flow log records are published to a log group, and each network interface has a unique log stream in the log group. When publishing to Amazon S3, flow log records for all of the monitored network interfaces are published to a single log file object that is stored in the specified bucket.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/flow-logs.html">VPC Flow Logs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFlowLogs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateFlowLogsRequest
 @see AWSEC2CreateFlowLogsResult
 */
- (void)createFlowLogs:(AWSEC2CreateFlowLogsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateFlowLogsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon FPGA Image (AFI) from the specified design checkpoint (DCP).</p><p>The create operation is asynchronous. To verify that the AFI is ready for use, check the output logs.</p><p>An AFI contains the FPGA bitstream that is ready to download to an FPGA. You can securely deploy an AFI on one or more FPGA-accelerated instances. For more information, see the <a href="https://github.com/aws/aws-fpga/">AWS FPGA Hardware Development Kit</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFpgaImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateFpgaImageResult`.
 
 @see AWSEC2CreateFpgaImageRequest
 @see AWSEC2CreateFpgaImageResult
 */
- (AWSTask<AWSEC2CreateFpgaImageResult *> *)createFpgaImage:(AWSEC2CreateFpgaImageRequest *)request;

/**
 <p>Creates an Amazon FPGA Image (AFI) from the specified design checkpoint (DCP).</p><p>The create operation is asynchronous. To verify that the AFI is ready for use, check the output logs.</p><p>An AFI contains the FPGA bitstream that is ready to download to an FPGA. You can securely deploy an AFI on one or more FPGA-accelerated instances. For more information, see the <a href="https://github.com/aws/aws-fpga/">AWS FPGA Hardware Development Kit</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFpgaImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateFpgaImageRequest
 @see AWSEC2CreateFpgaImageResult
 */
- (void)createFpgaImage:(AWSEC2CreateFpgaImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateFpgaImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon EBS-backed AMI from an Amazon EBS-backed instance that is either running or stopped.</p><p>If you customized your instance with instance store volumes or EBS volumes in addition to the root device volume, the new AMI contains block device mapping information for those volumes. When you launch an instance from this new AMI, the instance automatically launches with those additional volumes.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html">Creating Amazon EBS-Backed Linux AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateImageResult`.
 
 @see AWSEC2CreateImageRequest
 @see AWSEC2CreateImageResult
 */
- (AWSTask<AWSEC2CreateImageResult *> *)createImage:(AWSEC2CreateImageRequest *)request;

/**
 <p>Creates an Amazon EBS-backed AMI from an Amazon EBS-backed instance that is either running or stopped.</p><p>If you customized your instance with instance store volumes or EBS volumes in addition to the root device volume, the new AMI contains block device mapping information for those volumes. When you launch an instance from this new AMI, the instance automatically launches with those additional volumes.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html">Creating Amazon EBS-Backed Linux AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateImageRequest
 @see AWSEC2CreateImageResult
 */
- (void)createImage:(AWSEC2CreateImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Exports a running or stopped instance to an S3 bucket.</p><p>For information about the supported operating systems, image formats, and known limitations for the types of instances you can export, see <a href="http://docs.aws.amazon.com/vm-import/latest/userguide/vmexport.html">Exporting an Instance as a VM Using VM Import/Export</a> in the <i>VM Import/Export User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstanceExportTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateInstanceExportTaskResult`.
 
 @see AWSEC2CreateInstanceExportTaskRequest
 @see AWSEC2CreateInstanceExportTaskResult
 */
- (AWSTask<AWSEC2CreateInstanceExportTaskResult *> *)createInstanceExportTask:(AWSEC2CreateInstanceExportTaskRequest *)request;

/**
 <p>Exports a running or stopped instance to an S3 bucket.</p><p>For information about the supported operating systems, image formats, and known limitations for the types of instances you can export, see <a href="http://docs.aws.amazon.com/vm-import/latest/userguide/vmexport.html">Exporting an Instance as a VM Using VM Import/Export</a> in the <i>VM Import/Export User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstanceExportTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateInstanceExportTaskRequest
 @see AWSEC2CreateInstanceExportTaskResult
 */
- (void)createInstanceExportTask:(AWSEC2CreateInstanceExportTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateInstanceExportTaskResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an internet gateway for use with a VPC. After creating the internet gateway, you attach it to a VPC using <a>AttachInternetGateway</a>.</p><p>For more information about your VPC and internet gateway, see the <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/">Amazon Virtual Private Cloud User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInternetGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateInternetGatewayResult`.
 
 @see AWSEC2CreateInternetGatewayRequest
 @see AWSEC2CreateInternetGatewayResult
 */
- (AWSTask<AWSEC2CreateInternetGatewayResult *> *)createInternetGateway:(AWSEC2CreateInternetGatewayRequest *)request;

/**
 <p>Creates an internet gateway for use with a VPC. After creating the internet gateway, you attach it to a VPC using <a>AttachInternetGateway</a>.</p><p>For more information about your VPC and internet gateway, see the <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/">Amazon Virtual Private Cloud User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInternetGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateInternetGatewayRequest
 @see AWSEC2CreateInternetGatewayResult
 */
- (void)createInternetGateway:(AWSEC2CreateInternetGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateInternetGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a 2048-bit RSA key pair with the specified name. Amazon EC2 stores the public key and displays the private key for you to save to a file. The private key is returned as an unencrypted PEM encoded PKCS#1 private key. If a key with the specified name already exists, Amazon EC2 returns an error.</p><p>You can have up to five thousand key pairs per region.</p><p>The key pair returned to you is available only in the region in which you create it. If you prefer, you can create your own key pair using a third-party tool and upload it to any region using <a>ImportKeyPair</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateKeyPair service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2KeyPair`.
 
 @see AWSEC2CreateKeyPairRequest
 @see AWSEC2KeyPair
 */
- (AWSTask<AWSEC2KeyPair *> *)createKeyPair:(AWSEC2CreateKeyPairRequest *)request;

/**
 <p>Creates a 2048-bit RSA key pair with the specified name. Amazon EC2 stores the public key and displays the private key for you to save to a file. The private key is returned as an unencrypted PEM encoded PKCS#1 private key. If a key with the specified name already exists, Amazon EC2 returns an error.</p><p>You can have up to five thousand key pairs per region.</p><p>The key pair returned to you is available only in the region in which you create it. If you prefer, you can create your own key pair using a third-party tool and upload it to any region using <a>ImportKeyPair</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Creates a NAT gateway in the specified public subnet. This action creates a network interface in the specified subnet with a private IP address from the IP address range of the subnet. Internet-bound traffic from a private subnet can be routed to the NAT gateway, therefore enabling instances in the private subnet to connect to the internet. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-nat-gateway.html">NAT Gateways</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNatGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateNatGatewayResult`.
 
 @see AWSEC2CreateNatGatewayRequest
 @see AWSEC2CreateNatGatewayResult
 */
- (AWSTask<AWSEC2CreateNatGatewayResult *> *)createNatGateway:(AWSEC2CreateNatGatewayRequest *)request;

/**
 <p>Creates a NAT gateway in the specified public subnet. This action creates a network interface in the specified subnet with a private IP address from the IP address range of the subnet. Internet-bound traffic from a private subnet can be routed to the NAT gateway, therefore enabling instances in the private subnet to connect to the internet. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-nat-gateway.html">NAT Gateways</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNatGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateNatGatewayRequest
 @see AWSEC2CreateNatGatewayResult
 */
- (void)createNatGateway:(AWSEC2CreateNatGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateNatGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a network ACL in a VPC. Network ACLs provide an optional layer of security (in addition to security groups) for the instances in your VPC.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkAcl service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateNetworkAclResult`.
 
 @see AWSEC2CreateNetworkAclRequest
 @see AWSEC2CreateNetworkAclResult
 */
- (AWSTask<AWSEC2CreateNetworkAclResult *> *)createNetworkAcl:(AWSEC2CreateNetworkAclRequest *)request;

/**
 <p>Creates a network ACL in a VPC. Network ACLs provide an optional layer of security (in addition to security groups) for the instances in your VPC.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkAcl service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateNetworkAclRequest
 @see AWSEC2CreateNetworkAclResult
 */
- (void)createNetworkAcl:(AWSEC2CreateNetworkAclRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateNetworkAclResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an entry (a rule) in a network ACL with the specified rule number. Each network ACL has a set of numbered ingress rules and a separate set of numbered egress rules. When determining whether a packet should be allowed in or out of a subnet associated with the ACL, we process the entries in the ACL according to the rule numbers, in ascending order. Each network ACL has a set of ingress rules and a separate set of egress rules.</p><p>We recommend that you leave room between the rule numbers (for example, 100, 110, 120, ...), and not number them one right after the other (for example, 101, 102, 103, ...). This makes it easier to add a rule between existing ones without having to renumber the rules.</p><p>After you add an entry, you can't modify it; you must either replace it, or create an entry and delete the old one.</p><p>For more information about network ACLs, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkAclEntry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreateNetworkAclEntryRequest
 */
- (AWSTask *)createNetworkAclEntry:(AWSEC2CreateNetworkAclEntryRequest *)request;

/**
 <p>Creates an entry (a rule) in a network ACL with the specified rule number. Each network ACL has a set of numbered ingress rules and a separate set of numbered egress rules. When determining whether a packet should be allowed in or out of a subnet associated with the ACL, we process the entries in the ACL according to the rule numbers, in ascending order. Each network ACL has a set of ingress rules and a separate set of egress rules.</p><p>We recommend that you leave room between the rule numbers (for example, 100, 110, 120, ...), and not number them one right after the other (for example, 101, 102, 103, ...). This makes it easier to add a rule between existing ones without having to renumber the rules.</p><p>After you add an entry, you can't modify it; you must either replace it, or create an entry and delete the old one.</p><p>For more information about network ACLs, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkAclEntry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateNetworkAclEntryRequest
 */
- (void)createNetworkAclEntry:(AWSEC2CreateNetworkAclEntryRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a network interface in the specified subnet.</p><p>For more information about network interfaces, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html">Elastic Network Interfaces</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkInterface service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateNetworkInterfaceResult`.
 
 @see AWSEC2CreateNetworkInterfaceRequest
 @see AWSEC2CreateNetworkInterfaceResult
 */
- (AWSTask<AWSEC2CreateNetworkInterfaceResult *> *)createNetworkInterface:(AWSEC2CreateNetworkInterfaceRequest *)request;

/**
 <p>Creates a network interface in the specified subnet.</p><p>For more information about network interfaces, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html">Elastic Network Interfaces</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Creates a placement group in which to launch instances. The strategy of the placement group determines how the instances are organized within the group. </p><p>A <code>cluster</code> placement group is a logical grouping of instances within a single Availability Zone that benefit from low network latency, high network throughput. A <code>spread</code> placement group places instances on distinct hardware.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePlacementGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreatePlacementGroupRequest
 */
- (AWSTask *)createPlacementGroup:(AWSEC2CreatePlacementGroupRequest *)request;

/**
 <p>Creates a placement group in which to launch instances. The strategy of the placement group determines how the instances are organized within the group. </p><p>A <code>cluster</code> placement group is a logical grouping of instances within a single Availability Zone that benefit from low network latency, high network throughput. A <code>spread</code> placement group places instances on distinct hardware.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePlacementGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreatePlacementGroupRequest
 */
- (void)createPlacementGroup:(AWSEC2CreatePlacementGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a listing for Amazon EC2 Standard Reserved Instances to be sold in the Reserved Instance Marketplace. You can submit one Standard Reserved Instance listing at a time. To get a list of your Standard Reserved Instances, you can use the <a>DescribeReservedInstances</a> operation.</p><note><p>Only Standard Reserved Instances with a capacity reservation can be sold in the Reserved Instance Marketplace. Convertible Reserved Instances and Standard Reserved Instances with a regional benefit cannot be sold.</p></note><p>The Reserved Instance Marketplace matches sellers who want to resell Standard Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances.</p><p>To sell your Standard Reserved Instances, you must first register as a seller in the Reserved Instance Marketplace. After completing the registration process, you can create a Reserved Instance Marketplace listing of some or all of your Standard Reserved Instances, and specify the upfront price to receive for them. Your Standard Reserved Instance listings then become available for purchase. To view the details of your Standard Reserved Instance listing, you can use the <a>DescribeReservedInstancesListings</a> operation.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateReservedInstancesListing service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateReservedInstancesListingResult`.
 
 @see AWSEC2CreateReservedInstancesListingRequest
 @see AWSEC2CreateReservedInstancesListingResult
 */
- (AWSTask<AWSEC2CreateReservedInstancesListingResult *> *)createReservedInstancesListing:(AWSEC2CreateReservedInstancesListingRequest *)request;

/**
 <p>Creates a listing for Amazon EC2 Standard Reserved Instances to be sold in the Reserved Instance Marketplace. You can submit one Standard Reserved Instance listing at a time. To get a list of your Standard Reserved Instances, you can use the <a>DescribeReservedInstances</a> operation.</p><note><p>Only Standard Reserved Instances with a capacity reservation can be sold in the Reserved Instance Marketplace. Convertible Reserved Instances and Standard Reserved Instances with a regional benefit cannot be sold.</p></note><p>The Reserved Instance Marketplace matches sellers who want to resell Standard Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances.</p><p>To sell your Standard Reserved Instances, you must first register as a seller in the Reserved Instance Marketplace. After completing the registration process, you can create a Reserved Instance Marketplace listing of some or all of your Standard Reserved Instances, and specify the upfront price to receive for them. Your Standard Reserved Instance listings then become available for purchase. To view the details of your Standard Reserved Instance listing, you can use the <a>DescribeReservedInstancesListings</a> operation.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateReservedInstancesListing service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateReservedInstancesListingRequest
 @see AWSEC2CreateReservedInstancesListingResult
 */
- (void)createReservedInstancesListing:(AWSEC2CreateReservedInstancesListingRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateReservedInstancesListingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a route in a route table within a VPC.</p><p>You must specify one of the following targets: internet gateway or virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, or egress-only internet gateway.</p><p>When determining how to route traffic, we use the route with the most specific match. For example, traffic is destined for the IPv4 address <code>192.0.2.3</code>, and the route table includes the following two IPv4 routes:</p><ul><li><p><code>192.0.2.0/24</code> (goes to some target A)</p></li><li><p><code>192.0.2.0/28</code> (goes to some target B)</p></li></ul><p>Both routes apply to the traffic destined for <code>192.0.2.3</code>. However, the second route in the list covers a smaller number of IP addresses and is therefore more specific, so we use that route to determine where to target the traffic.</p><p>For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateRouteResult`.
 
 @see AWSEC2CreateRouteRequest
 @see AWSEC2CreateRouteResult
 */
- (AWSTask<AWSEC2CreateRouteResult *> *)createRoute:(AWSEC2CreateRouteRequest *)request;

/**
 <p>Creates a route in a route table within a VPC.</p><p>You must specify one of the following targets: internet gateway or virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, or egress-only internet gateway.</p><p>When determining how to route traffic, we use the route with the most specific match. For example, traffic is destined for the IPv4 address <code>192.0.2.3</code>, and the route table includes the following two IPv4 routes:</p><ul><li><p><code>192.0.2.0/24</code> (goes to some target A)</p></li><li><p><code>192.0.2.0/28</code> (goes to some target B)</p></li></ul><p>Both routes apply to the traffic destined for <code>192.0.2.3</code>. However, the second route in the list covers a smaller number of IP addresses and is therefore more specific, so we use that route to determine where to target the traffic.</p><p>For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateRouteRequest
 @see AWSEC2CreateRouteResult
 */
- (void)createRoute:(AWSEC2CreateRouteRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateRouteResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a route table for the specified VPC. After you create a route table, you can add routes and associate the table with a subnet.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateRouteTableResult`.
 
 @see AWSEC2CreateRouteTableRequest
 @see AWSEC2CreateRouteTableResult
 */
- (AWSTask<AWSEC2CreateRouteTableResult *> *)createRouteTable:(AWSEC2CreateRouteTableRequest *)request;

/**
 <p>Creates a route table for the specified VPC. After you create a route table, you can add routes and associate the table with a subnet.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRouteTable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateRouteTableRequest
 @see AWSEC2CreateRouteTableResult
 */
- (void)createRouteTable:(AWSEC2CreateRouteTableRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateRouteTableResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a security group.</p><p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i> and <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><important><p>EC2-Classic: You can have up to 500 security groups.</p><p>EC2-VPC: You can create up to 500 security groups per VPC.</p></important><p>When you create a security group, you specify a friendly name of your choice. You can have a security group for use in EC2-Classic with the same name as a security group for use in a VPC. However, you can't have two security groups for use in EC2-Classic with the same name or two security groups for use in a VPC with the same name.</p><p>You have a default security group for use in EC2-Classic and a default security group for use in your VPC. If you don't specify a security group when you launch an instance, the instance is launched into the appropriate default security group. A default security group includes a default rule that grants instances unrestricted network access to each other.</p><p>You can add or remove rules from your security groups using <a>AuthorizeSecurityGroupIngress</a>, <a>AuthorizeSecurityGroupEgress</a>, <a>RevokeSecurityGroupIngress</a>, and <a>RevokeSecurityGroupEgress</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateSecurityGroupResult`.
 
 @see AWSEC2CreateSecurityGroupRequest
 @see AWSEC2CreateSecurityGroupResult
 */
- (AWSTask<AWSEC2CreateSecurityGroupResult *> *)createSecurityGroup:(AWSEC2CreateSecurityGroupRequest *)request;

/**
 <p>Creates a security group.</p><p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i> and <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><important><p>EC2-Classic: You can have up to 500 security groups.</p><p>EC2-VPC: You can create up to 500 security groups per VPC.</p></important><p>When you create a security group, you specify a friendly name of your choice. You can have a security group for use in EC2-Classic with the same name as a security group for use in a VPC. However, you can't have two security groups for use in EC2-Classic with the same name or two security groups for use in a VPC with the same name.</p><p>You have a default security group for use in EC2-Classic and a default security group for use in your VPC. If you don't specify a security group when you launch an instance, the instance is launched into the appropriate default security group. A default security group includes a default rule that grants instances unrestricted network access to each other.</p><p>You can add or remove rules from your security groups using <a>AuthorizeSecurityGroupIngress</a>, <a>AuthorizeSecurityGroupEgress</a>, <a>RevokeSecurityGroupIngress</a>, and <a>RevokeSecurityGroupEgress</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateSecurityGroupRequest
 @see AWSEC2CreateSecurityGroupResult
 */
- (void)createSecurityGroup:(AWSEC2CreateSecurityGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateSecurityGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a snapshot of an EBS volume and stores it in Amazon S3. You can use snapshots for backups, to make copies of EBS volumes, and to save data before shutting down an instance.</p><p>When a snapshot is created, any AWS Marketplace product codes that are associated with the source volume are propagated to the snapshot.</p><p>You can take a snapshot of an attached volume that is in use. However, snapshots only capture data that has been written to your EBS volume at the time the snapshot command is issued; this may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the volume long enough to take a snapshot, your snapshot should be complete. However, if you cannot pause all file writes to the volume, you should unmount the volume from within the instance, issue the snapshot command, and then remount the volume to ensure a consistent and complete snapshot. You may remount and use your volume while the snapshot status is <code>pending</code>.</p><p>To create a snapshot for EBS volumes that serve as root devices, you should stop the instance before taking the snapshot.</p><p>Snapshots that are taken from encrypted volumes are automatically encrypted. Volumes that are created from encrypted snapshots are also automatically encrypted. Your encrypted volumes and any associated snapshots always remain protected.</p><p>You can tag your snapshots during creation. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html">Amazon Elastic Block Store</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2Snapshot`.
 
 @see AWSEC2CreateSnapshotRequest
 @see AWSEC2Snapshot
 */
- (AWSTask<AWSEC2Snapshot *> *)createSnapshot:(AWSEC2CreateSnapshotRequest *)request;

/**
 <p>Creates a snapshot of an EBS volume and stores it in Amazon S3. You can use snapshots for backups, to make copies of EBS volumes, and to save data before shutting down an instance.</p><p>When a snapshot is created, any AWS Marketplace product codes that are associated with the source volume are propagated to the snapshot.</p><p>You can take a snapshot of an attached volume that is in use. However, snapshots only capture data that has been written to your EBS volume at the time the snapshot command is issued; this may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the volume long enough to take a snapshot, your snapshot should be complete. However, if you cannot pause all file writes to the volume, you should unmount the volume from within the instance, issue the snapshot command, and then remount the volume to ensure a consistent and complete snapshot. You may remount and use your volume while the snapshot status is <code>pending</code>.</p><p>To create a snapshot for EBS volumes that serve as root devices, you should stop the instance before taking the snapshot.</p><p>Snapshots that are taken from encrypted volumes are automatically encrypted. Volumes that are created from encrypted snapshots are also automatically encrypted. Your encrypted volumes and any associated snapshots always remain protected.</p><p>You can tag your snapshots during creation. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html">Amazon Elastic Block Store</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateSnapshotRequest
 @see AWSEC2Snapshot
 */
- (void)createSnapshot:(AWSEC2CreateSnapshotRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2Snapshot * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a data feed for Spot Instances, enabling you to view Spot Instance usage logs. You can create one data feed per AWS account. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html">Spot Instance Data Feed</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSpotDatafeedSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateSpotDatafeedSubscriptionResult`.
 
 @see AWSEC2CreateSpotDatafeedSubscriptionRequest
 @see AWSEC2CreateSpotDatafeedSubscriptionResult
 */
- (AWSTask<AWSEC2CreateSpotDatafeedSubscriptionResult *> *)createSpotDatafeedSubscription:(AWSEC2CreateSpotDatafeedSubscriptionRequest *)request;

/**
 <p>Creates a data feed for Spot Instances, enabling you to view Spot Instance usage logs. You can create one data feed per AWS account. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html">Spot Instance Data Feed</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSpotDatafeedSubscription service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateSpotDatafeedSubscriptionRequest
 @see AWSEC2CreateSpotDatafeedSubscriptionResult
 */
- (void)createSpotDatafeedSubscription:(AWSEC2CreateSpotDatafeedSubscriptionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateSpotDatafeedSubscriptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a subnet in an existing VPC.</p><p>When you create each subnet, you provide the VPC ID and IPv4 CIDR block for the subnet. After you create a subnet, you can't change its CIDR block. The size of the subnet's IPv4 CIDR block can be the same as a VPC's IPv4 CIDR block, or a subset of a VPC's IPv4 CIDR block. If you create more than one subnet in a VPC, the subnets' CIDR blocks must not overlap. The smallest IPv4 subnet (and VPC) you can create uses a /28 netmask (16 IPv4 addresses), and the largest uses a /16 netmask (65,536 IPv4 addresses).</p><p>If you've associated an IPv6 CIDR block with your VPC, you can create a subnet with an IPv6 CIDR block that uses a /64 prefix length. </p><important><p>AWS reserves both the first four and the last IPv4 address in each subnet's CIDR block. They're not available for use.</p></important><p>If you add more than one subnet to a VPC, they're set up in a star topology with a logical router in the middle.</p><p>If you launch an instance in a VPC using an Amazon EBS-backed AMI, the IP address doesn't change if you stop and restart the instance (unlike a similar instance launched outside a VPC, which gets a new IP address when restarted). It's therefore possible to have a subnet with no running instances (they're all stopped), but no remaining IP addresses available.</p><p>For more information about subnets, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSubnet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateSubnetResult`.
 
 @see AWSEC2CreateSubnetRequest
 @see AWSEC2CreateSubnetResult
 */
- (AWSTask<AWSEC2CreateSubnetResult *> *)createSubnet:(AWSEC2CreateSubnetRequest *)request;

/**
 <p>Creates a subnet in an existing VPC.</p><p>When you create each subnet, you provide the VPC ID and IPv4 CIDR block for the subnet. After you create a subnet, you can't change its CIDR block. The size of the subnet's IPv4 CIDR block can be the same as a VPC's IPv4 CIDR block, or a subset of a VPC's IPv4 CIDR block. If you create more than one subnet in a VPC, the subnets' CIDR blocks must not overlap. The smallest IPv4 subnet (and VPC) you can create uses a /28 netmask (16 IPv4 addresses), and the largest uses a /16 netmask (65,536 IPv4 addresses).</p><p>If you've associated an IPv6 CIDR block with your VPC, you can create a subnet with an IPv6 CIDR block that uses a /64 prefix length. </p><important><p>AWS reserves both the first four and the last IPv4 address in each subnet's CIDR block. They're not available for use.</p></important><p>If you add more than one subnet to a VPC, they're set up in a star topology with a logical router in the middle.</p><p>If you launch an instance in a VPC using an Amazon EBS-backed AMI, the IP address doesn't change if you stop and restart the instance (unlike a similar instance launched outside a VPC, which gets a new IP address when restarted). It's therefore possible to have a subnet with no running instances (they're all stopped), but no remaining IP addresses available.</p><p>For more information about subnets, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSubnet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateSubnetRequest
 @see AWSEC2CreateSubnetResult
 */
- (void)createSubnet:(AWSEC2CreateSubnetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateSubnetResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or overwrites one or more tags for the specified Amazon EC2 resource or resources. Each resource can have a maximum of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique per resource.</p><p>For more information about tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. For more information about creating IAM policies that control users' access to resources based on tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-iam-actions-resources.html">Supported Resource-Level Permissions for Amazon EC2 API Actions</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreateTagsRequest
 */
- (AWSTask *)createTags:(AWSEC2CreateTagsRequest *)request;

/**
 <p>Adds or overwrites one or more tags for the specified Amazon EC2 resource or resources. Each resource can have a maximum of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique per resource.</p><p>For more information about tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. For more information about creating IAM policies that control users' access to resources based on tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-iam-actions-resources.html">Supported Resource-Level Permissions for Amazon EC2 API Actions</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateTagsRequest
 */
- (void)createTags:(AWSEC2CreateTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates an EBS volume that can be attached to an instance in the same Availability Zone. The volume is created in the regional endpoint that you send the HTTP request to. For more information see <a href="http://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and Endpoints</a>.</p><p>You can create a new empty volume or restore a volume from an EBS snapshot. Any AWS Marketplace product codes from the snapshot are propagated to the volume.</p><p>You can create encrypted volumes with the <code>Encrypted</code> parameter. Encrypted volumes may only be attached to instances that support Amazon EBS encryption. Volumes that are created from encrypted snapshots are also automatically encrypted. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You can tag your volumes during creation. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html">Creating an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2Volume`.
 
 @see AWSEC2CreateVolumeRequest
 @see AWSEC2Volume
 */
- (AWSTask<AWSEC2Volume *> *)createVolume:(AWSEC2CreateVolumeRequest *)request;

/**
 <p>Creates an EBS volume that can be attached to an instance in the same Availability Zone. The volume is created in the regional endpoint that you send the HTTP request to. For more information see <a href="http://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and Endpoints</a>.</p><p>You can create a new empty volume or restore a volume from an EBS snapshot. Any AWS Marketplace product codes from the snapshot are propagated to the volume.</p><p>You can create encrypted volumes with the <code>Encrypted</code> parameter. Encrypted volumes may only be attached to instances that support Amazon EBS encryption. Volumes that are created from encrypted snapshots are also automatically encrypted. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You can tag your volumes during creation. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html">Creating an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVolumeRequest
 @see AWSEC2Volume
 */
- (void)createVolume:(AWSEC2CreateVolumeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2Volume * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a VPC with the specified IPv4 CIDR block. The smallest VPC you can create uses a /28 netmask (16 IPv4 addresses), and the largest uses a /16 netmask (65,536 IPv4 addresses). For more information about how large to make your VPC, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can optionally request an Amazon-provided IPv6 CIDR block for the VPC. The IPv6 CIDR block uses a /56 prefix length, and is allocated from Amazon's pool of IPv6 addresses. You cannot choose the IPv6 range for your VPC.</p><p>By default, each instance you launch in the VPC has the default DHCP options, which include only a default DNS server that we provide (AmazonProvidedDNS). For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can specify the instance tenancy value for the VPC when you create it. You can't change this value for the VPC after you create it. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html">Dedicated Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpc service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcResult`.
 
 @see AWSEC2CreateVpcRequest
 @see AWSEC2CreateVpcResult
 */
- (AWSTask<AWSEC2CreateVpcResult *> *)createVpc:(AWSEC2CreateVpcRequest *)request;

/**
 <p>Creates a VPC with the specified IPv4 CIDR block. The smallest VPC you can create uses a /28 netmask (16 IPv4 addresses), and the largest uses a /16 netmask (65,536 IPv4 addresses). For more information about how large to make your VPC, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can optionally request an Amazon-provided IPv6 CIDR block for the VPC. The IPv6 CIDR block uses a /56 prefix length, and is allocated from Amazon's pool of IPv6 addresses. You cannot choose the IPv6 range for your VPC.</p><p>By default, each instance you launch in the VPC has the default DHCP options, which include only a default DNS server that we provide (AmazonProvidedDNS). For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can specify the instance tenancy value for the VPC when you create it. You can't change this value for the VPC after you create it. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html">Dedicated Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpc service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpcRequest
 @see AWSEC2CreateVpcResult
 */
- (void)createVpc:(AWSEC2CreateVpcRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpcResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a VPC endpoint for a specified service. An endpoint enables you to create a private connection between your VPC and the service. The service may be provided by AWS, an AWS Marketplace partner, or another AWS account. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-endpoints.html">VPC Endpoints</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>A <code>gateway</code> endpoint serves as a target for a route in your route table for traffic destined for the AWS service. You can specify an endpoint policy to attach to the endpoint that will control access to the service from your VPC. You can also specify the VPC route tables that use the endpoint.</p><p>An <code>interface</code> endpoint is a network interface in your subnet that serves as an endpoint for communicating with the specified service. You can specify the subnets in which to create an endpoint, and the security groups to associate with the endpoint network interface.</p><p>Use <a>DescribeVpcEndpointServices</a> to get a list of supported services.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcEndpointResult`.
 
 @see AWSEC2CreateVpcEndpointRequest
 @see AWSEC2CreateVpcEndpointResult
 */
- (AWSTask<AWSEC2CreateVpcEndpointResult *> *)createVpcEndpoint:(AWSEC2CreateVpcEndpointRequest *)request;

/**
 <p>Creates a VPC endpoint for a specified service. An endpoint enables you to create a private connection between your VPC and the service. The service may be provided by AWS, an AWS Marketplace partner, or another AWS account. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-endpoints.html">VPC Endpoints</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>A <code>gateway</code> endpoint serves as a target for a route in your route table for traffic destined for the AWS service. You can specify an endpoint policy to attach to the endpoint that will control access to the service from your VPC. You can also specify the VPC route tables that use the endpoint.</p><p>An <code>interface</code> endpoint is a network interface in your subnet that serves as an endpoint for communicating with the specified service. You can specify the subnets in which to create an endpoint, and the security groups to associate with the endpoint network interface.</p><p>Use <a>DescribeVpcEndpointServices</a> to get a list of supported services.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpcEndpointRequest
 @see AWSEC2CreateVpcEndpointResult
 */
- (void)createVpcEndpoint:(AWSEC2CreateVpcEndpointRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpcEndpointResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a connection notification for a specified VPC endpoint or VPC endpoint service. A connection notification notifies you of specific endpoint events. You must create an SNS topic to receive notifications. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Create a Topic</a> in the <i>Amazon Simple Notification Service Developer Guide</i>.</p><p>You can create a connection notification for interface endpoints only.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpointConnectionNotification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcEndpointConnectionNotificationResult`.
 
 @see AWSEC2CreateVpcEndpointConnectionNotificationRequest
 @see AWSEC2CreateVpcEndpointConnectionNotificationResult
 */
- (AWSTask<AWSEC2CreateVpcEndpointConnectionNotificationResult *> *)createVpcEndpointConnectionNotification:(AWSEC2CreateVpcEndpointConnectionNotificationRequest *)request;

/**
 <p>Creates a connection notification for a specified VPC endpoint or VPC endpoint service. A connection notification notifies you of specific endpoint events. You must create an SNS topic to receive notifications. For more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html">Create a Topic</a> in the <i>Amazon Simple Notification Service Developer Guide</i>.</p><p>You can create a connection notification for interface endpoints only.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpointConnectionNotification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpcEndpointConnectionNotificationRequest
 @see AWSEC2CreateVpcEndpointConnectionNotificationResult
 */
- (void)createVpcEndpointConnectionNotification:(AWSEC2CreateVpcEndpointConnectionNotificationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpcEndpointConnectionNotificationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a VPC endpoint service configuration to which service consumers (AWS accounts, IAM users, and IAM roles) can connect. Service consumers can create an interface VPC endpoint to connect to your service.</p><p>To create an endpoint service configuration, you must first create a Network Load Balancer for your service. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/endpoint-service.html">VPC Endpoint Services</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpointServiceConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcEndpointServiceConfigurationResult`.
 
 @see AWSEC2CreateVpcEndpointServiceConfigurationRequest
 @see AWSEC2CreateVpcEndpointServiceConfigurationResult
 */
- (AWSTask<AWSEC2CreateVpcEndpointServiceConfigurationResult *> *)createVpcEndpointServiceConfiguration:(AWSEC2CreateVpcEndpointServiceConfigurationRequest *)request;

/**
 <p>Creates a VPC endpoint service configuration to which service consumers (AWS accounts, IAM users, and IAM roles) can connect. Service consumers can create an interface VPC endpoint to connect to your service.</p><p>To create an endpoint service configuration, you must first create a Network Load Balancer for your service. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/endpoint-service.html">VPC Endpoint Services</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the CreateVpcEndpointServiceConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpcEndpointServiceConfigurationRequest
 @see AWSEC2CreateVpcEndpointServiceConfigurationResult
 */
- (void)createVpcEndpointServiceConfiguration:(AWSEC2CreateVpcEndpointServiceConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpcEndpointServiceConfigurationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Requests a VPC peering connection between two VPCs: a requester VPC that you own and an accepter VPC with which to create the connection. The accepter VPC can belong to another AWS account and can be in a different Region to the requester VPC. The requester VPC and accepter VPC cannot have overlapping CIDR blocks.</p><note><p>Limitations and rules apply to a VPC peering connection. For more information, see the <a href="http://docs.aws.amazon.com/AmazonVPC/latest/PeeringGuide/vpc-peering-basics.html#vpc-peering-limitations">limitations</a> section in the <i>VPC Peering Guide</i>.</p></note><p>The owner of the accepter VPC must accept the peering request to activate the peering connection. The VPC peering connection request expires after 7 days, after which it cannot be accepted or rejected.</p><p>If you create a VPC peering connection request between VPCs with overlapping CIDR blocks, the VPC peering connection has a status of <code>failed</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcPeeringConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcPeeringConnectionResult`.
 
 @see AWSEC2CreateVpcPeeringConnectionRequest
 @see AWSEC2CreateVpcPeeringConnectionResult
 */
- (AWSTask<AWSEC2CreateVpcPeeringConnectionResult *> *)createVpcPeeringConnection:(AWSEC2CreateVpcPeeringConnectionRequest *)request;

/**
 <p>Requests a VPC peering connection between two VPCs: a requester VPC that you own and an accepter VPC with which to create the connection. The accepter VPC can belong to another AWS account and can be in a different Region to the requester VPC. The requester VPC and accepter VPC cannot have overlapping CIDR blocks.</p><note><p>Limitations and rules apply to a VPC peering connection. For more information, see the <a href="http://docs.aws.amazon.com/AmazonVPC/latest/PeeringGuide/vpc-peering-basics.html#vpc-peering-limitations">limitations</a> section in the <i>VPC Peering Guide</i>.</p></note><p>The owner of the accepter VPC must accept the peering request to activate the peering connection. The VPC peering connection request expires after 7 days, after which it cannot be accepted or rejected.</p><p>If you create a VPC peering connection request between VPCs with overlapping CIDR blocks, the VPC peering connection has a status of <code>failed</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcPeeringConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpcPeeringConnectionRequest
 @see AWSEC2CreateVpcPeeringConnectionResult
 */
- (void)createVpcPeeringConnection:(AWSEC2CreateVpcPeeringConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpcPeeringConnectionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a VPN connection between an existing virtual private gateway and a VPN customer gateway. The only supported connection type is <code>ipsec.1</code>.</p><p>The response includes information that you need to give to your network administrator to configure your customer gateway.</p><important><p>We strongly recommend that you use HTTPS when calling this operation because the response contains sensitive cryptographic information for configuring your customer gateway.</p></important><p>If you decide to shut down your VPN connection for any reason and later create a new VPN connection, you must reconfigure your customer gateway with the new information returned from this call.</p><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpnConnectionResult`.
 
 @see AWSEC2CreateVpnConnectionRequest
 @see AWSEC2CreateVpnConnectionResult
 */
- (AWSTask<AWSEC2CreateVpnConnectionResult *> *)createVpnConnection:(AWSEC2CreateVpnConnectionRequest *)request;

/**
 <p>Creates a VPN connection between an existing virtual private gateway and a VPN customer gateway. The only supported connection type is <code>ipsec.1</code>.</p><p>The response includes information that you need to give to your network administrator to configure your customer gateway.</p><important><p>We strongly recommend that you use HTTPS when calling this operation because the response contains sensitive cryptographic information for configuring your customer gateway.</p></important><p>If you decide to shut down your VPN connection for any reason and later create a new VPN connection, you must reconfigure your customer gateway with the new information returned from this call.</p><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpnConnectionRequest
 @see AWSEC2CreateVpnConnectionResult
 */
- (void)createVpnConnection:(AWSEC2CreateVpnConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpnConnectionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.</p><p>For more information about VPN connections, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnConnectionRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreateVpnConnectionRouteRequest
 */
- (AWSTask *)createVpnConnectionRoute:(AWSEC2CreateVpnConnectionRouteRequest *)request;

/**
 <p>Creates a static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.</p><p>For more information about VPN connections, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnConnectionRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpnConnectionRouteRequest
 */
- (void)createVpnConnectionRoute:(AWSEC2CreateVpnConnectionRouteRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a virtual private gateway. A virtual private gateway is the endpoint on the VPC side of your VPN connection. You can create a virtual private gateway before creating the VPC itself.</p><p>For more information about virtual private gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpnGatewayResult`.
 
 @see AWSEC2CreateVpnGatewayRequest
 @see AWSEC2CreateVpnGatewayResult
 */
- (AWSTask<AWSEC2CreateVpnGatewayResult *> *)createVpnGateway:(AWSEC2CreateVpnGatewayRequest *)request;

/**
 <p>Creates a virtual private gateway. A virtual private gateway is the endpoint on the VPC side of your VPN connection. You can create a virtual private gateway before creating the VPC itself.</p><p>For more information about virtual private gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2CreateVpnGatewayRequest
 @see AWSEC2CreateVpnGatewayResult
 */
- (void)createVpnGateway:(AWSEC2CreateVpnGatewayRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2CreateVpnGatewayResult * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Deletes the specified placement group. You must terminate all instances in the placement group before you can delete the placement group. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePlacementGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeletePlacementGroupRequest
 */
- (AWSTask *)deletePlacementGroup:(AWSEC2DeletePlacementGroupRequest *)request;

/**
 <p>Deletes the specified placement group. You must terminate all instances in the placement group before you can delete the placement group. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePlacementGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeletePlacementGroupRequest
 */
- (void)deletePlacementGroup:(AWSEC2DeletePlacementGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Deletes the specified snapshot.</p><p>When you make periodic snapshots of a volume, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the volume.</p><p>You cannot delete a snapshot of the root device of an EBS volume used by a registered AMI. You must first de-register the AMI before you can delete the snapshot.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html">Deleting an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteSnapshotRequest
 */
- (AWSTask *)deleteSnapshot:(AWSEC2DeleteSnapshotRequest *)request;

/**
 <p>Deletes the specified snapshot.</p><p>When you make periodic snapshots of a volume, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the volume.</p><p>You cannot delete a snapshot of the root device of an EBS volume used by a registered AMI. You must first de-register the AMI before you can delete the snapshot.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html">Deleting an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Deletes the specified set of tags from the specified set of resources.</p><p>To list the current tags, use <a>DescribeTags</a>. For more information about tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteTagsRequest
 */
- (AWSTask *)deleteTags:(AWSEC2DeleteTagsRequest *)request;

/**
 <p>Deletes the specified set of tags from the specified set of resources.</p><p>To list the current tags, use <a>DescribeTags</a>. For more information about tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DeleteTagsRequest
 */
- (void)deleteTags:(AWSEC2DeleteTagsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified EBS volume. The volume must be in the <code>available</code> state (not attached to an instance).</p><p>The volume can remain in the <code>deleting</code> state for several minutes.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-volume.html">Deleting an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVolumeRequest
 */
- (AWSTask *)deleteVolume:(AWSEC2DeleteVolumeRequest *)request;

/**
 <p>Deletes the specified EBS volume. The volume must be in the <code>available</code> state (not attached to an instance).</p><p>The volume can remain in the <code>deleting</code> state for several minutes.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-volume.html">Deleting an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Deletes the specified virtual private gateway. We recommend that before you delete a virtual private gateway, you detach it from the VPC and delete the VPN connection. Note that you don't need to delete the virtual private gateway if you plan to delete and recreate the VPN connection between your VPC and your network.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpnGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVpnGatewayRequest
 */
- (AWSTask *)deleteVpnGateway:(AWSEC2DeleteVpnGatewayRequest *)request;

/**
 <p>Deletes the specified virtual private gateway. We recommend that before you delete a virtual private gateway, you detach it from the VPC and delete the VPN connection. Note that you don't need to delete the virtual private gateway if you plan to delete and recreate the VPN connection between your VPC and your network.</p>
 
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
 <p>Describes attributes of your AWS account. The following are the supported account attributes:</p><ul><li><p><code>supported-platforms</code>: Indicates whether your account can launch instances into EC2-Classic and EC2-VPC, or only into EC2-VPC.</p></li><li><p><code>default-vpc</code>: The ID of the default VPC for your account, or <code>none</code>.</p></li><li><p><code>max-instances</code>: The maximum number of On-Demand Instances that you can run.</p></li><li><p><code>vpc-max-security-groups-per-interface</code>: The maximum number of security groups that you can assign to a network interface.</p></li><li><p><code>max-elastic-ips</code>: The maximum number of Elastic IP addresses that you can allocate for use with EC2-Classic. </p></li><li><p><code>vpc-max-elastic-ips</code>: The maximum number of Elastic IP addresses that you can allocate for use with EC2-VPC.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAccountAttributesResult`.
 
 @see AWSEC2DescribeAccountAttributesRequest
 @see AWSEC2DescribeAccountAttributesResult
 */
- (AWSTask<AWSEC2DescribeAccountAttributesResult *> *)describeAccountAttributes:(AWSEC2DescribeAccountAttributesRequest *)request;

/**
 <p>Describes attributes of your AWS account. The following are the supported account attributes:</p><ul><li><p><code>supported-platforms</code>: Indicates whether your account can launch instances into EC2-Classic and EC2-VPC, or only into EC2-VPC.</p></li><li><p><code>default-vpc</code>: The ID of the default VPC for your account, or <code>none</code>.</p></li><li><p><code>max-instances</code>: The maximum number of On-Demand Instances that you can run.</p></li><li><p><code>vpc-max-security-groups-per-interface</code>: The maximum number of security groups that you can assign to a network interface.</p></li><li><p><code>max-elastic-ips</code>: The maximum number of Elastic IP addresses that you can allocate for use with EC2-Classic. </p></li><li><p><code>vpc-max-elastic-ips</code>: The maximum number of Elastic IP addresses that you can allocate for use with EC2-VPC.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeAccountAttributesRequest
 @see AWSEC2DescribeAccountAttributesResult
 */
- (void)describeAccountAttributes:(AWSEC2DescribeAccountAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeAccountAttributesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your Elastic IP addresses.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAddressesResult`.
 
 @see AWSEC2DescribeAddressesRequest
 @see AWSEC2DescribeAddressesResult
 */
- (AWSTask<AWSEC2DescribeAddressesResult *> *)describeAddresses:(AWSEC2DescribeAddressesRequest *)request;

/**
 <p>Describes one or more of your Elastic IP addresses.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeAddressesRequest
 @see AWSEC2DescribeAddressesResult
 */
- (void)describeAddresses:(AWSEC2DescribeAddressesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeAddressesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the longer ID format settings for all resource types in a specific region. This request is useful for performing a quick audit to determine whether a specific region is fully opted in for longer IDs (17-character IDs).</p><p>This request only returns information about resource types that support longer IDs.</p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAggregateIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAggregateIdFormatResult`.
 
 @see AWSEC2DescribeAggregateIdFormatRequest
 @see AWSEC2DescribeAggregateIdFormatResult
 */
- (AWSTask<AWSEC2DescribeAggregateIdFormatResult *> *)describeAggregateIdFormat:(AWSEC2DescribeAggregateIdFormatRequest *)request;

/**
 <p>Describes the longer ID format settings for all resource types in a specific region. This request is useful for performing a quick audit to determine whether a specific region is fully opted in for longer IDs (17-character IDs).</p><p>This request only returns information about resource types that support longer IDs.</p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAggregateIdFormat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeAggregateIdFormatRequest
 @see AWSEC2DescribeAggregateIdFormatResult
 */
- (void)describeAggregateIdFormat:(AWSEC2DescribeAggregateIdFormatRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeAggregateIdFormatResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of the Availability Zones that are available to you. The results include zones only for the region you're currently using. If there is an event impacting an Availability Zone, you can use this request to view the state and any provided message for that Availability Zone.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html">Regions and Availability Zones</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailabilityZones service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAvailabilityZonesResult`.
 
 @see AWSEC2DescribeAvailabilityZonesRequest
 @see AWSEC2DescribeAvailabilityZonesResult
 */
- (AWSTask<AWSEC2DescribeAvailabilityZonesResult *> *)describeAvailabilityZones:(AWSEC2DescribeAvailabilityZonesRequest *)request;

/**
 <p>Describes one or more of the Availability Zones that are available to you. The results include zones only for the region you're currently using. If there is an event impacting an Availability Zone, you can use this request to view the state and any provided message for that Availability Zone.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html">Regions and Availability Zones</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailabilityZones service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeAvailabilityZonesRequest
 @see AWSEC2DescribeAvailabilityZonesResult
 */
- (void)describeAvailabilityZones:(AWSEC2DescribeAvailabilityZonesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeAvailabilityZonesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your bundling tasks.</p><note><p>Completed bundle tasks are listed for only a limited time. If your bundle task is no longer in the list, you can still register an AMI from it. Just use <code>RegisterImage</code> with the Amazon S3 bucket name and image manifest name you provided to the bundle task.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeBundleTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeBundleTasksResult`.
 
 @see AWSEC2DescribeBundleTasksRequest
 @see AWSEC2DescribeBundleTasksResult
 */
- (AWSTask<AWSEC2DescribeBundleTasksResult *> *)describeBundleTasks:(AWSEC2DescribeBundleTasksRequest *)request;

/**
 <p>Describes one or more of your bundling tasks.</p><note><p>Completed bundle tasks are listed for only a limited time. If your bundle task is no longer in the list, you can still register an AMI from it. Just use <code>RegisterImage</code> with the Amazon S3 bucket name and image manifest name you provided to the bundle task.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeBundleTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeBundleTasksRequest
 @see AWSEC2DescribeBundleTasksResult
 */
- (void)describeBundleTasks:(AWSEC2DescribeBundleTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeBundleTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the IP address ranges that were specified in calls to <a>ProvisionByoipCidr</a>.</p><p>To describe the address pools that were created when you provisioned the address ranges, use <a>DescribePublicIpv4Pools</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeByoipCidrs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeByoipCidrsResult`.
 
 @see AWSEC2DescribeByoipCidrsRequest
 @see AWSEC2DescribeByoipCidrsResult
 */
- (AWSTask<AWSEC2DescribeByoipCidrsResult *> *)describeByoipCidrs:(AWSEC2DescribeByoipCidrsRequest *)request;

/**
 <p>Describes the IP address ranges that were specified in calls to <a>ProvisionByoipCidr</a>.</p><p>To describe the address pools that were created when you provisioned the address ranges, use <a>DescribePublicIpv4Pools</a>.</p>
 
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
 <p>Describes one or more of your conversion tasks. For more information, see the <a href="http://docs.aws.amazon.com/vm-import/latest/userguide/">VM Import/Export User Guide</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConversionTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeConversionTasksResult`.
 
 @see AWSEC2DescribeConversionTasksRequest
 @see AWSEC2DescribeConversionTasksResult
 */
- (AWSTask<AWSEC2DescribeConversionTasksResult *> *)describeConversionTasks:(AWSEC2DescribeConversionTasksRequest *)request;

/**
 <p>Describes one or more of your conversion tasks. For more information, see the <a href="http://docs.aws.amazon.com/vm-import/latest/userguide/">VM Import/Export User Guide</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConversionTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeConversionTasksRequest
 @see AWSEC2DescribeConversionTasksResult
 */
- (void)describeConversionTasks:(AWSEC2DescribeConversionTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeConversionTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your VPN customer gateways.</p><p>For more information about VPN customer gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCustomerGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeCustomerGatewaysResult`.
 
 @see AWSEC2DescribeCustomerGatewaysRequest
 @see AWSEC2DescribeCustomerGatewaysResult
 */
- (AWSTask<AWSEC2DescribeCustomerGatewaysResult *> *)describeCustomerGateways:(AWSEC2DescribeCustomerGatewaysRequest *)request;

/**
 <p>Describes one or more of your VPN customer gateways.</p><p>For more information about VPN customer gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCustomerGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeCustomerGatewaysRequest
 @see AWSEC2DescribeCustomerGatewaysResult
 */
- (void)describeCustomerGateways:(AWSEC2DescribeCustomerGatewaysRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeCustomerGatewaysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your DHCP options sets.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDhcpOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeDhcpOptionsResult`.
 
 @see AWSEC2DescribeDhcpOptionsRequest
 @see AWSEC2DescribeDhcpOptionsResult
 */
- (AWSTask<AWSEC2DescribeDhcpOptionsResult *> *)describeDhcpOptions:(AWSEC2DescribeDhcpOptionsRequest *)request;

/**
 <p>Describes one or more of your DHCP options sets.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Describes the Elastic GPUs associated with your instances. For more information about Elastic GPUs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-gpus.html">Amazon EC2 Elastic GPUs</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticGpus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeElasticGpusResult`.
 
 @see AWSEC2DescribeElasticGpusRequest
 @see AWSEC2DescribeElasticGpusResult
 */
- (AWSTask<AWSEC2DescribeElasticGpusResult *> *)describeElasticGpus:(AWSEC2DescribeElasticGpusRequest *)request;

/**
 <p>Describes the Elastic GPUs associated with your instances. For more information about Elastic GPUs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-gpus.html">Amazon EC2 Elastic GPUs</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeElasticGpus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeElasticGpusRequest
 @see AWSEC2DescribeElasticGpusResult
 */
- (void)describeElasticGpus:(AWSEC2DescribeElasticGpusRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeElasticGpusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your export tasks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeExportTasksResult`.
 
 @see AWSEC2DescribeExportTasksRequest
 @see AWSEC2DescribeExportTasksResult
 */
- (AWSTask<AWSEC2DescribeExportTasksResult *> *)describeExportTasks:(AWSEC2DescribeExportTasksRequest *)request;

/**
 <p>Describes one or more of your export tasks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeExportTasksRequest
 @see AWSEC2DescribeExportTasksResult
 */
- (void)describeExportTasks:(AWSEC2DescribeExportTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeExportTasksResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the events for the specified EC2 Fleet during the specified time.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFleetHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeFleetHistoryResult`.
 
 @see AWSEC2DescribeFleetHistoryRequest
 @see AWSEC2DescribeFleetHistoryResult
 */
- (AWSTask<AWSEC2DescribeFleetHistoryResult *> *)describeFleetHistory:(AWSEC2DescribeFleetHistoryRequest *)request;

/**
 <p>Describes the events for the specified EC2 Fleet during the specified time.</p>
 
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
 <p>Describes one or more of your EC2 Fleet.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFleets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeFleetsResult`.
 
 @see AWSEC2DescribeFleetsRequest
 @see AWSEC2DescribeFleetsResult
 */
- (AWSTask<AWSEC2DescribeFleetsResult *> *)describeFleets:(AWSEC2DescribeFleetsRequest *)request;

/**
 <p>Describes one or more of your EC2 Fleet.</p>
 
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
 <p>Describes one or more available Amazon FPGA Images (AFIs). These include public AFIs, private AFIs that you own, and AFIs owned by other AWS accounts for which you have load permissions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFpgaImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeFpgaImagesResult`.
 
 @see AWSEC2DescribeFpgaImagesRequest
 @see AWSEC2DescribeFpgaImagesResult
 */
- (AWSTask<AWSEC2DescribeFpgaImagesResult *> *)describeFpgaImages:(AWSEC2DescribeFpgaImagesRequest *)request;

/**
 <p>Describes one or more available Amazon FPGA Images (AFIs). These include public AFIs, private AFIs that you own, and AFIs owned by other AWS accounts for which you have load permissions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFpgaImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeFpgaImagesRequest
 @see AWSEC2DescribeFpgaImagesResult
 */
- (void)describeFpgaImages:(AWSEC2DescribeFpgaImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeFpgaImagesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Dedicated Host reservations that are available to purchase.</p><p>The results describe all the Dedicated Host reservation offerings, including offerings that may not match the instance family and region of your Dedicated Hosts. When purchasing an offering, ensure that the instance family and Region of the offering matches that of the Dedicated Hosts with which it is to be associated. For more information about supported instance types, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html">Dedicated Hosts Overview</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeHostReservationOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeHostReservationOfferingsResult`.
 
 @see AWSEC2DescribeHostReservationOfferingsRequest
 @see AWSEC2DescribeHostReservationOfferingsResult
 */
- (AWSTask<AWSEC2DescribeHostReservationOfferingsResult *> *)describeHostReservationOfferings:(AWSEC2DescribeHostReservationOfferingsRequest *)request;

/**
 <p>Describes the Dedicated Host reservations that are available to purchase.</p><p>The results describe all the Dedicated Host reservation offerings, including offerings that may not match the instance family and region of your Dedicated Hosts. When purchasing an offering, ensure that the instance family and Region of the offering matches that of the Dedicated Hosts with which it is to be associated. For more information about supported instance types, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html">Dedicated Hosts Overview</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>
 
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
 <p>Describes one or more of your Dedicated Hosts.</p><p>The results describe only the Dedicated Hosts in the region you're currently using. All listed instances consume capacity on your Dedicated Host. Dedicated Hosts that have recently been released are listed with the state <code>released</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHosts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeHostsResult`.
 
 @see AWSEC2DescribeHostsRequest
 @see AWSEC2DescribeHostsResult
 */
- (AWSTask<AWSEC2DescribeHostsResult *> *)describeHosts:(AWSEC2DescribeHostsRequest *)request;

/**
 <p>Describes one or more of your Dedicated Hosts.</p><p>The results describe only the Dedicated Hosts in the region you're currently using. All listed instances consume capacity on your Dedicated Host. Dedicated Hosts that have recently been released are listed with the state <code>released</code>.</p>
 
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
 <p>Describes the ID format settings for your resources on a per-region basis, for example, to view which resource types are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types.</p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>These settings apply to the IAM user who makes the request; they do not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user, unless they explicitly override the settings by running the <a>ModifyIdFormat</a> command. Resources created with longer IDs are visible to all IAM users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeIdFormatResult`.
 
 @see AWSEC2DescribeIdFormatRequest
 @see AWSEC2DescribeIdFormatResult
 */
- (AWSTask<AWSEC2DescribeIdFormatResult *> *)describeIdFormat:(AWSEC2DescribeIdFormatRequest *)request;

/**
 <p>Describes the ID format settings for your resources on a per-region basis, for example, to view which resource types are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types.</p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>These settings apply to the IAM user who makes the request; they do not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user, unless they explicitly override the settings by running the <a>ModifyIdFormat</a> command. Resources created with longer IDs are visible to all IAM users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdFormat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeIdFormatRequest
 @see AWSEC2DescribeIdFormatResult
 */
- (void)describeIdFormat:(AWSEC2DescribeIdFormatRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeIdFormatResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the ID format settings for resources for the specified IAM user, IAM role, or root user. For example, you can view the resource types that are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>These settings apply to the principal specified in the request. They do not apply to the principal that makes the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeIdentityIdFormatResult`.
 
 @see AWSEC2DescribeIdentityIdFormatRequest
 @see AWSEC2DescribeIdentityIdFormatResult
 */
- (AWSTask<AWSEC2DescribeIdentityIdFormatResult *> *)describeIdentityIdFormat:(AWSEC2DescribeIdentityIdFormatRequest *)request;

/**
 <p>Describes the ID format settings for resources for the specified IAM user, IAM role, or root user. For example, you can view the resource types that are enabled for longer IDs. This request only returns information about resource types whose ID formats can be modified; it does not return information about other resource types. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p><p>The following resource types support longer IDs: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>reservation</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>snapshot</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>volume</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>These settings apply to the principal specified in the request. They do not apply to the principal that makes the request.</p>
 
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
 <p>Describes one or more of the images (AMIs, AKIs, and ARIs) available to you. Images available to you include public images, private images that you own, and private images owned by other AWS accounts but for which you have explicit launch permissions.</p><note><p>Deregistered images are included in the returned results for an unspecified interval after deregistration.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeImagesResult`.
 
 @see AWSEC2DescribeImagesRequest
 @see AWSEC2DescribeImagesResult
 */
- (AWSTask<AWSEC2DescribeImagesResult *> *)describeImages:(AWSEC2DescribeImagesRequest *)request;

/**
 <p>Describes one or more of the images (AMIs, AKIs, and ARIs) available to you. Images available to you include public images, private images that you own, and private images owned by other AWS accounts but for which you have explicit launch permissions.</p><note><p>Deregistered images are included in the returned results for an unspecified interval after deregistration.</p></note>
 
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
 <p>Describes the credit option for CPU usage of one or more of your T2 or T3 instances. The credit options are <code>standard</code> and <code>unlimited</code>.</p><p>If you do not specify an instance ID, Amazon EC2 returns T2 and T3 instances with the <code>unlimited</code> credit option, as well as instances that were previously configured as T2 or T3 with the <code>unlimited</code> credit option. For example, if you resize a T2 instance, while it is configured as <code>unlimited</code>, to an M4 instance, Amazon EC2 returns the M4 instance.</p><p>If you specify one or more instance IDs, Amazon EC2 returns the credit option (<code>standard</code> or <code>unlimited</code>) of those instances. If you specify an instance ID that is not valid, such as an instance that is not a T2 or T3 instance, an error is returned.</p><p>Recently terminated instances might appear in the returned results. This interval is usually less than one hour.</p><p>If an Availability Zone is experiencing a service disruption and you specify instance IDs in the affected zone, or do not specify any instance IDs at all, the call fails. If you specify only instance IDs in an unaffected zone, the call works normally.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceCreditSpecifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInstanceCreditSpecificationsResult`.
 
 @see AWSEC2DescribeInstanceCreditSpecificationsRequest
 @see AWSEC2DescribeInstanceCreditSpecificationsResult
 */
- (AWSTask<AWSEC2DescribeInstanceCreditSpecificationsResult *> *)describeInstanceCreditSpecifications:(AWSEC2DescribeInstanceCreditSpecificationsRequest *)request;

/**
 <p>Describes the credit option for CPU usage of one or more of your T2 or T3 instances. The credit options are <code>standard</code> and <code>unlimited</code>.</p><p>If you do not specify an instance ID, Amazon EC2 returns T2 and T3 instances with the <code>unlimited</code> credit option, as well as instances that were previously configured as T2 or T3 with the <code>unlimited</code> credit option. For example, if you resize a T2 instance, while it is configured as <code>unlimited</code>, to an M4 instance, Amazon EC2 returns the M4 instance.</p><p>If you specify one or more instance IDs, Amazon EC2 returns the credit option (<code>standard</code> or <code>unlimited</code>) of those instances. If you specify an instance ID that is not valid, such as an instance that is not a T2 or T3 instance, an error is returned.</p><p>Recently terminated instances might appear in the returned results. This interval is usually less than one hour.</p><p>If an Availability Zone is experiencing a service disruption and you specify instance IDs in the affected zone, or do not specify any instance IDs at all, the call fails. If you specify only instance IDs in an unaffected zone, the call works normally.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceCreditSpecifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeInstanceCreditSpecificationsRequest
 @see AWSEC2DescribeInstanceCreditSpecificationsResult
 */
- (void)describeInstanceCreditSpecifications:(AWSEC2DescribeInstanceCreditSpecificationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeInstanceCreditSpecificationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the status of one or more instances. By default, only running instances are described, unless you specifically indicate to return the status of all instances.</p><p>Instance status includes the following components:</p><ul><li><p><b>Status checks</b> - Amazon EC2 performs status checks on running EC2 instances to identify hardware and software issues. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-system-instance-status-check.html">Status Checks for Your Instances</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstances.html">Troubleshooting Instances with Failed Status Checks</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li><li><p><b>Scheduled events</b> - Amazon EC2 can schedule events (such as reboot, stop, or terminate) for your instances related to hardware issues, software updates, or system maintenance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-instances-status-check_sched.html">Scheduled Events for Your Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li><li><p><b>Instance state</b> - You can manage your instances from the moment you launch them through their termination. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInstanceStatusResult`.
 
 @see AWSEC2DescribeInstanceStatusRequest
 @see AWSEC2DescribeInstanceStatusResult
 */
- (AWSTask<AWSEC2DescribeInstanceStatusResult *> *)describeInstanceStatus:(AWSEC2DescribeInstanceStatusRequest *)request;

/**
 <p>Describes the status of one or more instances. By default, only running instances are described, unless you specifically indicate to return the status of all instances.</p><p>Instance status includes the following components:</p><ul><li><p><b>Status checks</b> - Amazon EC2 performs status checks on running EC2 instances to identify hardware and software issues. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-system-instance-status-check.html">Status Checks for Your Instances</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstances.html">Troubleshooting Instances with Failed Status Checks</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li><li><p><b>Scheduled events</b> - Amazon EC2 can schedule events (such as reboot, stop, or terminate) for your instances related to hardware issues, software updates, or system maintenance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-instances-status-check_sched.html">Scheduled Events for Your Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li><li><p><b>Instance state</b> - You can manage your instances from the moment you launch them through their termination. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeInstanceStatusRequest
 @see AWSEC2DescribeInstanceStatusResult
 */
- (void)describeInstanceStatus:(AWSEC2DescribeInstanceStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeInstanceStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your instances.</p><p>If you specify one or more instance IDs, Amazon EC2 returns information for those instances. If you do not specify instance IDs, Amazon EC2 returns information for all relevant instances. If you specify an instance ID that is not valid, an error is returned. If you specify an instance that you do not own, it is not included in the returned results.</p><p>Recently terminated instances might appear in the returned results. This interval is usually less than one hour.</p><p>If you describe instances in the rare case where an Availability Zone is experiencing a service disruption and you specify instance IDs that are in the affected zone, or do not specify any instance IDs at all, the call fails. If you describe instances and specify only instance IDs that are in an unaffected zone, the call works normally.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInstancesResult`.
 
 @see AWSEC2DescribeInstancesRequest
 @see AWSEC2DescribeInstancesResult
 */
- (AWSTask<AWSEC2DescribeInstancesResult *> *)describeInstances:(AWSEC2DescribeInstancesRequest *)request;

/**
 <p>Describes one or more of your instances.</p><p>If you specify one or more instance IDs, Amazon EC2 returns information for those instances. If you do not specify instance IDs, Amazon EC2 returns information for all relevant instances. If you specify an instance ID that is not valid, an error is returned. If you specify an instance that you do not own, it is not included in the returned results.</p><p>Recently terminated instances might appear in the returned results. This interval is usually less than one hour.</p><p>If you describe instances in the rare case where an Availability Zone is experiencing a service disruption and you specify instance IDs that are in the affected zone, or do not specify any instance IDs at all, the call fails. If you describe instances and specify only instance IDs that are in an unaffected zone, the call works normally.</p>
 
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
 <p>Describes one or more of your key pairs.</p><p>For more information about key pairs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeKeyPairs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeKeyPairsResult`.
 
 @see AWSEC2DescribeKeyPairsRequest
 @see AWSEC2DescribeKeyPairsResult
 */
- (AWSTask<AWSEC2DescribeKeyPairsResult *> *)describeKeyPairs:(AWSEC2DescribeKeyPairsRequest *)request;

/**
 <p>Describes one or more of your key pairs.</p><p>For more information about key pairs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Describes one or more of your network ACLs.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkAcls service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeNetworkAclsResult`.
 
 @see AWSEC2DescribeNetworkAclsRequest
 @see AWSEC2DescribeNetworkAclsResult
 */
- (AWSTask<AWSEC2DescribeNetworkAclsResult *> *)describeNetworkAcls:(AWSEC2DescribeNetworkAclsRequest *)request;

/**
 <p>Describes one or more of your network ACLs.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Describes one or more of your placement groups. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePlacementGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribePlacementGroupsResult`.
 
 @see AWSEC2DescribePlacementGroupsRequest
 @see AWSEC2DescribePlacementGroupsResult
 */
- (AWSTask<AWSEC2DescribePlacementGroupsResult *> *)describePlacementGroups:(AWSEC2DescribePlacementGroupsRequest *)request;

/**
 <p>Describes one or more of your placement groups. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Describes one or more regions that are currently available to you.</p><p>For a list of the regions supported by Amazon EC2, see <a href="http://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region">Regions and Endpoints</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRegions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeRegionsResult`.
 
 @see AWSEC2DescribeRegionsRequest
 @see AWSEC2DescribeRegionsResult
 */
- (AWSTask<AWSEC2DescribeRegionsResult *> *)describeRegions:(AWSEC2DescribeRegionsRequest *)request;

/**
 <p>Describes one or more regions that are currently available to you.</p><p>For a list of the regions supported by Amazon EC2, see <a href="http://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region">Regions and Endpoints</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRegions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeRegionsRequest
 @see AWSEC2DescribeRegionsResult
 */
- (void)describeRegions:(AWSEC2DescribeRegionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeRegionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of the Reserved Instances that you purchased.</p><p>For more information about Reserved Instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html">Reserved Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesResult`.
 
 @see AWSEC2DescribeReservedInstancesRequest
 @see AWSEC2DescribeReservedInstancesResult
 */
- (AWSTask<AWSEC2DescribeReservedInstancesResult *> *)describeReservedInstances:(AWSEC2DescribeReservedInstancesRequest *)request;

/**
 <p>Describes one or more of the Reserved Instances that you purchased.</p><p>For more information about Reserved Instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html">Reserved Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeReservedInstancesRequest
 @see AWSEC2DescribeReservedInstancesResult
 */
- (void)describeReservedInstances:(AWSEC2DescribeReservedInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeReservedInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes your account's Reserved Instance listings in the Reserved Instance Marketplace.</p><p>The Reserved Instance Marketplace matches sellers who want to resell Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances.</p><p>As a seller, you choose to list some or all of your Reserved Instances, and you specify the upfront price to receive for them. Your Reserved Instances are then listed in the Reserved Instance Marketplace and are available for purchase.</p><p>As a buyer, you specify the configuration of the Reserved Instance to purchase, and the Marketplace matches what you're searching for with what's available. The Marketplace first sells the lowest priced Reserved Instances to you, and continues to sell available Reserved Instance listings to you until your demand is met. You are charged based on the total price of all of the listings that you purchase.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesListings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesListingsResult`.
 
 @see AWSEC2DescribeReservedInstancesListingsRequest
 @see AWSEC2DescribeReservedInstancesListingsResult
 */
- (AWSTask<AWSEC2DescribeReservedInstancesListingsResult *> *)describeReservedInstancesListings:(AWSEC2DescribeReservedInstancesListingsRequest *)request;

/**
 <p>Describes your account's Reserved Instance listings in the Reserved Instance Marketplace.</p><p>The Reserved Instance Marketplace matches sellers who want to resell Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances.</p><p>As a seller, you choose to list some or all of your Reserved Instances, and you specify the upfront price to receive for them. Your Reserved Instances are then listed in the Reserved Instance Marketplace and are available for purchase.</p><p>As a buyer, you specify the configuration of the Reserved Instance to purchase, and the Marketplace matches what you're searching for with what's available. The Marketplace first sells the lowest priced Reserved Instances to you, and continues to sell available Reserved Instance listings to you until your demand is met. You are charged based on the total price of all of the listings that you purchase.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesListings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeReservedInstancesListingsRequest
 @see AWSEC2DescribeReservedInstancesListingsResult
 */
- (void)describeReservedInstancesListings:(AWSEC2DescribeReservedInstancesListingsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeReservedInstancesListingsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the modifications made to your Reserved Instances. If no parameter is specified, information about all your Reserved Instances modification requests is returned. If a modification ID is specified, only information about the specific modification is returned.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesModifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesModificationsResult`.
 
 @see AWSEC2DescribeReservedInstancesModificationsRequest
 @see AWSEC2DescribeReservedInstancesModificationsResult
 */
- (AWSTask<AWSEC2DescribeReservedInstancesModificationsResult *> *)describeReservedInstancesModifications:(AWSEC2DescribeReservedInstancesModificationsRequest *)request;

/**
 <p>Describes the modifications made to your Reserved Instances. If no parameter is specified, information about all your Reserved Instances modification requests is returned. If a modification ID is specified, only information about the specific modification is returned.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesModifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeReservedInstancesModificationsRequest
 @see AWSEC2DescribeReservedInstancesModificationsResult
 */
- (void)describeReservedInstancesModifications:(AWSEC2DescribeReservedInstancesModificationsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeReservedInstancesModificationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes Reserved Instance offerings that are available for purchase. With Reserved Instances, you purchase the right to launch instances for a period of time. During that time period, you do not receive insufficient capacity errors, and you pay a lower usage rate than the rate charged for On-Demand instances for the actual time used.</p><p>If you have listed your own Reserved Instances for sale in the Reserved Instance Marketplace, they will be excluded from these results. This is to ensure that you do not purchase your own Reserved Instances.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesOfferingsResult`.
 
 @see AWSEC2DescribeReservedInstancesOfferingsRequest
 @see AWSEC2DescribeReservedInstancesOfferingsResult
 */
- (AWSTask<AWSEC2DescribeReservedInstancesOfferingsResult *> *)describeReservedInstancesOfferings:(AWSEC2DescribeReservedInstancesOfferingsRequest *)request;

/**
 <p>Describes Reserved Instance offerings that are available for purchase. With Reserved Instances, you purchase the right to launch instances for a period of time. During that time period, you do not receive insufficient capacity errors, and you pay a lower usage rate than the rate charged for On-Demand instances for the actual time used.</p><p>If you have listed your own Reserved Instances for sale in the Reserved Instance Marketplace, they will be excluded from these results. This is to ensure that you do not purchase your own Reserved Instances.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeReservedInstancesOfferingsRequest
 @see AWSEC2DescribeReservedInstancesOfferingsResult
 */
- (void)describeReservedInstancesOfferings:(AWSEC2DescribeReservedInstancesOfferingsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeReservedInstancesOfferingsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your route tables.</p><p>Each subnet in your VPC must be associated with a route table. If a subnet is not explicitly associated with any route table, it is implicitly associated with the main route table. This command does not return the subnet ID for implicit associations.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRouteTables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeRouteTablesResult`.
 
 @see AWSEC2DescribeRouteTablesRequest
 @see AWSEC2DescribeRouteTablesResult
 */
- (AWSTask<AWSEC2DescribeRouteTablesResult *> *)describeRouteTables:(AWSEC2DescribeRouteTablesRequest *)request;

/**
 <p>Describes one or more of your route tables.</p><p>Each subnet in your VPC must be associated with a route table. If a subnet is not explicitly associated with any route table, it is implicitly associated with the main route table. This command does not return the subnet ID for implicit associations.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Describes one or more of your Scheduled Instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeScheduledInstancesResult`.
 
 @see AWSEC2DescribeScheduledInstancesRequest
 @see AWSEC2DescribeScheduledInstancesResult
 */
- (AWSTask<AWSEC2DescribeScheduledInstancesResult *> *)describeScheduledInstances:(AWSEC2DescribeScheduledInstancesRequest *)request;

/**
 <p>Describes one or more of your Scheduled Instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeScheduledInstancesRequest
 @see AWSEC2DescribeScheduledInstancesResult
 */
- (void)describeScheduledInstances:(AWSEC2DescribeScheduledInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeScheduledInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>[EC2-VPC only] Describes the VPCs on the other side of a VPC peering connection that are referencing the security groups you've specified in this request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityGroupReferences service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSecurityGroupReferencesResult`.
 
 @see AWSEC2DescribeSecurityGroupReferencesRequest
 @see AWSEC2DescribeSecurityGroupReferencesResult
 */
- (AWSTask<AWSEC2DescribeSecurityGroupReferencesResult *> *)describeSecurityGroupReferences:(AWSEC2DescribeSecurityGroupReferencesRequest *)request;

/**
 <p>[EC2-VPC only] Describes the VPCs on the other side of a VPC peering connection that are referencing the security groups you've specified in this request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityGroupReferences service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSecurityGroupReferencesRequest
 @see AWSEC2DescribeSecurityGroupReferencesResult
 */
- (void)describeSecurityGroupReferences:(AWSEC2DescribeSecurityGroupReferencesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSecurityGroupReferencesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your security groups.</p><p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i> and <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSecurityGroupsResult`.
 
 @see AWSEC2DescribeSecurityGroupsRequest
 @see AWSEC2DescribeSecurityGroupsResult
 */
- (AWSTask<AWSEC2DescribeSecurityGroupsResult *> *)describeSecurityGroups:(AWSEC2DescribeSecurityGroupsRequest *)request;

/**
 <p>Describes one or more of your security groups.</p><p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i> and <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSecurityGroupsRequest
 @see AWSEC2DescribeSecurityGroupsResult
 */
- (void)describeSecurityGroups:(AWSEC2DescribeSecurityGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSecurityGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified attribute of the specified snapshot. You can specify only one attribute at a time.</p><p>For more information about EBS snapshots, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html">Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSnapshotAttributeResult`.
 
 @see AWSEC2DescribeSnapshotAttributeRequest
 @see AWSEC2DescribeSnapshotAttributeResult
 */
- (AWSTask<AWSEC2DescribeSnapshotAttributeResult *> *)describeSnapshotAttribute:(AWSEC2DescribeSnapshotAttributeRequest *)request;

/**
 <p>Describes the specified attribute of the specified snapshot. You can specify only one attribute at a time.</p><p>For more information about EBS snapshots, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html">Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSnapshotAttributeRequest
 @see AWSEC2DescribeSnapshotAttributeResult
 */
- (void)describeSnapshotAttribute:(AWSEC2DescribeSnapshotAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSnapshotAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of the EBS snapshots available to you. Available snapshots include public snapshots available for any AWS account to launch, private snapshots that you own, and private snapshots owned by another AWS account but for which you've been given explicit create volume permissions.</p><p>The create volume permissions fall into the following categories:</p><ul><li><p><i>public</i>: The owner of the snapshot granted create volume permissions for the snapshot to the <code>all</code> group. All AWS accounts have create volume permissions for these snapshots.</p></li><li><p><i>explicit</i>: The owner of the snapshot granted create volume permissions to a specific AWS account.</p></li><li><p><i>implicit</i>: An AWS account has implicit create volume permissions for all snapshots it owns.</p></li></ul><p>The list of snapshots returned can be modified by specifying snapshot IDs, snapshot owners, or AWS accounts with create volume permissions. If no options are specified, Amazon EC2 returns all snapshots for which you have create volume permissions.</p><p>If you specify one or more snapshot IDs, only snapshots that have the specified IDs are returned. If you specify an invalid snapshot ID, an error is returned. If you specify a snapshot ID for which you do not have access, it is not included in the returned results.</p><p>If you specify one or more snapshot owners using the <code>OwnerIds</code> option, only snapshots from the specified owners and for which you have access are returned. The results can include the AWS account IDs of the specified owners, <code>amazon</code> for snapshots owned by Amazon, or <code>self</code> for snapshots that you own.</p><p>If you specify a list of restorable users, only snapshots with create snapshot permissions for those users are returned. You can specify AWS account IDs (if you own the snapshots), <code>self</code> for snapshots for which you own or have explicit permissions, or <code>all</code> for public snapshots.</p><p>If you are describing a long list of snapshots, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeSnapshots</code> request to retrieve the remaining results.</p><p>For more information about EBS snapshots, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html">Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSnapshotsResult`.
 
 @see AWSEC2DescribeSnapshotsRequest
 @see AWSEC2DescribeSnapshotsResult
 */
- (AWSTask<AWSEC2DescribeSnapshotsResult *> *)describeSnapshots:(AWSEC2DescribeSnapshotsRequest *)request;

/**
 <p>Describes one or more of the EBS snapshots available to you. Available snapshots include public snapshots available for any AWS account to launch, private snapshots that you own, and private snapshots owned by another AWS account but for which you've been given explicit create volume permissions.</p><p>The create volume permissions fall into the following categories:</p><ul><li><p><i>public</i>: The owner of the snapshot granted create volume permissions for the snapshot to the <code>all</code> group. All AWS accounts have create volume permissions for these snapshots.</p></li><li><p><i>explicit</i>: The owner of the snapshot granted create volume permissions to a specific AWS account.</p></li><li><p><i>implicit</i>: An AWS account has implicit create volume permissions for all snapshots it owns.</p></li></ul><p>The list of snapshots returned can be modified by specifying snapshot IDs, snapshot owners, or AWS accounts with create volume permissions. If no options are specified, Amazon EC2 returns all snapshots for which you have create volume permissions.</p><p>If you specify one or more snapshot IDs, only snapshots that have the specified IDs are returned. If you specify an invalid snapshot ID, an error is returned. If you specify a snapshot ID for which you do not have access, it is not included in the returned results.</p><p>If you specify one or more snapshot owners using the <code>OwnerIds</code> option, only snapshots from the specified owners and for which you have access are returned. The results can include the AWS account IDs of the specified owners, <code>amazon</code> for snapshots owned by Amazon, or <code>self</code> for snapshots that you own.</p><p>If you specify a list of restorable users, only snapshots with create snapshot permissions for those users are returned. You can specify AWS account IDs (if you own the snapshots), <code>self</code> for snapshots for which you own or have explicit permissions, or <code>all</code> for public snapshots.</p><p>If you are describing a long list of snapshots, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeSnapshots</code> request to retrieve the remaining results.</p><p>For more information about EBS snapshots, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html">Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSnapshotsRequest
 @see AWSEC2DescribeSnapshotsResult
 */
- (void)describeSnapshots:(AWSEC2DescribeSnapshotsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSnapshotsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the data feed for Spot Instances. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html">Spot Instance Data Feed</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotDatafeedSubscription service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotDatafeedSubscriptionResult`.
 
 @see AWSEC2DescribeSpotDatafeedSubscriptionRequest
 @see AWSEC2DescribeSpotDatafeedSubscriptionResult
 */
- (AWSTask<AWSEC2DescribeSpotDatafeedSubscriptionResult *> *)describeSpotDatafeedSubscription:(AWSEC2DescribeSpotDatafeedSubscriptionRequest *)request;

/**
 <p>Describes the data feed for Spot Instances. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html">Spot Instance Data Feed</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
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
 <p>Describes the specified Spot Instance requests.</p><p>You can use <code>DescribeSpotInstanceRequests</code> to find a running Spot Instance by examining the response. If the status of the Spot Instance is <code>fulfilled</code>, the instance ID appears in the response and contains the identifier of the instance. Alternatively, you can use <a>DescribeInstances</a> with a filter to look for instances where the instance lifecycle is <code>spot</code>.</p><p>Spot Instance requests are deleted four hours after they are canceled and their instances are terminated.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotInstanceRequests service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotInstanceRequestsResult`.
 
 @see AWSEC2DescribeSpotInstanceRequestsRequest
 @see AWSEC2DescribeSpotInstanceRequestsResult
 */
- (AWSTask<AWSEC2DescribeSpotInstanceRequestsResult *> *)describeSpotInstanceRequests:(AWSEC2DescribeSpotInstanceRequestsRequest *)request;

/**
 <p>Describes the specified Spot Instance requests.</p><p>You can use <code>DescribeSpotInstanceRequests</code> to find a running Spot Instance by examining the response. If the status of the Spot Instance is <code>fulfilled</code>, the instance ID appears in the response and contains the identifier of the instance. Alternatively, you can use <a>DescribeInstances</a> with a filter to look for instances where the instance lifecycle is <code>spot</code>.</p><p>Spot Instance requests are deleted four hours after they are canceled and their instances are terminated.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotInstanceRequests service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSpotInstanceRequestsRequest
 @see AWSEC2DescribeSpotInstanceRequestsResult
 */
- (void)describeSpotInstanceRequests:(AWSEC2DescribeSpotInstanceRequestsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSpotInstanceRequestsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Spot price history. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances-history.html">Spot Instance Pricing History</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>When you specify a start and end time, this operation returns the prices of the instance types within the time range that you specified and the time when the price changed. The price is valid within the time period that you specified; the response merely indicates the last time that the price changed.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotPriceHistory service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotPriceHistoryResult`.
 
 @see AWSEC2DescribeSpotPriceHistoryRequest
 @see AWSEC2DescribeSpotPriceHistoryResult
 */
- (AWSTask<AWSEC2DescribeSpotPriceHistoryResult *> *)describeSpotPriceHistory:(AWSEC2DescribeSpotPriceHistoryRequest *)request;

/**
 <p>Describes the Spot price history. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances-history.html">Spot Instance Pricing History</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>When you specify a start and end time, this operation returns the prices of the instance types within the time range that you specified and the time when the price changed. The price is valid within the time period that you specified; the response merely indicates the last time that the price changed.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotPriceHistory service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSpotPriceHistoryRequest
 @see AWSEC2DescribeSpotPriceHistoryResult
 */
- (void)describeSpotPriceHistory:(AWSEC2DescribeSpotPriceHistoryRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSpotPriceHistoryResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>[EC2-VPC only] Describes the stale security group rules for security groups in a specified VPC. Rules are stale when they reference a deleted security group in a peer VPC, or a security group in a peer VPC for which the VPC peering connection has been deleted.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStaleSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeStaleSecurityGroupsResult`.
 
 @see AWSEC2DescribeStaleSecurityGroupsRequest
 @see AWSEC2DescribeStaleSecurityGroupsResult
 */
- (AWSTask<AWSEC2DescribeStaleSecurityGroupsResult *> *)describeStaleSecurityGroups:(AWSEC2DescribeStaleSecurityGroupsRequest *)request;

/**
 <p>[EC2-VPC only] Describes the stale security group rules for security groups in a specified VPC. Rules are stale when they reference a deleted security group in a peer VPC, or a security group in a peer VPC for which the VPC peering connection has been deleted.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStaleSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeStaleSecurityGroupsRequest
 @see AWSEC2DescribeStaleSecurityGroupsResult
 */
- (void)describeStaleSecurityGroups:(AWSEC2DescribeStaleSecurityGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeStaleSecurityGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your subnets.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubnets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSubnetsResult`.
 
 @see AWSEC2DescribeSubnetsRequest
 @see AWSEC2DescribeSubnetsResult
 */
- (AWSTask<AWSEC2DescribeSubnetsResult *> *)describeSubnets:(AWSEC2DescribeSubnetsRequest *)request;

/**
 <p>Describes one or more of your subnets.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubnets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeSubnetsRequest
 @see AWSEC2DescribeSubnetsResult
 */
- (void)describeSubnets:(AWSEC2DescribeSubnetsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeSubnetsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of the tags for your EC2 resources.</p><p>For more information about tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTagsResult`.
 
 @see AWSEC2DescribeTagsRequest
 @see AWSEC2DescribeTagsResult
 */
- (AWSTask<AWSEC2DescribeTagsResult *> *)describeTags:(AWSEC2DescribeTagsRequest *)request;

/**
 <p>Describes one or more of the tags for your EC2 resources.</p><p>For more information about tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeTagsRequest
 @see AWSEC2DescribeTagsResult
 */
- (void)describeTags:(AWSEC2DescribeTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeTagsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified attribute of the specified volume. You can specify only one attribute at a time.</p><p>For more information about EBS volumes, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html">Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumeAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumeAttributeResult`.
 
 @see AWSEC2DescribeVolumeAttributeRequest
 @see AWSEC2DescribeVolumeAttributeResult
 */
- (AWSTask<AWSEC2DescribeVolumeAttributeResult *> *)describeVolumeAttribute:(AWSEC2DescribeVolumeAttributeRequest *)request;

/**
 <p>Describes the specified attribute of the specified volume. You can specify only one attribute at a time.</p><p>For more information about EBS volumes, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html">Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumeAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVolumeAttributeRequest
 @see AWSEC2DescribeVolumeAttributeResult
 */
- (void)describeVolumeAttribute:(AWSEC2DescribeVolumeAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVolumeAttributeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the status of the specified volumes. Volume status provides the result of the checks performed on your volumes to determine events that can impair the performance of your volumes. The performance of a volume can be affected if an issue occurs on the volume's underlying host. If the volume's underlying host experiences a power outage or system issue, after the system is restored, there could be data inconsistencies on the volume. Volume events notify you if this occurs. Volume actions notify you if any action needs to be taken in response to the event.</p><p>The <code>DescribeVolumeStatus</code> operation provides the following information about the specified volumes:</p><p><i>Status</i>: Reflects the current status of the volume. The possible values are <code>ok</code>, <code>impaired</code> , <code>warning</code>, or <code>insufficient-data</code>. If all checks pass, the overall status of the volume is <code>ok</code>. If the check fails, the overall status is <code>impaired</code>. If the status is <code>insufficient-data</code>, then the checks may still be taking place on your volume at the time. We recommend that you retry the request. For more information about volume status, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-status.html">Monitoring the Status of Your Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p><i>Events</i>: Reflect the cause of a volume status and may require you to take action. For example, if your volume returns an <code>impaired</code> status, then the volume event might be <code>potential-data-inconsistency</code>. This means that your volume has been affected by an issue with the underlying host, has all I/O operations disabled, and may have inconsistent data.</p><p><i>Actions</i>: Reflect the actions you may have to take in response to an event. For example, if the status of the volume is <code>impaired</code> and the volume event shows <code>potential-data-inconsistency</code>, then the action shows <code>enable-volume-io</code>. This means that you may want to enable the I/O operations for the volume by calling the <a>EnableVolumeIO</a> action and then check the volume for data consistency.</p><p>Volume status is based on the volume status checks, and does not reflect the volume state. Therefore, volume status does not indicate volumes in the <code>error</code> state (for example, when a volume is incapable of accepting I/O.)</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumeStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumeStatusResult`.
 
 @see AWSEC2DescribeVolumeStatusRequest
 @see AWSEC2DescribeVolumeStatusResult
 */
- (AWSTask<AWSEC2DescribeVolumeStatusResult *> *)describeVolumeStatus:(AWSEC2DescribeVolumeStatusRequest *)request;

/**
 <p>Describes the status of the specified volumes. Volume status provides the result of the checks performed on your volumes to determine events that can impair the performance of your volumes. The performance of a volume can be affected if an issue occurs on the volume's underlying host. If the volume's underlying host experiences a power outage or system issue, after the system is restored, there could be data inconsistencies on the volume. Volume events notify you if this occurs. Volume actions notify you if any action needs to be taken in response to the event.</p><p>The <code>DescribeVolumeStatus</code> operation provides the following information about the specified volumes:</p><p><i>Status</i>: Reflects the current status of the volume. The possible values are <code>ok</code>, <code>impaired</code> , <code>warning</code>, or <code>insufficient-data</code>. If all checks pass, the overall status of the volume is <code>ok</code>. If the check fails, the overall status is <code>impaired</code>. If the status is <code>insufficient-data</code>, then the checks may still be taking place on your volume at the time. We recommend that you retry the request. For more information about volume status, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-status.html">Monitoring the Status of Your Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p><i>Events</i>: Reflect the cause of a volume status and may require you to take action. For example, if your volume returns an <code>impaired</code> status, then the volume event might be <code>potential-data-inconsistency</code>. This means that your volume has been affected by an issue with the underlying host, has all I/O operations disabled, and may have inconsistent data.</p><p><i>Actions</i>: Reflect the actions you may have to take in response to an event. For example, if the status of the volume is <code>impaired</code> and the volume event shows <code>potential-data-inconsistency</code>, then the action shows <code>enable-volume-io</code>. This means that you may want to enable the I/O operations for the volume by calling the <a>EnableVolumeIO</a> action and then check the volume for data consistency.</p><p>Volume status is based on the volume status checks, and does not reflect the volume state. Therefore, volume status does not indicate volumes in the <code>error</code> state (for example, when a volume is incapable of accepting I/O.)</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumeStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVolumeStatusRequest
 @see AWSEC2DescribeVolumeStatusResult
 */
- (void)describeVolumeStatus:(AWSEC2DescribeVolumeStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVolumeStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified EBS volumes.</p><p>If you are describing a long list of volumes, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeVolumes</code> request to retrieve the remaining results.</p><p>For more information about EBS volumes, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html">Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumesResult`.
 
 @see AWSEC2DescribeVolumesRequest
 @see AWSEC2DescribeVolumesResult
 */
- (AWSTask<AWSEC2DescribeVolumesResult *> *)describeVolumes:(AWSEC2DescribeVolumesRequest *)request;

/**
 <p>Describes the specified EBS volumes.</p><p>If you are describing a long list of volumes, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeVolumes</code> request to retrieve the remaining results.</p><p>For more information about EBS volumes, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html">Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVolumesRequest
 @see AWSEC2DescribeVolumesResult
 */
- (void)describeVolumes:(AWSEC2DescribeVolumesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVolumesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reports the current modification status of EBS volumes.</p><p>Current-generation EBS volumes support modification of attributes including type, size, and (for <code>io1</code> volumes) IOPS provisioning while either attached to or detached from an instance. Following an action from the API or the console to modify a volume, the status of the modification may be <code>modifying</code>, <code>optimizing</code>, <code>completed</code>, or <code>failed</code>. If a volume has never been modified, then certain elements of the returned <code>VolumeModification</code> objects are null. </p><p> You can also use CloudWatch Events to check the status of a modification to an EBS volume. For information about CloudWatch Events, see the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/events/">Amazon CloudWatch Events User Guide</a>. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#monitoring_mods">Monitoring Volume Modifications"</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumesModifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumesModificationsResult`.
 
 @see AWSEC2DescribeVolumesModificationsRequest
 @see AWSEC2DescribeVolumesModificationsResult
 */
- (AWSTask<AWSEC2DescribeVolumesModificationsResult *> *)describeVolumesModifications:(AWSEC2DescribeVolumesModificationsRequest *)request;

/**
 <p>Reports the current modification status of EBS volumes.</p><p>Current-generation EBS volumes support modification of attributes including type, size, and (for <code>io1</code> volumes) IOPS provisioning while either attached to or detached from an instance. Following an action from the API or the console to modify a volume, the status of the modification may be <code>modifying</code>, <code>optimizing</code>, <code>completed</code>, or <code>failed</code>. If a volume has never been modified, then certain elements of the returned <code>VolumeModification</code> objects are null. </p><p> You can also use CloudWatch Events to check the status of a modification to an EBS volume. For information about CloudWatch Events, see the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/events/">Amazon CloudWatch Events User Guide</a>. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#monitoring_mods">Monitoring Volume Modifications"</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Describes the ClassicLink DNS support status of one or more VPCs. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcClassicLinkDnsSupport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcClassicLinkDnsSupportResult`.
 
 @see AWSEC2DescribeVpcClassicLinkDnsSupportRequest
 @see AWSEC2DescribeVpcClassicLinkDnsSupportResult
 */
- (AWSTask<AWSEC2DescribeVpcClassicLinkDnsSupportResult *> *)describeVpcClassicLinkDnsSupport:(AWSEC2DescribeVpcClassicLinkDnsSupportRequest *)request;

/**
 <p>Describes the ClassicLink DNS support status of one or more VPCs. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Describes one or more of your VPN connections.</p><p>For more information about VPN connections, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpnConnections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpnConnectionsResult`.
 
 @see AWSEC2DescribeVpnConnectionsRequest
 @see AWSEC2DescribeVpnConnectionsResult
 */
- (AWSTask<AWSEC2DescribeVpnConnectionsResult *> *)describeVpnConnections:(AWSEC2DescribeVpnConnectionsRequest *)request;

/**
 <p>Describes one or more of your VPN connections.</p><p>For more information about VPN connections, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpnConnections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DescribeVpnConnectionsRequest
 @see AWSEC2DescribeVpnConnectionsResult
 */
- (void)describeVpnConnections:(AWSEC2DescribeVpnConnectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DescribeVpnConnectionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of your virtual private gateways.</p><p>For more information about virtual private gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpnGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpnGatewaysResult`.
 
 @see AWSEC2DescribeVpnGatewaysRequest
 @see AWSEC2DescribeVpnGatewaysResult
 */
- (AWSTask<AWSEC2DescribeVpnGatewaysResult *> *)describeVpnGateways:(AWSEC2DescribeVpnGatewaysRequest *)request;

/**
 <p>Describes one or more of your virtual private gateways.</p><p>For more information about virtual private gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">AWS Managed VPN Connections</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Detaches an EBS volume from an instance. Make sure to unmount any file systems on the device within your operating system before detaching the volume. Failure to do so can result in the volume becoming stuck in the <code>busy</code> state while detaching. If this happens, detachment can be delayed indefinitely until you unmount the volume, force detachment, reboot the instance, or all three. If an EBS volume is the root device of an instance, it can't be detached while the instance is running. To detach the root volume, stop the instance first.</p><p>When a volume with an AWS Marketplace product code is detached from an instance, the product code is no longer associated with the instance.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-detaching-volume.html">Detaching an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DetachVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2VolumeAttachment`.
 
 @see AWSEC2DetachVolumeRequest
 @see AWSEC2VolumeAttachment
 */
- (AWSTask<AWSEC2VolumeAttachment *> *)detachVolume:(AWSEC2DetachVolumeRequest *)request;

/**
 <p>Detaches an EBS volume from an instance. Make sure to unmount any file systems on the device within your operating system before detaching the volume. Failure to do so can result in the volume becoming stuck in the <code>busy</code> state while detaching. If this happens, detachment can be delayed indefinitely until you unmount the volume, force detachment, reboot the instance, or all three. If an EBS volume is the root device of an instance, it can't be detached while the instance is running. To detach the root volume, stop the instance first.</p><p>When a volume with an AWS Marketplace product code is detached from an instance, the product code is no longer associated with the instance.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-detaching-volume.html">Detaching an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Disables ClassicLink DNS support for a VPC. If disabled, DNS hostnames resolve to public IP addresses when addressed between a linked EC2-Classic instance and instances in the VPC to which it's linked. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisableVpcClassicLinkDnsSupport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisableVpcClassicLinkDnsSupportResult`.
 
 @see AWSEC2DisableVpcClassicLinkDnsSupportRequest
 @see AWSEC2DisableVpcClassicLinkDnsSupportResult
 */
- (AWSTask<AWSEC2DisableVpcClassicLinkDnsSupportResult *> *)disableVpcClassicLinkDnsSupport:(AWSEC2DisableVpcClassicLinkDnsSupportRequest *)request;

/**
 <p>Disables ClassicLink DNS support for a VPC. If disabled, DNS hostnames resolve to public IP addresses when addressed between a linked EC2-Classic instance and instances in the VPC to which it's linked. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisableVpcClassicLinkDnsSupport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisableVpcClassicLinkDnsSupportRequest
 @see AWSEC2DisableVpcClassicLinkDnsSupportResult
 */
- (void)disableVpcClassicLinkDnsSupport:(AWSEC2DisableVpcClassicLinkDnsSupportRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2DisableVpcClassicLinkDnsSupportResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disassociates an Elastic IP address from the instance or network interface it's associated with.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DisassociateAddressRequest
 */
- (AWSTask *)disassociateAddress:(AWSEC2DisassociateAddressRequest *)request;

/**
 <p>Disassociates an Elastic IP address from the instance or network interface it's associated with.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2DisassociateAddressRequest
 */
- (void)disassociateAddress:(AWSEC2DisassociateAddressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

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
 <p>Disassociates a subnet from a route table.</p><p>After you perform this action, the subnet no longer uses the routes in the route table. Instead, it uses the routes in the VPC's main route table. For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateRouteTable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DisassociateRouteTableRequest
 */
- (AWSTask *)disassociateRouteTable:(AWSEC2DisassociateRouteTableRequest *)request;

/**
 <p>Disassociates a subnet from a route table.</p><p>After you perform this action, the subnet no longer uses the routes in the route table. Instead, it uses the routes in the VPC's main route table. For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Enables a VPC for ClassicLink. You can then link EC2-Classic instances to your ClassicLink-enabled VPC to allow communication over private IP addresses. You cannot enable your VPC for ClassicLink if any of your VPC route tables have existing routes for address ranges within the <code>10.0.0.0/8</code> IP address range, excluding local routes for VPCs in the <code>10.0.0.0/16</code> and <code>10.1.0.0/16</code> IP address ranges. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableVpcClassicLink service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2EnableVpcClassicLinkResult`.
 
 @see AWSEC2EnableVpcClassicLinkRequest
 @see AWSEC2EnableVpcClassicLinkResult
 */
- (AWSTask<AWSEC2EnableVpcClassicLinkResult *> *)enableVpcClassicLink:(AWSEC2EnableVpcClassicLinkRequest *)request;

/**
 <p>Enables a VPC for ClassicLink. You can then link EC2-Classic instances to your ClassicLink-enabled VPC to allow communication over private IP addresses. You cannot enable your VPC for ClassicLink if any of your VPC route tables have existing routes for address ranges within the <code>10.0.0.0/8</code> IP address range, excluding local routes for VPCs in the <code>10.0.0.0/16</code> and <code>10.1.0.0/16</code> IP address ranges. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableVpcClassicLink service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2EnableVpcClassicLinkRequest
 @see AWSEC2EnableVpcClassicLinkResult
 */
- (void)enableVpcClassicLink:(AWSEC2EnableVpcClassicLinkRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2EnableVpcClassicLinkResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables a VPC to support DNS hostname resolution for ClassicLink. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableVpcClassicLinkDnsSupport service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2EnableVpcClassicLinkDnsSupportResult`.
 
 @see AWSEC2EnableVpcClassicLinkDnsSupportRequest
 @see AWSEC2EnableVpcClassicLinkDnsSupportResult
 */
- (AWSTask<AWSEC2EnableVpcClassicLinkDnsSupportResult *> *)enableVpcClassicLinkDnsSupport:(AWSEC2EnableVpcClassicLinkDnsSupportRequest *)request;

/**
 <p>Enables a VPC to support DNS hostname resolution for ClassicLink. If enabled, the DNS hostname of a linked EC2-Classic instance resolves to its private IP address when addressed from an instance in the VPC to which it's linked. Similarly, the DNS hostname of an instance in a VPC resolves to its private IP address when addressed from a linked EC2-Classic instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableVpcClassicLinkDnsSupport service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2EnableVpcClassicLinkDnsSupportRequest
 @see AWSEC2EnableVpcClassicLinkDnsSupportResult
 */
- (void)enableVpcClassicLinkDnsSupport:(AWSEC2EnableVpcClassicLinkDnsSupportRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2EnableVpcClassicLinkDnsSupportResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the console output for the specified instance. For Linux instances, the instance console output displays the exact console output that would normally be displayed on a physical monitor attached to a computer. For Windows instances, the instance console output includes the last three system event log errors.</p><p>By default, the console output returns buffered information that was posted shortly after an instance transition state (start, stop, reboot, or terminate). This information is available for at least one hour after the most recent post. Only the most recent 64 KB of console output is available.</p><p>You can optionally retrieve the latest serial console output at any time during the instance lifecycle. This option is supported on instance types that use the Nitro hypervisor.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html#instance-console-console-output">Instance Console Output</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetConsoleOutput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetConsoleOutputResult`.
 
 @see AWSEC2GetConsoleOutputRequest
 @see AWSEC2GetConsoleOutputResult
 */
- (AWSTask<AWSEC2GetConsoleOutputResult *> *)getConsoleOutput:(AWSEC2GetConsoleOutputRequest *)request;

/**
 <p>Gets the console output for the specified instance. For Linux instances, the instance console output displays the exact console output that would normally be displayed on a physical monitor attached to a computer. For Windows instances, the instance console output includes the last three system event log errors.</p><p>By default, the console output returns buffered information that was posted shortly after an instance transition state (start, stop, reboot, or terminate). This information is available for at least one hour after the most recent post. Only the most recent 64 KB of console output is available.</p><p>You can optionally retrieve the latest serial console output at any time during the instance lifecycle. This option is supported on instance types that use the Nitro hypervisor.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html#instance-console-console-output">Instance Console Output</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Retrieves the encrypted administrator password for a running Windows instance.</p><p>The Windows password is generated at boot by the <code>EC2Config</code> service or <code>EC2Launch</code> scripts (Windows Server 2016 and later). This usually only happens the first time an instance is launched. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/UsingConfig_WinAMI.html">EC2Config</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2launch.html">EC2Launch</a> in the Amazon Elastic Compute Cloud User Guide.</p><p>For the <code>EC2Config</code> service, the password is not generated for rebundled AMIs unless <code>Ec2SetPassword</code> is enabled before bundling.</p><p>The password is encrypted using the key pair that you specified when you launched the instance. You must provide the corresponding key pair file.</p><p>When you launch an instance, password generation and encryption may take a few minutes. If you try to retrieve the password before it's available, the output returns an empty string. We recommend that you wait up to 15 minutes after launching an instance before trying to retrieve the generated password.</p>
 
 @param request A container for the necessary parameters to execute the GetPasswordData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetPasswordDataResult`.
 
 @see AWSEC2GetPasswordDataRequest
 @see AWSEC2GetPasswordDataResult
 */
- (AWSTask<AWSEC2GetPasswordDataResult *> *)getPasswordData:(AWSEC2GetPasswordDataRequest *)request;

/**
 <p>Retrieves the encrypted administrator password for a running Windows instance.</p><p>The Windows password is generated at boot by the <code>EC2Config</code> service or <code>EC2Launch</code> scripts (Windows Server 2016 and later). This usually only happens the first time an instance is launched. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/UsingConfig_WinAMI.html">EC2Config</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2launch.html">EC2Launch</a> in the Amazon Elastic Compute Cloud User Guide.</p><p>For the <code>EC2Config</code> service, the password is not generated for rebundled AMIs unless <code>Ec2SetPassword</code> is enabled before bundling.</p><p>The password is encrypted using the key pair that you specified when you launched the instance. You must provide the corresponding key pair file.</p><p>When you launch an instance, password generation and encryption may take a few minutes. If you try to retrieve the password before it's available, the output returns an empty string. We recommend that you wait up to 15 minutes after launching an instance before trying to retrieve the generated password.</p>
 
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
 <p>Import single or multi-volume disk images or EBS snapshots into an Amazon Machine Image (AMI). For more information, see <a href="http://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html">Importing a VM as an Image Using VM Import/Export</a> in the <i>VM Import/Export User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ImportImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportImageResult`.
 
 @see AWSEC2ImportImageRequest
 @see AWSEC2ImportImageResult
 */
- (AWSTask<AWSEC2ImportImageResult *> *)importImage:(AWSEC2ImportImageRequest *)request;

/**
 <p>Import single or multi-volume disk images or EBS snapshots into an Amazon Machine Image (AMI). For more information, see <a href="http://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html">Importing a VM as an Image Using VM Import/Export</a> in the <i>VM Import/Export User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ImportImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ImportImageRequest
 @see AWSEC2ImportImageResult
 */
- (void)importImage:(AWSEC2ImportImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ImportImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an import instance task using metadata from the specified disk image. <code>ImportInstance</code> only supports single-volume VMs. To import multi-volume VMs, use <a>ImportImage</a>. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html">Importing a Virtual Machine Using the Amazon EC2 CLI</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the ImportInstance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportInstanceResult`.
 
 @see AWSEC2ImportInstanceRequest
 @see AWSEC2ImportInstanceResult
 */
- (AWSTask<AWSEC2ImportInstanceResult *> *)importInstance:(AWSEC2ImportInstanceRequest *)request;

/**
 <p>Creates an import instance task using metadata from the specified disk image. <code>ImportInstance</code> only supports single-volume VMs. To import multi-volume VMs, use <a>ImportImage</a>. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html">Importing a Virtual Machine Using the Amazon EC2 CLI</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the ImportInstance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ImportInstanceRequest
 @see AWSEC2ImportInstanceResult
 */
- (void)importInstance:(AWSEC2ImportInstanceRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ImportInstanceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Imports the public key from an RSA key pair that you created with a third-party tool. Compare this with <a>CreateKeyPair</a>, in which AWS creates the key pair and gives the keys to you (AWS keeps a copy of the public key). With ImportKeyPair, you create the key pair and give AWS just the public key. The private key is never transferred between you and AWS.</p><p>For more information about key pairs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ImportKeyPair service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportKeyPairResult`.
 
 @see AWSEC2ImportKeyPairRequest
 @see AWSEC2ImportKeyPairResult
 */
- (AWSTask<AWSEC2ImportKeyPairResult *> *)importKeyPair:(AWSEC2ImportKeyPairRequest *)request;

/**
 <p>Imports the public key from an RSA key pair that you created with a third-party tool. Compare this with <a>CreateKeyPair</a>, in which AWS creates the key pair and gives the keys to you (AWS keeps a copy of the public key). With ImportKeyPair, you create the key pair and give AWS just the public key. The private key is never transferred between you and AWS.</p><p>For more information about key pairs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Creates an import volume task using metadata from the specified disk image.For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/importing-your-volumes-into-amazon-ebs.html">Importing Disks to Amazon EBS</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the ImportVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportVolumeResult`.
 
 @see AWSEC2ImportVolumeRequest
 @see AWSEC2ImportVolumeResult
 */
- (AWSTask<AWSEC2ImportVolumeResult *> *)importVolume:(AWSEC2ImportVolumeRequest *)request;

/**
 <p>Creates an import volume task using metadata from the specified disk image.For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/importing-your-volumes-into-amazon-ebs.html">Importing Disks to Amazon EBS</a>.</p><p>For information about the import manifest referenced by this API action, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 
 @param request A container for the necessary parameters to execute the ImportVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ImportVolumeRequest
 @see AWSEC2ImportVolumeResult
 */
- (void)importVolume:(AWSEC2ImportVolumeRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ImportVolumeResult * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Modifies the specified EC2 Fleet.</p><p>While the EC2 Fleet is being modified, it is in the <code>modifying</code> state.</p>
 
 @param request A container for the necessary parameters to execute the ModifyFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyFleetResult`.
 
 @see AWSEC2ModifyFleetRequest
 @see AWSEC2ModifyFleetResult
 */
- (AWSTask<AWSEC2ModifyFleetResult *> *)modifyFleet:(AWSEC2ModifyFleetRequest *)request;

/**
 <p>Modifies the specified EC2 Fleet.</p><p>While the EC2 Fleet is being modified, it is in the <code>modifying</code> state.</p>
 
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
 <p>Modify the auto-placement setting of a Dedicated Host. When auto-placement is enabled, any instances that you launch with a tenancy of <code>host</code> but without a specific host ID are placed onto any available Dedicated Host in your account that has auto-placement enabled. When auto-placement is disabled, you need to provide a host ID to have the instance launch onto a specific host. If no host ID is provided, the instance is launched onto a suitable host with auto-placement enabled.</p>
 
 @param request A container for the necessary parameters to execute the ModifyHosts service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyHostsResult`.
 
 @see AWSEC2ModifyHostsRequest
 @see AWSEC2ModifyHostsResult
 */
- (AWSTask<AWSEC2ModifyHostsResult *> *)modifyHosts:(AWSEC2ModifyHostsRequest *)request;

/**
 <p>Modify the auto-placement setting of a Dedicated Host. When auto-placement is enabled, any instances that you launch with a tenancy of <code>host</code> but without a specific host ID are placed onto any available Dedicated Host in your account that has auto-placement enabled. When auto-placement is disabled, you need to provide a host ID to have the instance launch onto a specific host. If no host ID is provided, the instance is launched onto a suitable host with auto-placement enabled.</p>
 
 @param request A container for the necessary parameters to execute the ModifyHosts service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyHostsRequest
 @see AWSEC2ModifyHostsResult
 */
- (void)modifyHosts:(AWSEC2ModifyHostsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyHostsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the ID format for the specified resource on a per-region basis. You can specify that resources should receive longer IDs (17-character IDs) when they are created.</p><p>This request can only be used to modify longer ID settings for resource types that are within the opt-in period. Resources currently in their opt-in period include: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>.</p><p>This setting applies to the IAM user who makes the request; it does not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user. If you're using this action as the root user, then these settings apply to the entire account, unless an IAM user explicitly overrides these settings for themselves. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p><p>Resources created with longer IDs are visible to all IAM roles and users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the ModifyIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyIdFormatRequest
 */
- (AWSTask *)modifyIdFormat:(AWSEC2ModifyIdFormatRequest *)request;

/**
 <p>Modifies the ID format for the specified resource on a per-region basis. You can specify that resources should receive longer IDs (17-character IDs) when they are created.</p><p>This request can only be used to modify longer ID settings for resource types that are within the opt-in period. Resources currently in their opt-in period include: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>.</p><p>This setting applies to the IAM user who makes the request; it does not apply to the entire AWS account. By default, an IAM user defaults to the same settings as the root user. If you're using this action as the root user, then these settings apply to the entire account, unless an IAM user explicitly overrides these settings for themselves. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p><p>Resources created with longer IDs are visible to all IAM roles and users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the ModifyIdFormat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyIdFormatRequest
 */
- (void)modifyIdFormat:(AWSEC2ModifyIdFormatRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the ID format of a resource for a specified IAM user, IAM role, or the root user for an account; or all IAM users, IAM roles, and the root user for an account. You can specify that resources should receive longer IDs (17-character IDs) when they are created. </p><p>This request can only be used to modify longer ID settings for resource types that are within the opt-in period. Resources currently in their opt-in period include: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p><p>This setting applies to the principal specified in the request; it does not apply to the principal that makes the request. </p><p>Resources created with longer IDs are visible to all IAM roles and users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
 @param request A container for the necessary parameters to execute the ModifyIdentityIdFormat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyIdentityIdFormatRequest
 */
- (AWSTask *)modifyIdentityIdFormat:(AWSEC2ModifyIdentityIdFormatRequest *)request;

/**
 <p>Modifies the ID format of a resource for a specified IAM user, IAM role, or the root user for an account; or all IAM users, IAM roles, and the root user for an account. You can specify that resources should receive longer IDs (17-character IDs) when they are created. </p><p>This request can only be used to modify longer ID settings for resource types that are within the opt-in period. Resources currently in their opt-in period include: <code>bundle</code> | <code>conversion-task</code> | <code>customer-gateway</code> | <code>dhcp-options</code> | <code>elastic-ip-allocation</code> | <code>elastic-ip-association</code> | <code>export-task</code> | <code>flow-log</code> | <code>image</code> | <code>import-task</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-acl-association</code> | <code>network-interface</code> | <code>network-interface-attachment</code> | <code>prefix-list</code> | <code>route-table</code> | <code>route-table-association</code> | <code>security-group</code> | <code>subnet</code> | <code>subnet-cidr-block-association</code> | <code>vpc</code> | <code>vpc-cidr-block-association</code> | <code>vpc-endpoint</code> | <code>vpc-peering-connection</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>. </p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html">Resource IDs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p><p>This setting applies to the principal specified in the request; it does not apply to the principal that makes the request. </p><p>Resources created with longer IDs are visible to all IAM roles and users, regardless of these settings and provided that they have permission to use the relevant <code>Describe</code> command for the resource type.</p>
 
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
 <p>Modifies the specified attribute of the specified instance. You can specify only one attribute at a time.</p><p><b>Note: </b>Using this action to change the security groups associated with an elastic network interface (ENI) attached to an instance in a VPC can result in an error if the instance has more than one ENI. To change the security groups associated with an ENI attached to an instance that has multiple ENIs, we recommend that you use the <a>ModifyNetworkInterfaceAttribute</a> action.</p><p>To modify some attributes, the instance must be stopped. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html">Modifying Attributes of a Stopped Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyInstanceAttributeRequest
 */
- (AWSTask *)modifyInstanceAttribute:(AWSEC2ModifyInstanceAttributeRequest *)request;

/**
 <p>Modifies the specified attribute of the specified instance. You can specify only one attribute at a time.</p><p><b>Note: </b>Using this action to change the security groups associated with an elastic network interface (ENI) attached to an instance in a VPC can result in an error if the instance has more than one ENI. To change the security groups associated with an ENI attached to an instance that has multiple ENIs, we recommend that you use the <a>ModifyNetworkInterfaceAttribute</a> action.</p><p>To modify some attributes, the instance must be stopped. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html">Modifying Attributes of a Stopped Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Modifies the credit option for CPU usage on a running or stopped T2 or T3 instance. The credit options are <code>standard</code> and <code>unlimited</code>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceCreditSpecification service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyInstanceCreditSpecificationResult`.
 
 @see AWSEC2ModifyInstanceCreditSpecificationRequest
 @see AWSEC2ModifyInstanceCreditSpecificationResult
 */
- (AWSTask<AWSEC2ModifyInstanceCreditSpecificationResult *> *)modifyInstanceCreditSpecification:(AWSEC2ModifyInstanceCreditSpecificationRequest *)request;

/**
 <p>Modifies the credit option for CPU usage on a running or stopped T2 or T3 instance. The credit options are <code>standard</code> and <code>unlimited</code>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable Performance Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceCreditSpecification service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyInstanceCreditSpecificationRequest
 @see AWSEC2ModifyInstanceCreditSpecificationResult
 */
- (void)modifyInstanceCreditSpecification:(AWSEC2ModifyInstanceCreditSpecificationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyInstanceCreditSpecificationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the placement attributes for a specified instance. You can do the following:</p><ul><li><p>Modify the affinity between an instance and a <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html">Dedicated Host</a>. When affinity is set to <code>host</code> and the instance is not associated with a specific Dedicated Host, the next time the instance is launched, it is automatically associated with the host on which it lands. If the instance is restarted or rebooted, this relationship persists.</p></li><li><p>Change the Dedicated Host with which an instance is associated.</p></li><li><p>Change the instance tenancy of an instance from <code>host</code> to <code>dedicated</code>, or from <code>dedicated</code> to <code>host</code>.</p></li><li><p>Move an instance to or from a <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">placement group</a>.</p></li></ul><p>At least one attribute for affinity, host ID, tenancy, or placement group name must be specified in the request. Affinity and tenancy can be modified in the same request.</p><p>To modify the host ID, tenancy, or placement group for an instance, the instance must be in the <code>stopped</code> state.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstancePlacement service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyInstancePlacementResult`.
 
 @see AWSEC2ModifyInstancePlacementRequest
 @see AWSEC2ModifyInstancePlacementResult
 */
- (AWSTask<AWSEC2ModifyInstancePlacementResult *> *)modifyInstancePlacement:(AWSEC2ModifyInstancePlacementRequest *)request;

/**
 <p>Modifies the placement attributes for a specified instance. You can do the following:</p><ul><li><p>Modify the affinity between an instance and a <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html">Dedicated Host</a>. When affinity is set to <code>host</code> and the instance is not associated with a specific Dedicated Host, the next time the instance is launched, it is automatically associated with the host on which it lands. If the instance is restarted or rebooted, this relationship persists.</p></li><li><p>Change the Dedicated Host with which an instance is associated.</p></li><li><p>Change the instance tenancy of an instance from <code>host</code> to <code>dedicated</code>, or from <code>dedicated</code> to <code>host</code>.</p></li><li><p>Move an instance to or from a <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">placement group</a>.</p></li></ul><p>At least one attribute for affinity, host ID, tenancy, or placement group name must be specified in the request. Affinity and tenancy can be modified in the same request.</p><p>To modify the host ID, tenancy, or placement group for an instance, the instance must be in the <code>stopped</code> state.</p>
 
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
 <p>Modifies the specified network interface attribute. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the ModifyNetworkInterfaceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyNetworkInterfaceAttributeRequest
 */
- (AWSTask *)modifyNetworkInterfaceAttribute:(AWSEC2ModifyNetworkInterfaceAttributeRequest *)request;

/**
 <p>Modifies the specified network interface attribute. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the ModifyNetworkInterfaceAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyNetworkInterfaceAttributeRequest
 */
- (void)modifyNetworkInterfaceAttribute:(AWSEC2ModifyNetworkInterfaceAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the Availability Zone, instance count, instance type, or network platform (EC2-Classic or EC2-VPC) of your Reserved Instances. The Reserved Instances to be modified must be identical, except for Availability Zone, network platform, and instance type.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReservedInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyReservedInstancesResult`.
 
 @see AWSEC2ModifyReservedInstancesRequest
 @see AWSEC2ModifyReservedInstancesResult
 */
- (AWSTask<AWSEC2ModifyReservedInstancesResult *> *)modifyReservedInstances:(AWSEC2ModifyReservedInstancesRequest *)request;

/**
 <p>Modifies the Availability Zone, instance count, instance type, or network platform (EC2-Classic or EC2-VPC) of your Reserved Instances. The Reserved Instances to be modified must be identical, except for Availability Zone, network platform, and instance type.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReservedInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyReservedInstancesRequest
 @see AWSEC2ModifyReservedInstancesResult
 */
- (void)modifyReservedInstances:(AWSEC2ModifyReservedInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyReservedInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds or removes permission settings for the specified snapshot. You may add or remove specified AWS account IDs from a snapshot's list of create volume permissions, but you cannot do both in a single API call. If you need to both add and remove account IDs for a snapshot, you must use multiple API calls.</p><p>Encrypted snapshots and snapshots with AWS Marketplace product codes cannot be made public. Snapshots encrypted with your default CMK cannot be shared with other accounts.</p><p>For more information about modifying snapshot permissions, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifySnapshotAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifySnapshotAttributeRequest
 */
- (AWSTask *)modifySnapshotAttribute:(AWSEC2ModifySnapshotAttributeRequest *)request;

/**
 <p>Adds or removes permission settings for the specified snapshot. You may add or remove specified AWS account IDs from a snapshot's list of create volume permissions, but you cannot do both in a single API call. If you need to both add and remove account IDs for a snapshot, you must use multiple API calls.</p><p>Encrypted snapshots and snapshots with AWS Marketplace product codes cannot be made public. Snapshots encrypted with your default CMK cannot be shared with other accounts.</p><p>For more information about modifying snapshot permissions, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifySnapshotAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifySnapshotAttributeRequest
 */
- (void)modifySnapshotAttribute:(AWSEC2ModifySnapshotAttributeRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the specified Spot Fleet request.</p><p>While the Spot Fleet request is being modified, it is in the <code>modifying</code> state.</p><p>To scale up your Spot Fleet, increase its target capacity. The Spot Fleet launches the additional Spot Instances according to the allocation strategy for the Spot Fleet request. If the allocation strategy is <code>lowestPrice</code>, the Spot Fleet launches instances using the Spot pool with the lowest price. If the allocation strategy is <code>diversified</code>, the Spot Fleet distributes the instances across the Spot pools.</p><p>To scale down your Spot Fleet, decrease its target capacity. First, the Spot Fleet cancels any open requests that exceed the new target capacity. You can request that the Spot Fleet terminate Spot Instances until the size of the fleet no longer exceeds the new target capacity. If the allocation strategy is <code>lowestPrice</code>, the Spot Fleet terminates the instances with the highest price per unit. If the allocation strategy is <code>diversified</code>, the Spot Fleet terminates instances across the Spot pools. Alternatively, you can request that the Spot Fleet keep the fleet at its current size, but not replace any Spot Instances that are interrupted or that you terminate manually.</p><p>If you are finished with your Spot Fleet for now, but will use it again later, you can set the target capacity to 0.</p>
 
 @param request A container for the necessary parameters to execute the ModifySpotFleetRequest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifySpotFleetRequestResponse`.
 
 @see AWSEC2ModifySpotFleetRequestRequest
 @see AWSEC2ModifySpotFleetRequestResponse
 */
- (AWSTask<AWSEC2ModifySpotFleetRequestResponse *> *)modifySpotFleetRequest:(AWSEC2ModifySpotFleetRequestRequest *)request;

/**
 <p>Modifies the specified Spot Fleet request.</p><p>While the Spot Fleet request is being modified, it is in the <code>modifying</code> state.</p><p>To scale up your Spot Fleet, increase its target capacity. The Spot Fleet launches the additional Spot Instances according to the allocation strategy for the Spot Fleet request. If the allocation strategy is <code>lowestPrice</code>, the Spot Fleet launches instances using the Spot pool with the lowest price. If the allocation strategy is <code>diversified</code>, the Spot Fleet distributes the instances across the Spot pools.</p><p>To scale down your Spot Fleet, decrease its target capacity. First, the Spot Fleet cancels any open requests that exceed the new target capacity. You can request that the Spot Fleet terminate Spot Instances until the size of the fleet no longer exceeds the new target capacity. If the allocation strategy is <code>lowestPrice</code>, the Spot Fleet terminates the instances with the highest price per unit. If the allocation strategy is <code>diversified</code>, the Spot Fleet terminates instances across the Spot pools. Alternatively, you can request that the Spot Fleet keep the fleet at its current size, but not replace any Spot Instances that are interrupted or that you terminate manually.</p><p>If you are finished with your Spot Fleet for now, but will use it again later, you can set the target capacity to 0.</p>
 
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
 <p>You can modify several parameters of an existing EBS volume, including volume size, volume type, and IOPS capacity. If your EBS volume is attached to a current-generation EC2 instance type, you may be able to apply these changes without stopping the instance or detaching the volume from it. For more information about modifying an EBS volume running Linux, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Linux</a>. For more information about modifying an EBS volume running Windows, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Windows</a>. </p><p> When you complete a resize operation on your volume, you need to extend the volume's file-system size to take advantage of the new storage capacity. For information about extending a Linux file system, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#recognize-expanded-volume-linux">Extending a Linux File System</a>. For information about extending a Windows file system, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html#recognize-expanded-volume-windows">Extending a Windows File System</a>. </p><p> You can use CloudWatch Events to check the status of a modification to an EBS volume. For information about CloudWatch Events, see the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/events/">Amazon CloudWatch Events User Guide</a>. You can also track the status of a modification using the <a>DescribeVolumesModifications</a> API. For information about tracking status changes using either method, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#monitoring_mods">Monitoring Volume Modifications</a>. </p><p>With previous-generation instance types, resizing an EBS volume may require detaching and reattaching the volume or stopping and restarting the instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Linux</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Windows</a>.</p><p>If you reach the maximum volume modification rate per volume limit, you will need to wait at least six hours before applying further modifications to the affected EBS volume.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVolumeResult`.
 
 @see AWSEC2ModifyVolumeRequest
 @see AWSEC2ModifyVolumeResult
 */
- (AWSTask<AWSEC2ModifyVolumeResult *> *)modifyVolume:(AWSEC2ModifyVolumeRequest *)request;

/**
 <p>You can modify several parameters of an existing EBS volume, including volume size, volume type, and IOPS capacity. If your EBS volume is attached to a current-generation EC2 instance type, you may be able to apply these changes without stopping the instance or detaching the volume from it. For more information about modifying an EBS volume running Linux, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Linux</a>. For more information about modifying an EBS volume running Windows, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Windows</a>. </p><p> When you complete a resize operation on your volume, you need to extend the volume's file-system size to take advantage of the new storage capacity. For information about extending a Linux file system, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#recognize-expanded-volume-linux">Extending a Linux File System</a>. For information about extending a Windows file system, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html#recognize-expanded-volume-windows">Extending a Windows File System</a>. </p><p> You can use CloudWatch Events to check the status of a modification to an EBS volume. For information about CloudWatch Events, see the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/events/">Amazon CloudWatch Events User Guide</a>. You can also track the status of a modification using the <a>DescribeVolumesModifications</a> API. For information about tracking status changes using either method, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#monitoring_mods">Monitoring Volume Modifications</a>. </p><p>With previous-generation instance types, resizing an EBS volume may require detaching and reattaching the volume or stopping and restarting the instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Linux</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html">Modifying the Size, IOPS, or Type of an EBS Volume on Windows</a>.</p><p>If you reach the maximum volume modification rate per volume limit, you will need to wait at least six hours before applying further modifications to the affected EBS volume.</p>
 
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
 <p>Modifies attributes of a specified VPC endpoint. The attributes that you can modify depend on the type of VPC endpoint (interface or gateway). For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-endpoints.html">VPC Endpoints</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcEndpointResult`.
 
 @see AWSEC2ModifyVpcEndpointRequest
 @see AWSEC2ModifyVpcEndpointResult
 */
- (AWSTask<AWSEC2ModifyVpcEndpointResult *> *)modifyVpcEndpoint:(AWSEC2ModifyVpcEndpointRequest *)request;

/**
 <p>Modifies attributes of a specified VPC endpoint. The attributes that you can modify depend on the type of VPC endpoint (interface or gateway). For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-endpoints.html">VPC Endpoints</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Modifies the attributes of your VPC endpoint service configuration. You can change the Network Load Balancers for your service, and you can specify whether acceptance is required for requests to connect to your endpoint service through an interface VPC endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpointServiceConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcEndpointServiceConfigurationResult`.
 
 @see AWSEC2ModifyVpcEndpointServiceConfigurationRequest
 @see AWSEC2ModifyVpcEndpointServiceConfigurationResult
 */
- (AWSTask<AWSEC2ModifyVpcEndpointServiceConfigurationResult *> *)modifyVpcEndpointServiceConfiguration:(AWSEC2ModifyVpcEndpointServiceConfigurationRequest *)request;

/**
 <p>Modifies the attributes of your VPC endpoint service configuration. You can change the Network Load Balancers for your service, and you can specify whether acceptance is required for requests to connect to your endpoint service through an interface VPC endpoint.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpointServiceConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcEndpointServiceConfigurationRequest
 @see AWSEC2ModifyVpcEndpointServiceConfigurationResult
 */
- (void)modifyVpcEndpointServiceConfiguration:(AWSEC2ModifyVpcEndpointServiceConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpcEndpointServiceConfigurationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the permissions for your <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/endpoint-service.html">VPC endpoint service</a>. You can add or remove permissions for service consumers (IAM users, IAM roles, and AWS accounts) to connect to your endpoint service.</p><p>If you grant permissions to all principals, the service is public. Any users who know the name of a public service can send a request to attach an endpoint. If the service does not require manual approval, attachments are automatically approved.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpointServicePermissions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcEndpointServicePermissionsResult`.
 
 @see AWSEC2ModifyVpcEndpointServicePermissionsRequest
 @see AWSEC2ModifyVpcEndpointServicePermissionsResult
 */
- (AWSTask<AWSEC2ModifyVpcEndpointServicePermissionsResult *> *)modifyVpcEndpointServicePermissions:(AWSEC2ModifyVpcEndpointServicePermissionsRequest *)request;

/**
 <p>Modifies the permissions for your <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/endpoint-service.html">VPC endpoint service</a>. You can add or remove permissions for service consumers (IAM users, IAM roles, and AWS accounts) to connect to your endpoint service.</p><p>If you grant permissions to all principals, the service is public. Any users who know the name of a public service can send a request to attach an endpoint. If the service does not require manual approval, attachments are automatically approved.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcEndpointServicePermissions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcEndpointServicePermissionsRequest
 @see AWSEC2ModifyVpcEndpointServicePermissionsResult
 */
- (void)modifyVpcEndpointServicePermissions:(AWSEC2ModifyVpcEndpointServicePermissionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpcEndpointServicePermissionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the VPC peering connection options on one side of a VPC peering connection. You can do the following:</p><ul><li><p>Enable/disable communication over the peering connection between an EC2-Classic instance that's linked to your VPC (using ClassicLink) and instances in the peer VPC.</p></li><li><p>Enable/disable communication over the peering connection between instances in your VPC and an EC2-Classic instance that's linked to the peer VPC.</p></li><li><p>Enable/disable the ability to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC.</p></li></ul><p>If the peered VPCs are in different accounts, each owner must initiate a separate request to modify the peering connection options, depending on whether their VPC was the requester or accepter for the VPC peering connection. If the peered VPCs are in the same account, you can modify the requester and accepter options in the same request. To confirm which VPC is the accepter and requester for a VPC peering connection, use the <a>DescribeVpcPeeringConnections</a> command.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcPeeringConnectionOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcPeeringConnectionOptionsResult`.
 
 @see AWSEC2ModifyVpcPeeringConnectionOptionsRequest
 @see AWSEC2ModifyVpcPeeringConnectionOptionsResult
 */
- (AWSTask<AWSEC2ModifyVpcPeeringConnectionOptionsResult *> *)modifyVpcPeeringConnectionOptions:(AWSEC2ModifyVpcPeeringConnectionOptionsRequest *)request;

/**
 <p>Modifies the VPC peering connection options on one side of a VPC peering connection. You can do the following:</p><ul><li><p>Enable/disable communication over the peering connection between an EC2-Classic instance that's linked to your VPC (using ClassicLink) and instances in the peer VPC.</p></li><li><p>Enable/disable communication over the peering connection between instances in your VPC and an EC2-Classic instance that's linked to the peer VPC.</p></li><li><p>Enable/disable the ability to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC.</p></li></ul><p>If the peered VPCs are in different accounts, each owner must initiate a separate request to modify the peering connection options, depending on whether their VPC was the requester or accepter for the VPC peering connection. If the peered VPCs are in the same account, you can modify the requester and accepter options in the same request. To confirm which VPC is the accepter and requester for a VPC peering connection, use the <a>DescribeVpcPeeringConnections</a> command.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcPeeringConnectionOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcPeeringConnectionOptionsRequest
 @see AWSEC2ModifyVpcPeeringConnectionOptionsResult
 */
- (void)modifyVpcPeeringConnectionOptions:(AWSEC2ModifyVpcPeeringConnectionOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpcPeeringConnectionOptionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the instance tenancy attribute of the specified VPC. You can change the instance tenancy attribute of a VPC to <code>default</code> only. You cannot change the instance tenancy attribute to <code>dedicated</code>.</p><p>After you modify the tenancy of the VPC, any new instances that you launch into the VPC have a tenancy of <code>default</code>, unless you specify otherwise during launch. The tenancy of any existing instances in the VPC is not affected.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html">Dedicated Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcTenancy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyVpcTenancyResult`.
 
 @see AWSEC2ModifyVpcTenancyRequest
 @see AWSEC2ModifyVpcTenancyResult
 */
- (AWSTask<AWSEC2ModifyVpcTenancyResult *> *)modifyVpcTenancy:(AWSEC2ModifyVpcTenancyRequest *)request;

/**
 <p>Modifies the instance tenancy attribute of the specified VPC. You can change the instance tenancy attribute of a VPC to <code>default</code> only. You cannot change the instance tenancy attribute to <code>dedicated</code>.</p><p>After you modify the tenancy of the VPC, any new instances that you launch into the VPC have a tenancy of <code>default</code>, unless you specify otherwise during launch. The tenancy of any existing instances in the VPC is not affected.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html">Dedicated Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcTenancy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ModifyVpcTenancyRequest
 @see AWSEC2ModifyVpcTenancyResult
 */
- (void)modifyVpcTenancy:(AWSEC2ModifyVpcTenancyRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ModifyVpcTenancyResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Enables detailed monitoring for a running instance. Otherwise, basic monitoring is enabled. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>To disable detailed monitoring, see .</p>
 
 @param request A container for the necessary parameters to execute the MonitorInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2MonitorInstancesResult`.
 
 @see AWSEC2MonitorInstancesRequest
 @see AWSEC2MonitorInstancesResult
 */
- (AWSTask<AWSEC2MonitorInstancesResult *> *)monitorInstances:(AWSEC2MonitorInstancesRequest *)request;

/**
 <p>Enables detailed monitoring for a running instance. Otherwise, basic monitoring is enabled. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>To disable detailed monitoring, see .</p>
 
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
 <p>Provisions an address range for use with your AWS resources through bring your own IP addresses (BYOIP) and creates a corresponding address pool. After the address range is provisioned, it is ready to be advertised using <a>AdvertiseByoipCidr</a>.</p><p>AWS verifies that you own the address range and are authorized to advertise it. You must ensure that the address range is registered to you and that you created an RPKI ROA to authorize Amazon ASNs 16509 and 14618 to advertise the address range. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">Bring Your Own IP Addresses (BYOIP)</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Provisioning an address range is an asynchronous operation, so the call returns immediately, but the address range is not ready to use until its status changes from <code>pending-provision</code> to <code>provisioned</code>. To monitor the status of an address range, use <a>DescribeByoipCidrs</a>. To allocate an Elastic IP address from your address pool, use <a>AllocateAddress</a> with either the specific address from the address pool or the ID of the address pool.</p>
 
 @param request A container for the necessary parameters to execute the ProvisionByoipCidr service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ProvisionByoipCidrResult`.
 
 @see AWSEC2ProvisionByoipCidrRequest
 @see AWSEC2ProvisionByoipCidrResult
 */
- (AWSTask<AWSEC2ProvisionByoipCidrResult *> *)provisionByoipCidr:(AWSEC2ProvisionByoipCidrRequest *)request;

/**
 <p>Provisions an address range for use with your AWS resources through bring your own IP addresses (BYOIP) and creates a corresponding address pool. After the address range is provisioned, it is ready to be advertised using <a>AdvertiseByoipCidr</a>.</p><p>AWS verifies that you own the address range and are authorized to advertise it. You must ensure that the address range is registered to you and that you created an RPKI ROA to authorize Amazon ASNs 16509 and 14618 to advertise the address range. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html">Bring Your Own IP Addresses (BYOIP)</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Provisioning an address range is an asynchronous operation, so the call returns immediately, but the address range is not ready to use until its status changes from <code>pending-provision</code> to <code>provisioned</code>. To monitor the status of an address range, use <a>DescribeByoipCidrs</a>. To allocate an Elastic IP address from your address pool, use <a>AllocateAddress</a> with either the specific address from the address pool or the ID of the address pool.</p>
 
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
 <p>Purchases a Reserved Instance for use with your account. With Reserved Instances, you pay a lower hourly rate compared to On-Demand instance pricing.</p><p>Use <a>DescribeReservedInstancesOfferings</a> to get a list of Reserved Instance offerings that match your specifications. After you've purchased a Reserved Instance, you can check for your new Reserved Instance with <a>DescribeReservedInstances</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html">Reserved Instances</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedInstancesOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2PurchaseReservedInstancesOfferingResult`.
 
 @see AWSEC2PurchaseReservedInstancesOfferingRequest
 @see AWSEC2PurchaseReservedInstancesOfferingResult
 */
- (AWSTask<AWSEC2PurchaseReservedInstancesOfferingResult *> *)purchaseReservedInstancesOffering:(AWSEC2PurchaseReservedInstancesOfferingRequest *)request;

/**
 <p>Purchases a Reserved Instance for use with your account. With Reserved Instances, you pay a lower hourly rate compared to On-Demand instance pricing.</p><p>Use <a>DescribeReservedInstancesOfferings</a> to get a list of Reserved Instance offerings that match your specifications. After you've purchased a Reserved Instance, you can check for your new Reserved Instance with <a>DescribeReservedInstances</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html">Reserved Instances</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedInstancesOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2PurchaseReservedInstancesOfferingRequest
 @see AWSEC2PurchaseReservedInstancesOfferingResult
 */
- (void)purchaseReservedInstancesOffering:(AWSEC2PurchaseReservedInstancesOfferingRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2PurchaseReservedInstancesOfferingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Purchases one or more Scheduled Instances with the specified schedule.</p><p>Scheduled Instances enable you to purchase Amazon EC2 compute capacity by the hour for a one-year term. Before you can purchase a Scheduled Instance, you must call <a>DescribeScheduledInstanceAvailability</a> to check for available schedules and obtain a purchase token. After you purchase a Scheduled Instance, you must call <a>RunScheduledInstances</a> during each scheduled time period.</p><p>After you purchase a Scheduled Instance, you can't cancel, modify, or resell your purchase.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseScheduledInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2PurchaseScheduledInstancesResult`.
 
 @see AWSEC2PurchaseScheduledInstancesRequest
 @see AWSEC2PurchaseScheduledInstancesResult
 */
- (AWSTask<AWSEC2PurchaseScheduledInstancesResult *> *)purchaseScheduledInstances:(AWSEC2PurchaseScheduledInstancesRequest *)request;

/**
 <p>Purchases one or more Scheduled Instances with the specified schedule.</p><p>Scheduled Instances enable you to purchase Amazon EC2 compute capacity by the hour for a one-year term. Before you can purchase a Scheduled Instance, you must call <a>DescribeScheduledInstanceAvailability</a> to check for available schedules and obtain a purchase token. After you purchase a Scheduled Instance, you must call <a>RunScheduledInstances</a> during each scheduled time period.</p><p>After you purchase a Scheduled Instance, you can't cancel, modify, or resell your purchase.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseScheduledInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2PurchaseScheduledInstancesRequest
 @see AWSEC2PurchaseScheduledInstancesResult
 */
- (void)purchaseScheduledInstances:(AWSEC2PurchaseScheduledInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2PurchaseScheduledInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Requests a reboot of one or more instances. This operation is asynchronous; it only queues a request to reboot the specified instances. The operation succeeds if the instances are valid and belong to you. Requests to reboot terminated instances are ignored.</p><p>If an instance does not cleanly shut down within four minutes, Amazon EC2 performs a hard reboot.</p><p>For more information about troubleshooting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html">Getting Console Output and Rebooting Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RebootInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2RebootInstancesRequest
 */
- (AWSTask *)rebootInstances:(AWSEC2RebootInstancesRequest *)request;

/**
 <p>Requests a reboot of one or more instances. This operation is asynchronous; it only queues a request to reboot the specified instances. The operation succeeds if the instances are valid and belong to you. Requests to reboot terminated instances are ignored.</p><p>If an instance does not cleanly shut down within four minutes, Amazon EC2 performs a hard reboot.</p><p>For more information about troubleshooting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html">Getting Console Output and Rebooting Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RebootInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RebootInstancesRequest
 */
- (void)rebootInstances:(AWSEC2RebootInstancesRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Registers an AMI. When you're creating an AMI, this is the final step you must complete before you can launch an instance from the AMI. For more information about creating AMIs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami.html">Creating Your Own AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><note><p>For Amazon EBS-backed instances, <a>CreateImage</a> creates and registers the AMI in a single request, so you don't have to register the AMI yourself.</p></note><p>You can also use <code>RegisterImage</code> to create an Amazon EBS-backed Linux AMI from a snapshot of a root device volume. You specify the snapshot using the block device mapping. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-launch-snapshot.html">Launching a Linux Instance from a Backup</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You can't register an image where a secondary (non-root) snapshot has AWS Marketplace product codes.</p><p>Some Linux distributions, such as Red Hat Enterprise Linux (RHEL) and SUSE Linux Enterprise Server (SLES), use the EC2 billing product code associated with an AMI to verify the subscription status for package updates. Creating an AMI from an EBS snapshot does not maintain this billing code, and instances launched from such an AMI are not able to connect to package update infrastructure. If you purchase a Reserved Instance offering for one of these Linux distributions and launch instances using an AMI that does not contain the required billing code, your Reserved Instance is not applied to these instances.</p><p>To create an AMI for operating systems that require a billing code, see <a>CreateImage</a>.</p><p>If needed, you can deregister an AMI at any time. Any modifications you make to an AMI backed by an instance store volume invalidates its registration. If you make changes to an image, deregister the previous image and register the new image.</p>
 
 @param request A container for the necessary parameters to execute the RegisterImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RegisterImageResult`.
 
 @see AWSEC2RegisterImageRequest
 @see AWSEC2RegisterImageResult
 */
- (AWSTask<AWSEC2RegisterImageResult *> *)registerImage:(AWSEC2RegisterImageRequest *)request;

/**
 <p>Registers an AMI. When you're creating an AMI, this is the final step you must complete before you can launch an instance from the AMI. For more information about creating AMIs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami.html">Creating Your Own AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><note><p>For Amazon EBS-backed instances, <a>CreateImage</a> creates and registers the AMI in a single request, so you don't have to register the AMI yourself.</p></note><p>You can also use <code>RegisterImage</code> to create an Amazon EBS-backed Linux AMI from a snapshot of a root device volume. You specify the snapshot using the block device mapping. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-launch-snapshot.html">Launching a Linux Instance from a Backup</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>You can't register an image where a secondary (non-root) snapshot has AWS Marketplace product codes.</p><p>Some Linux distributions, such as Red Hat Enterprise Linux (RHEL) and SUSE Linux Enterprise Server (SLES), use the EC2 billing product code associated with an AMI to verify the subscription status for package updates. Creating an AMI from an EBS snapshot does not maintain this billing code, and instances launched from such an AMI are not able to connect to package update infrastructure. If you purchase a Reserved Instance offering for one of these Linux distributions and launch instances using an AMI that does not contain the required billing code, your Reserved Instance is not applied to these instances.</p><p>To create an AMI for operating systems that require a billing code, see <a>CreateImage</a>.</p><p>If needed, you can deregister an AMI at any time. Any modifications you make to an AMI backed by an instance store volume invalidates its registration. If you make changes to an image, deregister the previous image and register the new image.</p>
 
 @param request A container for the necessary parameters to execute the RegisterImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RegisterImageRequest
 @see AWSEC2RegisterImageResult
 */
- (void)registerImage:(AWSEC2RegisterImageRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RegisterImageResult * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Changes which network ACL a subnet is associated with. By default when you create a subnet, it's automatically associated with the default network ACL. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>This is an idempotent operation.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceNetworkAclAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplaceNetworkAclAssociationResult`.
 
 @see AWSEC2ReplaceNetworkAclAssociationRequest
 @see AWSEC2ReplaceNetworkAclAssociationResult
 */
- (AWSTask<AWSEC2ReplaceNetworkAclAssociationResult *> *)replaceNetworkAclAssociation:(AWSEC2ReplaceNetworkAclAssociationRequest *)request;

/**
 <p>Changes which network ACL a subnet is associated with. By default when you create a subnet, it's automatically associated with the default network ACL. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>This is an idempotent operation.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceNetworkAclAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplaceNetworkAclAssociationRequest
 @see AWSEC2ReplaceNetworkAclAssociationResult
 */
- (void)replaceNetworkAclAssociation:(AWSEC2ReplaceNetworkAclAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplaceNetworkAclAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Replaces an entry (rule) in a network ACL. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceNetworkAclEntry service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ReplaceNetworkAclEntryRequest
 */
- (AWSTask *)replaceNetworkAclEntry:(AWSEC2ReplaceNetworkAclEntryRequest *)request;

/**
 <p>Replaces an entry (rule) in a network ACL. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceNetworkAclEntry service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplaceNetworkAclEntryRequest
 */
- (void)replaceNetworkAclEntry:(AWSEC2ReplaceNetworkAclEntryRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Replaces an existing route within a route table in a VPC. You must provide only one of the following: internet gateway or virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, or egress-only internet gateway.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceRoute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ReplaceRouteRequest
 */
- (AWSTask *)replaceRoute:(AWSEC2ReplaceRouteRequest *)request;

/**
 <p>Replaces an existing route within a route table in a VPC. You must provide only one of the following: internet gateway or virtual private gateway, NAT instance, NAT gateway, VPC peering connection, network interface, or egress-only internet gateway.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceRoute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplaceRouteRequest
 */
- (void)replaceRoute:(AWSEC2ReplaceRouteRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Changes the route table associated with a given subnet in a VPC. After the operation completes, the subnet uses the routes in the new route table it's associated with. For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can also use ReplaceRouteTableAssociation to change which table is the main route table in the VPC. You just specify the main route table's association ID and the route table to be the new main route table.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceRouteTableAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplaceRouteTableAssociationResult`.
 
 @see AWSEC2ReplaceRouteTableAssociationRequest
 @see AWSEC2ReplaceRouteTableAssociationResult
 */
- (AWSTask<AWSEC2ReplaceRouteTableAssociationResult *> *)replaceRouteTableAssociation:(AWSEC2ReplaceRouteTableAssociationRequest *)request;

/**
 <p>Changes the route table associated with a given subnet in a VPC. After the operation completes, the subnet uses the routes in the new route table it's associated with. For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can also use ReplaceRouteTableAssociation to change which table is the main route table in the VPC. You just specify the main route table's association ID and the route table to be the new main route table.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceRouteTableAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2ReplaceRouteTableAssociationRequest
 @see AWSEC2ReplaceRouteTableAssociationResult
 */
- (void)replaceRouteTableAssociation:(AWSEC2ReplaceRouteTableAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2ReplaceRouteTableAssociationResult * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Creates a Spot Fleet request.</p><p>The Spot Fleet request specifies the total target capacity and the On-Demand target capacity. Amazon EC2 calculates the difference between the total capacity and On-Demand capacity, and launches the difference as Spot capacity.</p><p>You can submit a single request that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet.</p><p>By default, the Spot Fleet requests Spot Instances in the Spot pool where the price per unit is the lowest. Each launch specification can include its own instance weighting that reflects the value of the instance type to your application workload.</p><p>Alternatively, you can specify that the Spot Fleet distribute the target capacity across the Spot pools included in its launch specifications. By ensuring that the Spot Instances in your Spot Fleet are in different Spot pools, you can improve the availability of your fleet.</p><p>You can specify tags for the Spot Instances. You cannot tag other resource types in a Spot Fleet request because only the <code>instance</code> resource type is supported.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-requests.html">Spot Fleet Requests</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the RequestSpotFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RequestSpotFleetResponse`.
 
 @see AWSEC2RequestSpotFleetRequest
 @see AWSEC2RequestSpotFleetResponse
 */
- (AWSTask<AWSEC2RequestSpotFleetResponse *> *)requestSpotFleet:(AWSEC2RequestSpotFleetRequest *)request;

/**
 <p>Creates a Spot Fleet request.</p><p>The Spot Fleet request specifies the total target capacity and the On-Demand target capacity. Amazon EC2 calculates the difference between the total capacity and On-Demand capacity, and launches the difference as Spot capacity.</p><p>You can submit a single request that includes multiple launch specifications that vary by instance type, AMI, Availability Zone, or subnet.</p><p>By default, the Spot Fleet requests Spot Instances in the Spot pool where the price per unit is the lowest. Each launch specification can include its own instance weighting that reflects the value of the instance type to your application workload.</p><p>Alternatively, you can specify that the Spot Fleet distribute the target capacity across the Spot pools included in its launch specifications. By ensuring that the Spot Instances in your Spot Fleet are in different Spot pools, you can improve the availability of your fleet.</p><p>You can specify tags for the Spot Instances. You cannot tag other resource types in a Spot Fleet request because only the <code>instance</code> resource type is supported.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-requests.html">Spot Fleet Requests</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the RequestSpotFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RequestSpotFleetRequest
 @see AWSEC2RequestSpotFleetResponse
 */
- (void)requestSpotFleet:(AWSEC2RequestSpotFleetRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RequestSpotFleetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Spot Instance request.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html">Spot Instance Requests</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the RequestSpotInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RequestSpotInstancesResult`.
 
 @see AWSEC2RequestSpotInstancesRequest
 @see AWSEC2RequestSpotInstancesResult
 */
- (AWSTask<AWSEC2RequestSpotInstancesResult *> *)requestSpotInstances:(AWSEC2RequestSpotInstancesRequest *)request;

/**
 <p>Creates a Spot Instance request.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html">Spot Instance Requests</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 
 @param request A container for the necessary parameters to execute the RequestSpotInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RequestSpotInstancesRequest
 @see AWSEC2RequestSpotInstancesResult
 */
- (void)requestSpotInstances:(AWSEC2RequestSpotInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RequestSpotInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

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
 <p>Resets an attribute of an instance to its default value. To reset the <code>kernel</code> or <code>ramdisk</code>, the instance must be in a stopped state. To reset the <code>sourceDestCheck</code>, the instance can be either running or stopped.</p><p>The <code>sourceDestCheck</code> attribute controls whether source/destination checking is enabled. The default value is <code>true</code>, which means checking is enabled. This value must be <code>false</code> for a NAT instance to perform NAT. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResetInstanceAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ResetInstanceAttributeRequest
 */
- (AWSTask *)resetInstanceAttribute:(AWSEC2ResetInstanceAttributeRequest *)request;

/**
 <p>Resets an attribute of an instance to its default value. To reset the <code>kernel</code> or <code>ramdisk</code>, the instance must be in a stopped state. To reset the <code>sourceDestCheck</code>, the instance can be either running or stopped.</p><p>The <code>sourceDestCheck</code> attribute controls whether source/destination checking is enabled. The default value is <code>true</code>, which means checking is enabled. This value must be <code>false</code> for a NAT instance to perform NAT. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
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
 <p>Resets permission settings for the specified snapshot.</p><p>For more information about modifying snapshot permissions, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResetSnapshotAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ResetSnapshotAttributeRequest
 */
- (AWSTask *)resetSnapshotAttribute:(AWSEC2ResetSnapshotAttributeRequest *)request;

/**
 <p>Resets permission settings for the specified snapshot.</p><p>For more information about modifying snapshot permissions, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>[EC2-VPC only] Removes one or more egress rules from a security group for EC2-VPC. This action doesn't apply to security groups for use in EC2-Classic. To remove a rule, the values that you specify (for example, ports) must match the existing rule's values exactly.</p><p>Each rule consists of the protocol and the IPv4 or IPv6 CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code. If the security group rule has a description, you do not have to specify the description to revoke the rule.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSecurityGroupEgress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2RevokeSecurityGroupEgressRequest
 */
- (AWSTask *)revokeSecurityGroupEgress:(AWSEC2RevokeSecurityGroupEgressRequest *)request;

/**
 <p>[EC2-VPC only] Removes one or more egress rules from a security group for EC2-VPC. This action doesn't apply to security groups for use in EC2-Classic. To remove a rule, the values that you specify (for example, ports) must match the existing rule's values exactly.</p><p>Each rule consists of the protocol and the IPv4 or IPv6 CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code. If the security group rule has a description, you do not have to specify the description to revoke the rule.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSecurityGroupEgress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RevokeSecurityGroupEgressRequest
 */
- (void)revokeSecurityGroupEgress:(AWSEC2RevokeSecurityGroupEgressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more ingress rules from a security group. To remove a rule, the values that you specify (for example, ports) must match the existing rule's values exactly.</p><note><p>[EC2-Classic security groups only] If the values you specify do not match the existing rule's values, no error is returned. Use <a>DescribeSecurityGroups</a> to verify that the rule has been removed.</p></note><p>Each rule consists of the protocol and the CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code. If the security group rule has a description, you do not have to specify the description to revoke the rule.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2RevokeSecurityGroupIngressRequest
 */
- (AWSTask *)revokeSecurityGroupIngress:(AWSEC2RevokeSecurityGroupIngressRequest *)request;

/**
 <p>Removes one or more ingress rules from a security group. To remove a rule, the values that you specify (for example, ports) must match the existing rule's values exactly.</p><note><p>[EC2-Classic security groups only] If the values you specify do not match the existing rule's values, no error is returned. Use <a>DescribeSecurityGroups</a> to verify that the rule has been removed.</p></note><p>Each rule consists of the protocol and the CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code. If the security group rule has a description, you do not have to specify the description to revoke the rule.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RevokeSecurityGroupIngressRequest
 */
- (void)revokeSecurityGroupIngress:(AWSEC2RevokeSecurityGroupIngressRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Launches the specified number of instances using an AMI for which you have permissions. </p><p>You can specify a number of options, or leave the default options. The following rules apply:</p><ul><li><p>[EC2-VPC] If you don't specify a subnet ID, we choose a default subnet from your default VPC for you. If you don't have a default VPC, you must specify a subnet ID in the request.</p></li><li><p>[EC2-Classic] If don't specify an Availability Zone, we choose one for you.</p></li><li><p>Some instance types must be launched into a VPC. If you do not have a default VPC, or if you do not specify a subnet ID, the request fails. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-vpc.html#vpc-only-instance-types">Instance Types Available Only in a VPC</a>.</p></li><li><p>[EC2-VPC] All instances have a network interface with a primary private IPv4 address. If you don't specify this address, we choose one from the IPv4 range of your subnet.</p></li><li><p>Not all instance types support IPv6 addresses. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a>.</p></li><li><p>If you don't specify a security group ID, we use the default security group. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Security Groups</a>.</p></li><li><p>If any of the AMIs have a product code attached for which the user has not subscribed, the request fails.</p></li></ul><p>You can create a <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html">launch template</a>, which is a resource that contains the parameters to launch an instance. When you launch an instance using <a>RunInstances</a>, you can specify the launch template instead of specifying the launch parameters.</p><p>To ensure faster instance launches, break up large requests into smaller batches. For example, create five separate launch requests for 100 instances each instead of one launch request for 500 instances.</p><p>An instance is ready for you to use when it's in the <code>running</code> state. You can check the state of your instance using <a>DescribeInstances</a>. You can tag instances and EBS volumes during launch, after launch, or both. For more information, see <a>CreateTags</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a>.</p><p>Linux instances have access to the public key of the key pair at boot. You can use this key to provide secure access to the instance. Amazon EC2 public images use this feature to provide secure access without passwords. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For troubleshooting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_InstanceStraightToTerminated.html">What To Do If An Instance Immediately Terminates</a>, and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html">Troubleshooting Connecting to Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RunInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2Reservation`.
 
 @see AWSEC2RunInstancesRequest
 @see AWSEC2Reservation
 */
- (AWSTask<AWSEC2Reservation *> *)runInstances:(AWSEC2RunInstancesRequest *)request;

/**
 <p>Launches the specified number of instances using an AMI for which you have permissions. </p><p>You can specify a number of options, or leave the default options. The following rules apply:</p><ul><li><p>[EC2-VPC] If you don't specify a subnet ID, we choose a default subnet from your default VPC for you. If you don't have a default VPC, you must specify a subnet ID in the request.</p></li><li><p>[EC2-Classic] If don't specify an Availability Zone, we choose one for you.</p></li><li><p>Some instance types must be launched into a VPC. If you do not have a default VPC, or if you do not specify a subnet ID, the request fails. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-vpc.html#vpc-only-instance-types">Instance Types Available Only in a VPC</a>.</p></li><li><p>[EC2-VPC] All instances have a network interface with a primary private IPv4 address. If you don't specify this address, we choose one from the IPv4 range of your subnet.</p></li><li><p>Not all instance types support IPv6 addresses. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a>.</p></li><li><p>If you don't specify a security group ID, we use the default security group. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Security Groups</a>.</p></li><li><p>If any of the AMIs have a product code attached for which the user has not subscribed, the request fails.</p></li></ul><p>You can create a <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html">launch template</a>, which is a resource that contains the parameters to launch an instance. When you launch an instance using <a>RunInstances</a>, you can specify the launch template instead of specifying the launch parameters.</p><p>To ensure faster instance launches, break up large requests into smaller batches. For example, create five separate launch requests for 100 instances each instead of one launch request for 500 instances.</p><p>An instance is ready for you to use when it's in the <code>running</code> state. You can check the state of your instance using <a>DescribeInstances</a>. You can tag instances and EBS volumes during launch, after launch, or both. For more information, see <a>CreateTags</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a>.</p><p>Linux instances have access to the public key of the key pair at boot. You can use this key to provide secure access to the instance. Amazon EC2 public images use this feature to provide secure access without passwords. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For troubleshooting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_InstanceStraightToTerminated.html">What To Do If An Instance Immediately Terminates</a>, and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html">Troubleshooting Connecting to Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RunInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RunInstancesRequest
 @see AWSEC2Reservation
 */
- (void)runInstances:(AWSEC2RunInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2Reservation * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Launches the specified Scheduled Instances.</p><p>Before you can launch a Scheduled Instance, you must purchase it and obtain an identifier using <a>PurchaseScheduledInstances</a>.</p><p>You must launch a Scheduled Instance during its scheduled time period. You can't stop or reboot a Scheduled Instance, but you can terminate it as needed. If you terminate a Scheduled Instance before the current scheduled time period ends, you can launch it again after a few minutes. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-scheduled-instances.html">Scheduled Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RunScheduledInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RunScheduledInstancesResult`.
 
 @see AWSEC2RunScheduledInstancesRequest
 @see AWSEC2RunScheduledInstancesResult
 */
- (AWSTask<AWSEC2RunScheduledInstancesResult *> *)runScheduledInstances:(AWSEC2RunScheduledInstancesRequest *)request;

/**
 <p>Launches the specified Scheduled Instances.</p><p>Before you can launch a Scheduled Instance, you must purchase it and obtain an identifier using <a>PurchaseScheduledInstances</a>.</p><p>You must launch a Scheduled Instance during its scheduled time period. You can't stop or reboot a Scheduled Instance, but you can terminate it as needed. If you terminate a Scheduled Instance before the current scheduled time period ends, you can launch it again after a few minutes. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-scheduled-instances.html">Scheduled Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RunScheduledInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2RunScheduledInstancesRequest
 @see AWSEC2RunScheduledInstancesResult
 */
- (void)runScheduledInstances:(AWSEC2RunScheduledInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2RunScheduledInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an Amazon EBS-backed instance that you've previously stopped.</p><p>Instances that use Amazon EBS volumes as their root devices can be quickly stopped and started. When an instance is stopped, the compute resources are released and you are not billed for instance usage. However, your root partition Amazon EBS volume remains and continues to persist your data, and you are charged for Amazon EBS volume usage. You can restart your instance at any time. Every time you start your Windows instance, Amazon EC2 charges you for a full instance hour. If you stop and restart your Windows instance, a new instance hour begins and Amazon EC2 charges you for another full instance hour even if you are still within the same 60-minute period when it was stopped. Every time you start your Linux instance, Amazon EC2 charges a one-minute minimum for instance usage, and thereafter charges per second for instance usage.</p><p>Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM.</p><p>Performing this operation on an instance that uses an instance store as its root device returns an error.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Stop_Start.html">Stopping Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2StartInstancesResult`.
 
 @see AWSEC2StartInstancesRequest
 @see AWSEC2StartInstancesResult
 */
- (AWSTask<AWSEC2StartInstancesResult *> *)startInstances:(AWSEC2StartInstancesRequest *)request;

/**
 <p>Starts an Amazon EBS-backed instance that you've previously stopped.</p><p>Instances that use Amazon EBS volumes as their root devices can be quickly stopped and started. When an instance is stopped, the compute resources are released and you are not billed for instance usage. However, your root partition Amazon EBS volume remains and continues to persist your data, and you are charged for Amazon EBS volume usage. You can restart your instance at any time. Every time you start your Windows instance, Amazon EC2 charges you for a full instance hour. If you stop and restart your Windows instance, a new instance hour begins and Amazon EC2 charges you for another full instance hour even if you are still within the same 60-minute period when it was stopped. Every time you start your Linux instance, Amazon EC2 charges a one-minute minimum for instance usage, and thereafter charges per second for instance usage.</p><p>Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM.</p><p>Performing this operation on an instance that uses an instance store as its root device returns an error.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Stop_Start.html">Stopping Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2StartInstancesRequest
 @see AWSEC2StartInstancesResult
 */
- (void)startInstances:(AWSEC2StartInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2StartInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops an Amazon EBS-backed instance.</p><p>We don't charge usage for a stopped instance, or data transfer fees; however, your root partition Amazon EBS volume remains and continues to persist your data, and you are charged for Amazon EBS volume usage. Every time you start your Windows instance, Amazon EC2 charges you for a full instance hour. If you stop and restart your Windows instance, a new instance hour begins and Amazon EC2 charges you for another full instance hour even if you are still within the same 60-minute period when it was stopped. Every time you start your Linux instance, Amazon EC2 charges a one-minute minimum for instance usage, and thereafter charges per second for instance usage.</p><p>You can't start or stop Spot Instances, and you can't stop instance store-backed instances.</p><p>When you stop an instance, we shut it down. You can restart your instance at any time. Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM.</p><p>Stopping an instance is different to rebooting or terminating it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, the root device and any other devices attached during the instance launch are automatically deleted. For more information about the differences between rebooting, stopping, and terminating instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>When you stop an instance, we attempt to shut it down forcibly after a short while. If your instance appears stuck in the stopping state after a period of time, there may be an issue with the underlying host computer. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesStopping.html">Troubleshooting Stopping Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2StopInstancesResult`.
 
 @see AWSEC2StopInstancesRequest
 @see AWSEC2StopInstancesResult
 */
- (AWSTask<AWSEC2StopInstancesResult *> *)stopInstances:(AWSEC2StopInstancesRequest *)request;

/**
 <p>Stops an Amazon EBS-backed instance.</p><p>We don't charge usage for a stopped instance, or data transfer fees; however, your root partition Amazon EBS volume remains and continues to persist your data, and you are charged for Amazon EBS volume usage. Every time you start your Windows instance, Amazon EC2 charges you for a full instance hour. If you stop and restart your Windows instance, a new instance hour begins and Amazon EC2 charges you for another full instance hour even if you are still within the same 60-minute period when it was stopped. Every time you start your Linux instance, Amazon EC2 charges a one-minute minimum for instance usage, and thereafter charges per second for instance usage.</p><p>You can't start or stop Spot Instances, and you can't stop instance store-backed instances.</p><p>When you stop an instance, we shut it down. You can restart your instance at any time. Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM.</p><p>Stopping an instance is different to rebooting or terminating it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, the root device and any other devices attached during the instance launch are automatically deleted. For more information about the differences between rebooting, stopping, and terminating instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>When you stop an instance, we attempt to shut it down forcibly after a short while. If your instance appears stuck in the stopping state after a period of time, there may be an issue with the underlying host computer. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesStopping.html">Troubleshooting Stopping Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2StopInstancesRequest
 @see AWSEC2StopInstancesResult
 */
- (void)stopInstances:(AWSEC2StopInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2StopInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Shuts down one or more instances. This operation is idempotent; if you terminate an instance more than once, each call succeeds. </p><p>If you specify multiple instances and the request fails (for example, because of a single incorrect instance ID), none of the instances are terminated.</p><p>Terminated instances remain visible after termination (for approximately one hour).</p><p>By default, Amazon EC2 deletes all EBS volumes that were attached when the instance launched. Volumes attached after instance launch continue running.</p><p>You can stop, start, and terminate EBS-backed instances. You can only terminate instance store-backed instances. What happens to an instance differs if you stop it or terminate it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, any attached EBS volumes with the <code>DeleteOnTermination</code> block device mapping parameter set to <code>true</code> are automatically deleted. For more information about the differences between stopping and terminating instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information about troubleshooting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesShuttingDown.html">Troubleshooting Terminating Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TerminateInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2TerminateInstancesResult`.
 
 @see AWSEC2TerminateInstancesRequest
 @see AWSEC2TerminateInstancesResult
 */
- (AWSTask<AWSEC2TerminateInstancesResult *> *)terminateInstances:(AWSEC2TerminateInstancesRequest *)request;

/**
 <p>Shuts down one or more instances. This operation is idempotent; if you terminate an instance more than once, each call succeeds. </p><p>If you specify multiple instances and the request fails (for example, because of a single incorrect instance ID), none of the instances are terminated.</p><p>Terminated instances remain visible after termination (for approximately one hour).</p><p>By default, Amazon EC2 deletes all EBS volumes that were attached when the instance launched. Volumes attached after instance launch continue running.</p><p>You can stop, start, and terminate EBS-backed instances. You can only terminate instance store-backed instances. What happens to an instance differs if you stop it or terminate it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, any attached EBS volumes with the <code>DeleteOnTermination</code> block device mapping parameter set to <code>true</code> are automatically deleted. For more information about the differences between stopping and terminating instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>For more information about troubleshooting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesShuttingDown.html">Troubleshooting Terminating Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
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
 <p>Disables detailed monitoring for a running instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UnmonitorInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2UnmonitorInstancesResult`.
 
 @see AWSEC2UnmonitorInstancesRequest
 @see AWSEC2UnmonitorInstancesResult
 */
- (AWSTask<AWSEC2UnmonitorInstancesResult *> *)unmonitorInstances:(AWSEC2UnmonitorInstancesRequest *)request;

/**
 <p>Disables detailed monitoring for a running instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the UnmonitorInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEC2UnmonitorInstancesRequest
 @see AWSEC2UnmonitorInstancesResult
 */
- (void)unmonitorInstances:(AWSEC2UnmonitorInstancesRequest *)request completionHandler:(void (^ _Nullable)(AWSEC2UnmonitorInstancesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>[EC2-VPC only] Updates the description of an egress (outbound) security group rule. You can replace an existing description, or add a description to a rule that did not have one previously.</p><p>You specify the description as part of the IP permissions structure. You can remove a description for a security group rule by omitting the description parameter in the request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSecurityGroupRuleDescriptionsEgress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult`.
 
 @see AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest
 @see AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult
 */
- (AWSTask<AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult *> *)updateSecurityGroupRuleDescriptionsEgress:(AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest *)request;

/**
 <p>[EC2-VPC only] Updates the description of an egress (outbound) security group rule. You can replace an existing description, or add a description to a rule that did not have one previously.</p><p>You specify the description as part of the IP permissions structure. You can remove a description for a security group rule by omitting the description parameter in the request.</p>
 
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
 <p>Stops advertising an IPv4 address range that is provisioned as an address pool.</p><p>You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time.</p><p>It can take a few minutes before traffic to the specified addresses stops routing to AWS because of BGP propagation delays.</p>
 
 @param request A container for the necessary parameters to execute the WithdrawByoipCidr service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2WithdrawByoipCidrResult`.
 
 @see AWSEC2WithdrawByoipCidrRequest
 @see AWSEC2WithdrawByoipCidrResult
 */
- (AWSTask<AWSEC2WithdrawByoipCidrResult *> *)withdrawByoipCidr:(AWSEC2WithdrawByoipCidrRequest *)request;

/**
 <p>Stops advertising an IPv4 address range that is provisioned as an address pool.</p><p>You can perform this operation at most once every 10 seconds, even if you specify different address ranges each time.</p><p>It can take a few minutes before traffic to the specified addresses stops routing to AWS because of BGP propagation delays.</p>
 
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
