/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSEC2Model.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>Amazon Elastic Compute Cloud</fullname><p>Amazon Elastic Compute Cloud (Amazon EC2) provides resizable computing capacity in the Amazon Web Services (AWS) cloud. Using Amazon EC2 eliminates your need to invest in hardware up front, so you can develop and deploy applications faster.</p>
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

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

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

     let EC2 = AWSEC2.defaultEC2()

 *Objective-C*

     AWSEC2 *EC2 = [AWSEC2 defaultEC2];

 @return The default service client.
 */
+ (instancetype)defaultEC2;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSEC2.registerEC2WithConfiguration(configuration, forKey: "USWest2EC2")

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
 Retrieves the service client associated with the key. You need to call `+ registerEC2WithConfiguration:forKey:` before invoking this method. If `+ registerEC2WithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSEC2.registerEC2WithConfiguration(configuration, forKey: "USWest2EC2")

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
 Instantiates the service client with the given service configuration.
 
 @warning This method has been deprecated. Use `+ registerEC2WithConfiguration:forKey:` and `+ EC2ForKey:` instead.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 
 @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.
 
 @param configuration The service configuration object.
 
 @return An instance of the service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration __attribute__ ((deprecated("Use '+ registerEC2WithConfiguration:forKey:' and '+ EC2ForKey:' instead.")));

/**
 <p>Accept a VPC peering connection request. To accept a request, the VPC peering connection must be in the <code>pending-acceptance</code> state, and you must be the owner of the peer VPC. Use the <code>DescribeVpcPeeringConnections</code> request to view your outstanding VPC peering connection requests.</p>
 
 @param request A container for the necessary parameters to execute the AcceptVpcPeeringConnection service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AcceptVpcPeeringConnectionResult`.
 
 @see AWSEC2AcceptVpcPeeringConnectionRequest
 @see AWSEC2AcceptVpcPeeringConnectionResult
 */
- (AWSTask *)acceptVpcPeeringConnection:(AWSEC2AcceptVpcPeeringConnectionRequest *)request;

/**
 <p>Acquires an Elastic IP address.</p><p>An Elastic IP address is for use either in the EC2-Classic platform or in a VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the AllocateAddress service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AllocateAddressResult`.
 
 @see AWSEC2AllocateAddressRequest
 @see AWSEC2AllocateAddressResult
 */
- (AWSTask *)allocateAddress:(AWSEC2AllocateAddressRequest *)request;

/**
 <p>Assigns one or more secondary private IP addresses to the specified network interface. You can specify one or more specific secondary IP addresses, or you can specify the number of secondary IP addresses to be automatically assigned within the subnet's CIDR block range. The number of secondary IP addresses that you can assign to an instance varies by instance type. For information about instance types, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>. For more information about Elastic IP addresses, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>AssignPrivateIpAddresses is available only in EC2-VPC.</p>
 
 @param request A container for the necessary parameters to execute the AssignPrivateIpAddresses service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AssignPrivateIpAddressesRequest
 */
- (AWSTask *)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request;

/**
 <p>Associates an Elastic IP address with an instance or a network interface.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>[EC2-Classic, VPC in an EC2-VPC-only account] If the Elastic IP address is already associated with a different instance, it is disassociated from that instance and associated with the specified instance.</p><p>[VPC in an EC2-Classic account] If you don't specify a private IP address, the Elastic IP address is associated with the primary IP address. If the Elastic IP address is already associated with a different instance or a network interface, you get an error unless you allow reassociation.</p><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p>
 
 @param request A container for the necessary parameters to execute the AssociateAddress service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateAddressResult`.
 
 @see AWSEC2AssociateAddressRequest
 @see AWSEC2AssociateAddressResult
 */
- (AWSTask *)associateAddress:(AWSEC2AssociateAddressRequest *)request;

/**
 <p>Associates a set of DHCP options (that you've previously created) with the specified VPC, or associates no DHCP options with the VPC.</p><p>After you associate the options with the VPC, any existing instances and all new instances that you launch in that VPC use the options. You don't need to restart or relaunch the instances. They automatically pick up the changes within a few hours, depending on how frequently the instance renews its DHCP lease. You can explicitly renew the lease using the operating system on the instance.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateDhcpOptions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AssociateDhcpOptionsRequest
 */
- (AWSTask *)associateDhcpOptions:(AWSEC2AssociateDhcpOptionsRequest *)request;

/**
 <p>Associates a subnet with a route table. The subnet and route table must be in the same VPC. This association causes traffic originating from the subnet to be routed according to the routes in the route table. The action returns an association ID, which you need in order to disassociate the route table from the subnet later. A route table can be associated with multiple subnets.</p><p>For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AssociateRouteTable service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AssociateRouteTableResult`.
 
 @see AWSEC2AssociateRouteTableRequest
 @see AWSEC2AssociateRouteTableResult
 */
- (AWSTask *)associateRouteTable:(AWSEC2AssociateRouteTableRequest *)request;

/**
 AttachClassicLinkVpc
 
 @param request A container for the necessary parameters to execute the AttachClassicLinkVpc service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AttachClassicLinkVpcResult`.
 
 @see AWSEC2AttachClassicLinkVpcRequest
 @see AWSEC2AttachClassicLinkVpcResult
 */
- (AWSTask *)attachClassicLinkVpc:(AWSEC2AttachClassicLinkVpcRequest *)request;

/**
 <p>Attaches an Internet gateway to a VPC, enabling connectivity between the Internet and the VPC. For more information about your VPC and Internet gateway, see the <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/">Amazon Virtual Private Cloud User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInternetGateway service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AttachInternetGatewayRequest
 */
- (AWSTask *)attachInternetGateway:(AWSEC2AttachInternetGatewayRequest *)request;

/**
 <p>Attaches a network interface to an instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachNetworkInterface service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AttachNetworkInterfaceResult`.
 
 @see AWSEC2AttachNetworkInterfaceRequest
 @see AWSEC2AttachNetworkInterfaceResult
 */
- (AWSTask *)attachNetworkInterface:(AWSEC2AttachNetworkInterfaceRequest *)request;

/**
 <p>Attaches an Amazon EBS volume to a running or stopped instance and exposes it to the instance with the specified device name.</p><p>Encrypted Amazon EBS volumes may only be attached to instances that support Amazon EBS encryption. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>For a list of supported device names, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html">Attaching an Amazon EBS Volume to an Instance</a>. Any device names that aren't reserved for instance store volumes can be used for Amazon EBS volumes. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html">Amazon EC2 Instance Store</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>If a volume has an AWS Marketplace product code:</p><ul><li>The volume can only be attached as the root device of a stopped instance.</li><li>You must be subscribed to the AWS Marketplace code that is on the volume.</li><li>The configuration (instance type, operating system) of the instance must support that specific AWS Marketplace code. For example, you cannot take a volume from a Windows instance and attach it to a Linux instance.</li><li>AWS Marketplace product codes are copied from the volume to the instance.</li></ul><p>For an overview of the AWS Marketplace, see <a href="https://aws.amazon.com/marketplace/help/200900000">https://aws.amazon.com/marketplace/help/200900000</a>. For more information about how to use the AWS Marketplace, see <a href="https://aws.amazon.com/marketplace">AWS Marketplace</a>.</p><p>For more information about Amazon EBS volumes, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html">Attaching Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachVolume service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2VolumeAttachment`.
 
 @see AWSEC2AttachVolumeRequest
 @see AWSEC2VolumeAttachment
 */
- (AWSTask *)attachVolume:(AWSEC2AttachVolumeRequest *)request;

/**
 <p>Attaches a virtual private gateway to a VPC. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachVpnGateway service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2AttachVpnGatewayResult`.
 
 @see AWSEC2AttachVpnGatewayRequest
 @see AWSEC2AttachVpnGatewayResult
 */
- (AWSTask *)attachVpnGateway:(AWSEC2AttachVpnGatewayRequest *)request;

/**
 <p>Adds one or more egress rules to a security group for use with a VPC. Specifically, this action permits instances to send traffic to one or more destination CIDR IP address ranges, or to one or more destination security groups for the same VPC.</p><important><p>You can have up to 50 rules per security group (covering both ingress and egress rules).</p></important><p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. This action doesn't apply to security groups for use in EC2-Classic. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>Each rule consists of the protocol (for example, TCP), plus either a CIDR range or a source group. For the TCP and UDP protocols, you must also specify the destination port or port range. For the ICMP protocol, you must also specify the ICMP type and code. You can use -1 for the type or code to mean all types or all codes.</p><p>Rule changes are propagated to affected instances as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSecurityGroupEgress service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AuthorizeSecurityGroupEgressRequest
 */
- (AWSTask *)authorizeSecurityGroupEgress:(AWSEC2AuthorizeSecurityGroupEgressRequest *)request;

/**
 <p>Adds one or more ingress rules to a security group.</p><important><p>EC2-Classic: You can have up to 100 rules per group.</p><p>EC2-VPC: You can have up to 50 rules per group (covering both ingress and egress rules).</p></important><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p><p>[EC2-Classic] This action gives one or more CIDR IP address ranges permission to access a security group in your account, or gives one or more security groups (called the <i>source groups</i>) permission to access a security group for your account. A source group can be for your own AWS account, or another.</p><p>[EC2-VPC] This action gives one or more CIDR IP address ranges permission to access a security group in your VPC, or gives one or more other security groups (called the <i>source groups</i>) permission to access a security group for your VPC. The security groups must all be for the same VPC.</p>
 
 @param request A container for the necessary parameters to execute the AuthorizeSecurityGroupIngress service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2AuthorizeSecurityGroupIngressRequest
 */
- (AWSTask *)authorizeSecurityGroupIngress:(AWSEC2AuthorizeSecurityGroupIngressRequest *)request;

/**
 <p>Bundles an Amazon instance store-backed Windows instance.</p><p>During bundling, only the root device volume (C:\) is bundled. Data on other instance store volumes is not preserved.</p><note><p>This procedure is not applicable for Linux/Unix instances or Windows instances that are backed by Amazon EBS.</p></note><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/Creating_InstanceStoreBacked_WinAMI.html">Creating an Instance Store-Backed Windows AMI</a>.</p>
 
 @param request A container for the necessary parameters to execute the BundleInstance service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2BundleInstanceResult`.
 
 @see AWSEC2BundleInstanceRequest
 @see AWSEC2BundleInstanceResult
 */
- (AWSTask *)bundleInstance:(AWSEC2BundleInstanceRequest *)request;

/**
 <p>Cancels a bundling operation for an instance store-backed Windows instance.</p>
 
 @param request A container for the necessary parameters to execute the CancelBundleTask service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CancelBundleTaskResult`.
 
 @see AWSEC2CancelBundleTaskRequest
 @see AWSEC2CancelBundleTaskResult
 */
- (AWSTask *)cancelBundleTask:(AWSEC2CancelBundleTaskRequest *)request;

/**
 <p>Cancels an active conversion task. The task can be the import of an instance or volume. The action removes all artifacts of the conversion, including a partially uploaded volume or instance. If the conversion is complete or is in the process of transferring the final disk image, the command fails and returns an exception.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UploadingYourInstancesandVolumes.html">Using the Command Line Tools to Import Your Virtual Machine to Amazon EC2</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CancelConversionTask service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CancelConversionRequest
 */
- (AWSTask *)cancelConversionTask:(AWSEC2CancelConversionRequest *)request;

/**
 <p>Cancels an active export task. The request removes all artifacts of the export, including any partially-created Amazon S3 objects. If the export task is complete or is in the process of transferring the final disk image, the command fails and returns an error.</p>
 
 @param request A container for the necessary parameters to execute the CancelExportTask service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CancelExportTaskRequest
 */
- (AWSTask *)cancelExportTask:(AWSEC2CancelExportTaskRequest *)request;

/**
 <p>Cancels the specified Reserved Instance listing in the Reserved Instance Marketplace.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CancelReservedInstancesListing service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CancelReservedInstancesListingResult`.
 
 @see AWSEC2CancelReservedInstancesListingRequest
 @see AWSEC2CancelReservedInstancesListingResult
 */
- (AWSTask *)cancelReservedInstancesListing:(AWSEC2CancelReservedInstancesListingRequest *)request;

/**
 <p>Cancels one or more Spot Instance requests. Spot Instances are instances that Amazon EC2 starts on your behalf when the maximum price that you specify exceeds the current Spot Price. Amazon EC2 periodically sets the Spot Price based on available Spot Instance capacity and current Spot Instance requests. For more information about Spot Instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html">Spot Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><important><p>Canceling a Spot Instance request does not terminate running Spot Instances associated with the request.</p></important>
 
 @param request A container for the necessary parameters to execute the CancelSpotInstanceRequests service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CancelSpotInstanceRequestsResult`.
 
 @see AWSEC2CancelSpotInstanceRequestsRequest
 @see AWSEC2CancelSpotInstanceRequestsResult
 */
- (AWSTask *)cancelSpotInstanceRequests:(AWSEC2CancelSpotInstanceRequestsRequest *)request;

/**
 <p>Determines whether a product code is associated with an instance. This action can only be used by the owner of the product code. It is useful when a product code owner needs to verify whether another user's instance is eligible for support.</p>
 
 @param request A container for the necessary parameters to execute the ConfirmProductInstance service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ConfirmProductInstanceResult`.
 
 @see AWSEC2ConfirmProductInstanceRequest
 @see AWSEC2ConfirmProductInstanceResult
 */
- (AWSTask *)confirmProductInstance:(AWSEC2ConfirmProductInstanceRequest *)request;

/**
 <p>Provides information to AWS about your VPN customer gateway device. The customer gateway is the appliance at your end of the VPN connection. (The device on the AWS side of the VPN connection is the virtual private gateway.) You must provide the Internet-routable IP address of the customer gateway's external interface. The IP address must be static and can't be behind a device performing network address translation (NAT).</p><p>For devices that use Border Gateway Protocol (BGP), you can also provide the device's BGP Autonomous System Number (ASN). You can use an existing ASN assigned to your network. If you don't have an ASN already, you can use a private ASN (in the 64512 - 65534 range).</p><note><p>Amazon EC2 supports all 2-byte ASN numbers in the range of 1 - 65534, with the exception of 7224, which is reserved in the <code>us-east-1</code> region, and 9059, which is reserved in the <code>eu-west-1</code> region.</p></note><p>For more information about VPN customer gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCustomerGateway service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateCustomerGatewayResult`.
 
 @see AWSEC2CreateCustomerGatewayRequest
 @see AWSEC2CreateCustomerGatewayResult
 */
- (AWSTask *)createCustomerGateway:(AWSEC2CreateCustomerGatewayRequest *)request;

/**
 <p>Creates a set of DHCP options for your VPC. After creating the set, you must associate it with the VPC, causing all existing and new instances that you launch in the VPC to use this set of DHCP options. The following are the individual DHCP options you can specify. For more information about the options, see <a href="http://www.ietf.org/rfc/rfc2132.txt">RFC 2132</a>.</p><ul><li><code>domain-name-servers</code> - The IP addresses of up to four domain name servers, or <code>AmazonProvidedDNS</code>. The default DHCP option set specifies <code>AmazonProvidedDNS</code>. If specifying more than one domain name server, specify the IP addresses in a single parameter, separated by commas.</li><li><code>domain-name</code> - If you're using AmazonProvidedDNS in <code>us-east-1</code>, specify <code>ec2.internal</code>. If you're using AmazonProvidedDNS in another region, specify <code>region.compute.internal</code> (for example, <code>ap-northeast-1.compute.internal</code>). Otherwise, specify a domain name (for example, <code>MyCompany.com</code>). If specifying more than one domain name, separate them with spaces.</li><li><code>ntp-servers</code> - The IP addresses of up to four Network Time Protocol (NTP) servers.</li><li><code>netbios-name-servers</code> - The IP addresses of up to four NetBIOS name servers.</li><li><code>netbios-node-type</code> - The NetBIOS node type (1, 2, 4, or 8). We recommend that you specify 2 (broadcast and multicast are not currently supported). For more information about these node types, see <a href="http://www.ietf.org/rfc/rfc2132.txt">RFC 2132</a>. </li></ul><p>Your VPC automatically starts out with a set of DHCP options that includes only a DNS server that we provide (AmazonProvidedDNS). If you create a set of options, and if your VPC has an Internet gateway, make sure to set the <code>domain-name-servers</code> option either to <code>AmazonProvidedDNS</code> or to a domain name server of your choice. For more information about DHCP options, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDhcpOptions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateDhcpOptionsResult`.
 
 @see AWSEC2CreateDhcpOptionsRequest
 @see AWSEC2CreateDhcpOptionsResult
 */
- (AWSTask *)createDhcpOptions:(AWSEC2CreateDhcpOptionsRequest *)request;

/**
 <p>Creates an Amazon EBS-backed AMI from an Amazon EBS-backed instance that is either running or stopped.</p><p>If you customized your instance with instance store volumes or EBS volumes in addition to the root device volume, the new AMI contains block device mapping information for those volumes. When you launch an instance from this new AMI, the instance automatically launches with those additional volumes.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html">Creating Amazon EBS-Backed Linux AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateImage service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateImageResult`.
 
 @see AWSEC2CreateImageRequest
 @see AWSEC2CreateImageResult
 */
- (AWSTask *)createImage:(AWSEC2CreateImageRequest *)request;

/**
 <p>Exports a running or stopped instance to an Amazon S3 bucket.</p><p>For information about the supported operating systems, image formats, and known limitations for the types of instances you can export, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ExportingEC2Instances.html">Exporting EC2 Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInstanceExportTask service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateInstanceExportTaskResult`.
 
 @see AWSEC2CreateInstanceExportTaskRequest
 @see AWSEC2CreateInstanceExportTaskResult
 */
- (AWSTask *)createInstanceExportTask:(AWSEC2CreateInstanceExportTaskRequest *)request;

/**
 <p>Creates an Internet gateway for use with a VPC. After creating the Internet gateway, you attach it to a VPC using <a>AttachInternetGateway</a>.</p><p>For more information about your VPC and Internet gateway, see the <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/">Amazon Virtual Private Cloud User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateInternetGateway service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateInternetGatewayResult`.
 
 @see AWSEC2CreateInternetGatewayRequest
 @see AWSEC2CreateInternetGatewayResult
 */
- (AWSTask *)createInternetGateway:(AWSEC2CreateInternetGatewayRequest *)request;

/**
 <p>Creates a 2048-bit RSA key pair with the specified name. Amazon EC2 stores the public key and displays the private key for you to save to a file. The private key is returned as an unencrypted PEM encoded PKCS#8 private key. If a key with the specified name already exists, Amazon EC2 returns an error.</p><p>You can have up to five thousand key pairs per region.</p><p>The key pair returned to you is available only in the region in which you create it. To create a key pair that is available in all regions, use <a>ImportKeyPair</a>.</p><p>For more information about key pairs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateKeyPair service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2KeyPair`.
 
 @see AWSEC2CreateKeyPairRequest
 @see AWSEC2KeyPair
 */
- (AWSTask *)createKeyPair:(AWSEC2CreateKeyPairRequest *)request;

/**
 <p>Creates a network ACL in a VPC. Network ACLs provide an optional layer of security (in addition to security groups) for the instances in your VPC.</p><p>For more information about network ACLs, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkAcl service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateNetworkAclResult`.
 
 @see AWSEC2CreateNetworkAclRequest
 @see AWSEC2CreateNetworkAclResult
 */
- (AWSTask *)createNetworkAcl:(AWSEC2CreateNetworkAclRequest *)request;

/**
 <p>Creates an entry (a rule) in a network ACL with the specified rule number. Each network ACL has a set of numbered ingress rules and a separate set of numbered egress rules. When determining whether a packet should be allowed in or out of a subnet associated with the ACL, we process the entries in the ACL according to the rule numbers, in ascending order. Each network ACL has a set of ingress rules and a separate set of egress rules.</p><p>We recommend that you leave room between the rule numbers (for example, 100, 110, 120, ...), and not number them one right after the other (for example, 101, 102, 103, ...). This makes it easier to add a rule between existing ones without having to renumber the rules.</p><p>After you add an entry, you can't modify it; you must either replace it, or create an entry and delete the old one.</p><p>For more information about network ACLs, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkAclEntry service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreateNetworkAclEntryRequest
 */
- (AWSTask *)createNetworkAclEntry:(AWSEC2CreateNetworkAclEntryRequest *)request;

/**
 <p>Creates a network interface in the specified subnet.</p><p>For more information about network interfaces, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html">Elastic Network Interfaces</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNetworkInterface service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateNetworkInterfaceResult`.
 
 @see AWSEC2CreateNetworkInterfaceRequest
 @see AWSEC2CreateNetworkInterfaceResult
 */
- (AWSTask *)createNetworkInterface:(AWSEC2CreateNetworkInterfaceRequest *)request;

/**
 <p>Creates a placement group that you launch cluster instances into. You must give the group a name that's unique within the scope of your account.</p><p>For more information about placement groups and cluster instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cluster_computing.html">Cluster Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreatePlacementGroup service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreatePlacementGroupRequest
 */
- (AWSTask *)createPlacementGroup:(AWSEC2CreatePlacementGroupRequest *)request;

/**
 <p>Creates a listing for Amazon EC2 Reserved Instances to be sold in the Reserved Instance Marketplace. You can submit one Reserved Instance listing at a time. To get a list of your Reserved Instances, you can use the <a>DescribeReservedInstances</a> operation.</p><p>The Reserved Instance Marketplace matches sellers who want to resell Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances. </p><p>To sell your Reserved Instances, you must first register as a Seller in the Reserved Instance Marketplace. After completing the registration process, you can create a Reserved Instance Marketplace listing of some or all of your Reserved Instances, and specify the upfront price to receive for them. Your Reserved Instance listings then become available for purchase. To view the details of your Reserved Instance listing, you can use the <a>DescribeReservedInstancesListings</a> operation.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateReservedInstancesListing service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateReservedInstancesListingResult`.
 
 @see AWSEC2CreateReservedInstancesListingRequest
 @see AWSEC2CreateReservedInstancesListingResult
 */
- (AWSTask *)createReservedInstancesListing:(AWSEC2CreateReservedInstancesListingRequest *)request;

/**
 <p>Creates a route in a route table within a VPC.</p><p>You must specify one of the following targets: Internet gateway or virtual private gateway, NAT instance, VPC peering connection, or network interface.</p><p>When determining how to route traffic, we use the route with the most specific match. For example, let's say the traffic is destined for <code>192.0.2.3</code>, and the route table includes the following two routes:</p><ul><li><p><code>192.0.2.0/24</code> (goes to some target A)</p></li><li><p><code>192.0.2.0/28</code> (goes to some target B)</p></li></ul><p>Both routes apply to the traffic destined for <code>192.0.2.3</code>. However, the second route in the list covers a smaller number of IP addresses and is therefore more specific, so we use that route to determine where to target the traffic.</p><p>For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRoute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreateRouteRequest
 */
- (AWSTask *)createRoute:(AWSEC2CreateRouteRequest *)request;

/**
 <p>Creates a route table for the specified VPC. After you create a route table, you can add routes and associate the table with a subnet.</p><p>For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRouteTable service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateRouteTableResult`.
 
 @see AWSEC2CreateRouteTableRequest
 @see AWSEC2CreateRouteTableResult
 */
- (AWSTask *)createRouteTable:(AWSEC2CreateRouteTableRequest *)request;

/**
 <p>Creates a security group.</p><p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i> and <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><important><p>EC2-Classic: You can have up to 500 security groups.</p><p>EC2-VPC: You can create up to 100 security groups per VPC.</p></important><p>When you create a security group, you specify a friendly name of your choice. You can have a security group for use in EC2-Classic with the same name as a security group for use in a VPC. However, you can't have two security groups for use in EC2-Classic with the same name or two security groups for use in a VPC with the same name.</p><p>You have a default security group for use in EC2-Classic and a default security group for use in your VPC. If you don't specify a security group when you launch an instance, the instance is launched into the appropriate default security group. A default security group includes a default rule that grants instances unrestricted network access to each other.</p><p>You can add or remove rules from your security groups using <a>AuthorizeSecurityGroupIngress</a>, <a>AuthorizeSecurityGroupEgress</a>, <a>RevokeSecurityGroupIngress</a>, and <a>RevokeSecurityGroupEgress</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityGroup service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateSecurityGroupResult`.
 
 @see AWSEC2CreateSecurityGroupRequest
 @see AWSEC2CreateSecurityGroupResult
 */
- (AWSTask *)createSecurityGroup:(AWSEC2CreateSecurityGroupRequest *)request;

/**
 <p>Creates a snapshot of an Amazon EBS volume and stores it in Amazon S3. You can use snapshots for backups, to make copies of Amazon EBS volumes, and to save data before shutting down an instance.</p><p>When a snapshot is created, any AWS Marketplace product codes that are associated with the source volume are propagated to the snapshot.</p><p>You can take a snapshot of an attached volume that is in use. However, snapshots only capture data that has been written to your Amazon EBS volume at the time the snapshot command is issued; this may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the volume long enough to take a snapshot, your snapshot should be complete. However, if you cannot pause all file writes to the volume, you should unmount the volume from within the instance, issue the snapshot command, and then remount the volume to ensure a consistent and complete snapshot. You may remount and use your volume while the snapshot status is <code>pending</code>.</p><p>To create a snapshot for Amazon EBS volumes that serve as root devices, you should stop the instance before taking the snapshot.</p><p>Snapshots that are taken from encrypted volumes are automatically encrypted. Volumes that are created from encrypted snapshots are also automatically encrypted. Your encrypted volumes and any associated snapshots always remain protected.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html">Amazon Elastic Block Store</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2Snapshot`.
 
 @see AWSEC2CreateSnapshotRequest
 @see AWSEC2Snapshot
 */
- (AWSTask *)createSnapshot:(AWSEC2CreateSnapshotRequest *)request;

/**
 <p>Creates a datafeed for Spot Instances, enabling you to view Spot Instance usage logs. You can create one data feed per AWS account. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html">Spot Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSpotDatafeedSubscription service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateSpotDatafeedSubscriptionResult`.
 
 @see AWSEC2CreateSpotDatafeedSubscriptionRequest
 @see AWSEC2CreateSpotDatafeedSubscriptionResult
 */
- (AWSTask *)createSpotDatafeedSubscription:(AWSEC2CreateSpotDatafeedSubscriptionRequest *)request;

/**
 <p>Creates a subnet in an existing VPC.</p><p>When you create each subnet, you provide the VPC ID and the CIDR block you want for the subnet. After you create a subnet, you can't change its CIDR block. The subnet's CIDR block can be the same as the VPC's CIDR block (assuming you want only a single subnet in the VPC), or a subset of the VPC's CIDR block. If you create more than one subnet in a VPC, the subnets' CIDR blocks must not overlap. The smallest subnet (and VPC) you can create uses a /28 netmask (16 IP addresses), and the largest uses a /16 netmask (65,536 IP addresses).</p><important><p>AWS reserves both the first four and the last IP address in each subnet's CIDR block. They're not available for use.</p></important><p>If you add more than one subnet to a VPC, they're set up in a star topology with a logical router in the middle.</p><p>If you launch an instance in a VPC using an Amazon EBS-backed AMI, the IP address doesn't change if you stop and restart the instance (unlike a similar instance launched outside a VPC, which gets a new IP address when restarted). It's therefore possible to have a subnet with no running instances (they're all stopped), but no remaining IP addresses available.</p><p>For more information about subnets, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSubnet service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateSubnetResult`.
 
 @see AWSEC2CreateSubnetRequest
 @see AWSEC2CreateSubnetResult
 */
- (AWSTask *)createSubnet:(AWSEC2CreateSubnetRequest *)request;

/**
 <p>Adds or overwrites one or more tags for the specified EC2 resource or resources. Each resource can have a maximum of 10 tags. Each tag consists of a key and optional value. Tag keys must be unique per resource.</p><p>For more information about tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateTags service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreateTagsRequest
 */
- (AWSTask *)createTags:(AWSEC2CreateTagsRequest *)request;

/**
 <p>Creates an Amazon EBS volume that can be attached to an instance in the same Availability Zone. The volume is created in the specified region.</p><p>You can create a new empty volume or restore a volume from an Amazon EBS snapshot. Any AWS Marketplace product codes from the snapshot are propagated to the volume.</p><p>You can create encrypted volumes with the <code>Encrypted</code> parameter. Encrypted volumes may only be attached to instances that support Amazon EBS encryption. Volumes that are created from encrypted snapshots are also automatically encrypted. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html">Creating or Restoring an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVolume service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2Volume`.
 
 @see AWSEC2CreateVolumeRequest
 @see AWSEC2Volume
 */
- (AWSTask *)createVolume:(AWSEC2CreateVolumeRequest *)request;

/**
 <p>Creates a VPC with the specified CIDR block.</p><p>The smallest VPC you can create uses a /28 netmask (16 IP addresses), and the largest uses a /16 netmask (65,536 IP addresses). To help you decide how big to make your VPC, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>By default, each instance you launch in the VPC has the default DHCP options, which includes only a default DNS server that we provide (AmazonProvidedDNS). For more information about DHCP options, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpc service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcResult`.
 
 @see AWSEC2CreateVpcRequest
 @see AWSEC2CreateVpcResult
 */
- (AWSTask *)createVpc:(AWSEC2CreateVpcRequest *)request;

/**
 <p>Requests a VPC peering connection between two VPCs: a requester VPC that you own and a peer VPC with which to create the connection. The peer VPC can belong to another AWS account. The requester VPC and peer VPC cannot have overlapping CIDR blocks.</p><p>The owner of the peer VPC must accept the peering request to activate the peering connection. The VPC peering connection request expires after 7 days, after which it cannot be accepted or rejected.</p><p>A <code>CreateVpcPeeringConnection</code> request between VPCs with overlapping CIDR blocks results in the VPC peering connection having a status of <code>failed</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpcPeeringConnection service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpcPeeringConnectionResult`.
 
 @see AWSEC2CreateVpcPeeringConnectionRequest
 @see AWSEC2CreateVpcPeeringConnectionResult
 */
- (AWSTask *)createVpcPeeringConnection:(AWSEC2CreateVpcPeeringConnectionRequest *)request;

/**
 <p>Creates a VPN connection between an existing virtual private gateway and a VPN customer gateway. The only supported connection type is <code>ipsec.1</code>.</p><p>The response includes information that you need to give to your network administrator to configure your customer gateway.</p><important><p>We strongly recommend that you use HTTPS when calling this operation because the response contains sensitive cryptographic information for configuring your customer gateway.</p></important><p>If you decide to shut down your VPN connection for any reason and later create a new VPN connection, you must reconfigure your customer gateway with the new information returned from this call.</p><p>For more information about VPN connections, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnConnection service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpnConnectionResult`.
 
 @see AWSEC2CreateVpnConnectionRequest
 @see AWSEC2CreateVpnConnectionResult
 */
- (AWSTask *)createVpnConnection:(AWSEC2CreateVpnConnectionRequest *)request;

/**
 <p>Creates a static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.</p><p>For more information about VPN connections, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnConnectionRoute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2CreateVpnConnectionRouteRequest
 */
- (AWSTask *)createVpnConnectionRoute:(AWSEC2CreateVpnConnectionRouteRequest *)request;

/**
 <p>Creates a virtual private gateway. A virtual private gateway is the endpoint on the VPC side of your VPN connection. You can create a virtual private gateway before creating the VPC itself.</p><p>For more information about virtual private gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateVpnGateway service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2CreateVpnGatewayResult`.
 
 @see AWSEC2CreateVpnGatewayRequest
 @see AWSEC2CreateVpnGatewayResult
 */
- (AWSTask *)createVpnGateway:(AWSEC2CreateVpnGatewayRequest *)request;

/**
 <p>Deletes the specified customer gateway. You must delete the VPN connection before you can delete the customer gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCustomerGateway service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteCustomerGatewayRequest
 */
- (AWSTask *)deleteCustomerGateway:(AWSEC2DeleteCustomerGatewayRequest *)request;

/**
 <p>Deletes the specified set of DHCP options. You must disassociate the set of DHCP options before you can delete it. You can disassociate the set of DHCP options by associating either a new set of options or the default set of options with the VPC.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDhcpOptions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteDhcpOptionsRequest
 */
- (AWSTask *)deleteDhcpOptions:(AWSEC2DeleteDhcpOptionsRequest *)request;

/**
 <p>Deletes the specified Internet gateway. You must detach the Internet gateway from the VPC before you can delete it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInternetGateway service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteInternetGatewayRequest
 */
- (AWSTask *)deleteInternetGateway:(AWSEC2DeleteInternetGatewayRequest *)request;

/**
 <p>Deletes the specified key pair, by removing the public key from Amazon EC2.</p>
 
 @param request A container for the necessary parameters to execute the DeleteKeyPair service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteKeyPairRequest
 */
- (AWSTask *)deleteKeyPair:(AWSEC2DeleteKeyPairRequest *)request;

/**
 <p>Deletes the specified network ACL. You can't delete the ACL if it's associated with any subnets. You can't delete the default network ACL.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkAcl service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteNetworkAclRequest
 */
- (AWSTask *)deleteNetworkAcl:(AWSEC2DeleteNetworkAclRequest *)request;

/**
 <p>Deletes the specified ingress or egress entry (rule) from the specified network ACL.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkAclEntry service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteNetworkAclEntryRequest
 */
- (AWSTask *)deleteNetworkAclEntry:(AWSEC2DeleteNetworkAclEntryRequest *)request;

/**
 <p>Deletes the specified network interface. You must detach the network interface before you can delete it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNetworkInterface service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteNetworkInterfaceRequest
 */
- (AWSTask *)deleteNetworkInterface:(AWSEC2DeleteNetworkInterfaceRequest *)request;

/**
 <p>Deletes the specified placement group. You must terminate all instances in the placement group before you can delete the placement group. For more information about placement groups and cluster instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cluster_computing.html">Cluster Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePlacementGroup service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeletePlacementGroupRequest
 */
- (AWSTask *)deletePlacementGroup:(AWSEC2DeletePlacementGroupRequest *)request;

/**
 <p>Deletes the specified route from the specified route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRoute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteRouteRequest
 */
- (AWSTask *)deleteRoute:(AWSEC2DeleteRouteRequest *)request;

/**
 <p>Deletes the specified route table. You must disassociate the route table from any subnets before you can delete it. You can't delete the main route table.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRouteTable service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteRouteTableRequest
 */
- (AWSTask *)deleteRouteTable:(AWSEC2DeleteRouteTableRequest *)request;

/**
 <p>Deletes a security group.</p><p>If you attempt to delete a security group that is associated with an instance, or is referenced by another security group, the operation fails with <code>InvalidGroup.InUse</code> in EC2-Classic or <code>DependencyViolation</code> in EC2-VPC.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityGroup service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteSecurityGroupRequest
 */
- (AWSTask *)deleteSecurityGroup:(AWSEC2DeleteSecurityGroupRequest *)request;

/**
 <p>Deletes the specified snapshot.</p><p>When you make periodic snapshots of a volume, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the volume.</p><p>You cannot delete a snapshot of the root device of an Amazon EBS volume used by a registered AMI. You must first de-register the AMI before you can delete the snapshot.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html">Deleting an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshot service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteSnapshotRequest
 */
- (AWSTask *)deleteSnapshot:(AWSEC2DeleteSnapshotRequest *)request;

/**
 <p>Deletes the datafeed for Spot Instances. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html">Spot Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSpotDatafeedSubscription service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteSpotDatafeedSubscriptionRequest
 */
- (AWSTask *)deleteSpotDatafeedSubscription:(AWSEC2DeleteSpotDatafeedSubscriptionRequest *)request;

/**
 <p>Deletes the specified subnet. You must terminate all running instances in the subnet before you can delete the subnet.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSubnet service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteSubnetRequest
 */
- (AWSTask *)deleteSubnet:(AWSEC2DeleteSubnetRequest *)request;

/**
 <p>Deletes the specified set of tags from the specified set of resources. This call is designed to follow a <code>DescribeTags</code> request.</p><p>For more information about tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteTagsRequest
 */
- (AWSTask *)deleteTags:(AWSEC2DeleteTagsRequest *)request;

/**
 <p>Deletes the specified Amazon EBS volume. The volume must be in the <code>available</code> state (not attached to an instance).</p><note><p>The volume may remain in the <code>deleting</code> state for several minutes.</p></note><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-volume.html">Deleting an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVolume service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVolumeRequest
 */
- (AWSTask *)deleteVolume:(AWSEC2DeleteVolumeRequest *)request;

/**
 <p>Deletes the specified VPC. You must detach or delete all gateways and resources that are associated with the VPC before you can delete it. For example, you must terminate all instances running in the VPC, delete all security groups associated with the VPC (except the default one), delete all route tables associated with the VPC (except the default one), and so on.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpc service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVpcRequest
 */
- (AWSTask *)deleteVpc:(AWSEC2DeleteVpcRequest *)request;

/**
 <p>Deletes a VPC peering connection. Either the owner of the requester VPC or the owner of the peer VPC can delete the VPC peering connection if it's in the <code>active</code> state. The owner of the requester VPC can delete a VPC peering connection in the <code>pending-acceptance</code> state. </p>
 
 @param request A container for the necessary parameters to execute the DeleteVpcPeeringConnection service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DeleteVpcPeeringConnectionResult`.
 
 @see AWSEC2DeleteVpcPeeringConnectionRequest
 @see AWSEC2DeleteVpcPeeringConnectionResult
 */
- (AWSTask *)deleteVpcPeeringConnection:(AWSEC2DeleteVpcPeeringConnectionRequest *)request;

/**
 <p>Deletes the specified VPN connection.</p><p>If you're deleting the VPC and its associated components, we recommend that you detach the virtual private gateway from the VPC and delete the VPC before deleting the VPN connection. If you believe that the tunnel credentials for your VPN connection have been compromised, you can delete the VPN connection and create a new one that has new keys, without needing to delete the VPC or virtual private gateway. If you create a new VPN connection, you must reconfigure the customer gateway using the new configuration information returned with the new VPN connection ID.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpnConnection service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVpnConnectionRequest
 */
- (AWSTask *)deleteVpnConnection:(AWSEC2DeleteVpnConnectionRequest *)request;

/**
 <p>Deletes the specified static route associated with a VPN connection between an existing virtual private gateway and a VPN customer gateway. The static route allows traffic to be routed from the virtual private gateway to the VPN customer gateway.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpnConnectionRoute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVpnConnectionRouteRequest
 */
- (AWSTask *)deleteVpnConnectionRoute:(AWSEC2DeleteVpnConnectionRouteRequest *)request;

/**
 <p>Deletes the specified virtual private gateway. We recommend that before you delete a virtual private gateway, you detach it from the VPC and delete the VPN connection. Note that you don't need to delete the virtual private gateway if you plan to delete and recreate the VPN connection between your VPC and your network.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVpnGateway service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeleteVpnGatewayRequest
 */
- (AWSTask *)deleteVpnGateway:(AWSEC2DeleteVpnGatewayRequest *)request;

/**
 <p>Deregisters the specified AMI. After you deregister an AMI, it can't be used to launch new instances.</p><p>This command does not delete the AMI.</p>
 
 @param request A container for the necessary parameters to execute the DeregisterImage service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DeregisterImageRequest
 */
- (AWSTask *)deregisterImage:(AWSEC2DeregisterImageRequest *)request;

/**
 <p>Describes the specified attribute of your AWS account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAccountAttributesResult`.
 
 @see AWSEC2DescribeAccountAttributesRequest
 @see AWSEC2DescribeAccountAttributesResult
 */
- (AWSTask *)describeAccountAttributes:(AWSEC2DescribeAccountAttributesRequest *)request;

/**
 <p>Describes one or more of your Elastic IP addresses.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddresses service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAddressesResult`.
 
 @see AWSEC2DescribeAddressesRequest
 @see AWSEC2DescribeAddressesResult
 */
- (AWSTask *)describeAddresses:(AWSEC2DescribeAddressesRequest *)request;

/**
 <p>Describes one or more of the Availability Zones that are available to you. The results include zones only for the region you're currently using. If there is an event impacting an Availability Zone, you can use this request to view the state and any provided message for that Availability Zone.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html">Regions and Availability Zones</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailabilityZones service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeAvailabilityZonesResult`.
 
 @see AWSEC2DescribeAvailabilityZonesRequest
 @see AWSEC2DescribeAvailabilityZonesResult
 */
- (AWSTask *)describeAvailabilityZones:(AWSEC2DescribeAvailabilityZonesRequest *)request;

/**
 <p>Describes one or more of your bundling tasks.</p><note><p>Completed bundle tasks are listed for only a limited time. If your bundle task is no longer in the list, you can still register an AMI from it. Just use <code>RegisterImage</code> with the Amazon S3 bucket name and image manifest name you provided to the bundle task.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeBundleTasks service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeBundleTasksResult`.
 
 @see AWSEC2DescribeBundleTasksRequest
 @see AWSEC2DescribeBundleTasksResult
 */
- (AWSTask *)describeBundleTasks:(AWSEC2DescribeBundleTasksRequest *)request;

/**
 DescribeClassicLinkInstances
 
 @param request A container for the necessary parameters to execute the DescribeClassicLinkInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeClassicLinkInstancesResult`.
 
 @see AWSEC2DescribeClassicLinkInstancesRequest
 @see AWSEC2DescribeClassicLinkInstancesResult
 */
- (AWSTask *)describeClassicLinkInstances:(AWSEC2DescribeClassicLinkInstancesRequest *)request;

/**
 <p>Describes one or more of your conversion tasks. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UploadingYourInstancesandVolumes.html">Using the Command Line Tools to Import Your Virtual Machine to Amazon EC2</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeConversionTasks service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeConversionTasksResult`.
 
 @see AWSEC2DescribeConversionTasksRequest
 @see AWSEC2DescribeConversionTasksResult
 */
- (AWSTask *)describeConversionTasks:(AWSEC2DescribeConversionTasksRequest *)request;

/**
 <p>Describes one or more of your VPN customer gateways.</p><p>For more information about VPN customer gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCustomerGateways service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeCustomerGatewaysResult`.
 
 @see AWSEC2DescribeCustomerGatewaysRequest
 @see AWSEC2DescribeCustomerGatewaysResult
 */
- (AWSTask *)describeCustomerGateways:(AWSEC2DescribeCustomerGatewaysRequest *)request;

/**
 <p>Describes one or more of your DHCP options sets.</p><p>For more information about DHCP options sets, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html">DHCP Options Sets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDhcpOptions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeDhcpOptionsResult`.
 
 @see AWSEC2DescribeDhcpOptionsRequest
 @see AWSEC2DescribeDhcpOptionsResult
 */
- (AWSTask *)describeDhcpOptions:(AWSEC2DescribeDhcpOptionsRequest *)request;

/**
 <p>Describes one or more of your export tasks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeExportTasks service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeExportTasksResult`.
 
 @see AWSEC2DescribeExportTasksRequest
 @see AWSEC2DescribeExportTasksResult
 */
- (AWSTask *)describeExportTasks:(AWSEC2DescribeExportTasksRequest *)request;

/**
 <p>Describes the specified attribute of the specified AMI. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the DescribeImageAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImageAttribute`.
 
 @see AWSEC2DescribeImageAttributeRequest
 @see AWSEC2ImageAttribute
 */
- (AWSTask *)describeImageAttribute:(AWSEC2DescribeImageAttributeRequest *)request;

/**
 <p>Describes one or more of the images (AMIs, AKIs, and ARIs) available to you. Images available to you include public images, private images that you own, and private images owned by other AWS accounts but for which you have explicit launch permissions.</p><note><p>Deregistered images are included in the returned results for an unspecified interval after deregistration.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeImages service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeImagesResult`.
 
 @see AWSEC2DescribeImagesRequest
 @see AWSEC2DescribeImagesResult
 */
- (AWSTask *)describeImages:(AWSEC2DescribeImagesRequest *)request;

/**
 <p>Describes the specified attribute of the specified instance. You can specify only one attribute at a time. Valid attribute values are: <code>instanceType</code> | <code>kernel</code> | <code>ramdisk</code> | <code>userData</code> | <code>disableApiTermination</code> | <code>instanceInitiatedShutdownBehavior</code> | <code>rootDeviceName</code> | <code>blockDeviceMapping</code> | <code>productCodes</code> | <code>sourceDestCheck</code> | <code>groupSet</code> | <code>ebsOptimized</code> | <code>sriovNetSupport</code></p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2InstanceAttribute`.
 
 @see AWSEC2DescribeInstanceAttributeRequest
 @see AWSEC2InstanceAttribute
 */
- (AWSTask *)describeInstanceAttribute:(AWSEC2DescribeInstanceAttributeRequest *)request;

/**
 <p>Describes the status of one or more instances, including any scheduled events.</p><p>Instance status has two main components:</p><ul><li><p>System Status reports impaired functionality that stems from issues related to the systems that support an instance, such as such as hardware failures and network connectivity problems. This call reports such problems as impaired reachability.</p></li><li><p>Instance Status reports impaired functionality that arises from problems internal to the instance. This call reports such problems as impaired reachability.</p></li></ul><p>Instance status provides information about four types of scheduled events for an instance that may require your attention:</p><ul><li><p>Scheduled Reboot: When Amazon EC2 determines that an instance must be rebooted, the instances status returns one of two event codes: <code>system-reboot</code> or <code>instance-reboot</code>. System reboot commonly occurs if certain maintenance or upgrade operations require a reboot of the underlying host that supports an instance. Instance reboot commonly occurs if the instance must be rebooted, rather than the underlying host. Rebooting events include a scheduled start and end time.</p></li><li><p>System Maintenance: When Amazon EC2 determines that an instance requires maintenance that requires power or network impact, the instance status is the event code <code>system-maintenance</code>. System maintenance is either power maintenance or network maintenance. For power maintenance, your instance will be unavailable for a brief period of time and then rebooted. For network maintenance, your instance will experience a brief loss of network connectivity. System maintenance events include a scheduled start and end time. You will also be notified by email if one of your instances is set for system maintenance. The email message indicates when your instance is scheduled for maintenance.</p></li><li><p>Scheduled Retirement: When Amazon EC2 determines that an instance must be shut down, the instance status is the event code <code>instance-retirement</code>. Retirement commonly occurs when the underlying host is degraded and must be replaced. Retirement events include a scheduled start and end time. You will also be notified by email if one of your instances is set to retiring. The email message indicates when your instance will be permanently retired.</p></li><li><p>Scheduled Stop: When Amazon EC2 determines that an instance must be shut down, the instances status returns an event code called <code>instance-stop</code>. Stop events include a scheduled start and end time. You will also be notified by email if one of your instances is set to stop. The email message indicates when your instance will be stopped.</p></li></ul><p>When your instance is retired, it will either be terminated (if its root device type is the instance-store) or stopped (if its root device type is an EBS volume). Instances stopped due to retirement will not be restarted, but you can do so manually. You can also avoid retirement of EBS-backed instances by manually restarting your instance when its event code is <code>instance-retirement</code>. This ensures that your instance is started on a different underlying host.</p><p>For more information about failed status checks, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstances.html">Troubleshooting Instances with Failed Status Checks</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>. For more information about working with scheduled events, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-instances-status-check_sched.html#schedevents_actions">Working with an Instance That Has a Scheduled Event</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceStatus service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInstanceStatusResult`.
 
 @see AWSEC2DescribeInstanceStatusRequest
 @see AWSEC2DescribeInstanceStatusResult
 */
- (AWSTask *)describeInstanceStatus:(AWSEC2DescribeInstanceStatusRequest *)request;

/**
 <p>Describes one or more of your instances.</p><p>If you specify one or more instance IDs, Amazon EC2 returns information for those instances. If you do not specify instance IDs, Amazon EC2 returns information for all relevant instances. If you specify an instance ID that is not valid, an error is returned. If you specify an instance that you do not own, it is not included in the returned results.</p><p>Recently terminated instances might appear in the returned results. This interval is usually less than one hour.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInstancesResult`.
 
 @see AWSEC2DescribeInstancesRequest
 @see AWSEC2DescribeInstancesResult
 */
- (AWSTask *)describeInstances:(AWSEC2DescribeInstancesRequest *)request;

/**
 <p>Describes one or more of your Internet gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInternetGateways service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeInternetGatewaysResult`.
 
 @see AWSEC2DescribeInternetGatewaysRequest
 @see AWSEC2DescribeInternetGatewaysResult
 */
- (AWSTask *)describeInternetGateways:(AWSEC2DescribeInternetGatewaysRequest *)request;

/**
 <p>Describes one or more of your key pairs.</p><p>For more information about key pairs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeKeyPairs service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeKeyPairsResult`.
 
 @see AWSEC2DescribeKeyPairsRequest
 @see AWSEC2DescribeKeyPairsResult
 */
- (AWSTask *)describeKeyPairs:(AWSEC2DescribeKeyPairsRequest *)request;

/**
 <p>Describes one or more of your network ACLs.</p><p>For more information about network ACLs, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkAcls service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeNetworkAclsResult`.
 
 @see AWSEC2DescribeNetworkAclsRequest
 @see AWSEC2DescribeNetworkAclsResult
 */
- (AWSTask *)describeNetworkAcls:(AWSEC2DescribeNetworkAclsRequest *)request;

/**
 <p>Describes a network interface attribute. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkInterfaceAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeNetworkInterfaceAttributeResult`.
 
 @see AWSEC2DescribeNetworkInterfaceAttributeRequest
 @see AWSEC2DescribeNetworkInterfaceAttributeResult
 */
- (AWSTask *)describeNetworkInterfaceAttribute:(AWSEC2DescribeNetworkInterfaceAttributeRequest *)request;

/**
 <p>Describes one or more of your network interfaces.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNetworkInterfaces service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeNetworkInterfacesResult`.
 
 @see AWSEC2DescribeNetworkInterfacesRequest
 @see AWSEC2DescribeNetworkInterfacesResult
 */
- (AWSTask *)describeNetworkInterfaces:(AWSEC2DescribeNetworkInterfacesRequest *)request;

/**
 <p>Describes one or more of your placement groups. For more information about placement groups and cluster instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cluster_computing.html">Cluster Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribePlacementGroups service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribePlacementGroupsResult`.
 
 @see AWSEC2DescribePlacementGroupsRequest
 @see AWSEC2DescribePlacementGroupsResult
 */
- (AWSTask *)describePlacementGroups:(AWSEC2DescribePlacementGroupsRequest *)request;

/**
 <p>Describes one or more regions that are currently available to you.</p><p>For a list of the regions supported by Amazon EC2, see <a href="http://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region">Regions and Endpoints</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRegions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeRegionsResult`.
 
 @see AWSEC2DescribeRegionsRequest
 @see AWSEC2DescribeRegionsResult
 */
- (AWSTask *)describeRegions:(AWSEC2DescribeRegionsRequest *)request;

/**
 <p>Describes one or more of the Reserved Instances that you purchased.</p><p>For more information about Reserved Instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html">Reserved Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesResult`.
 
 @see AWSEC2DescribeReservedInstancesRequest
 @see AWSEC2DescribeReservedInstancesResult
 */
- (AWSTask *)describeReservedInstances:(AWSEC2DescribeReservedInstancesRequest *)request;

/**
 <p>Describes your account's Reserved Instance listings in the Reserved Instance Marketplace.</p><p>The Reserved Instance Marketplace matches sellers who want to resell Reserved Instance capacity that they no longer need with buyers who want to purchase additional capacity. Reserved Instances bought and sold through the Reserved Instance Marketplace work like any other Reserved Instances. </p><p>As a seller, you choose to list some or all of your Reserved Instances, and you specify the upfront price to receive for them. Your Reserved Instances are then listed in the Reserved Instance Marketplace and are available for purchase. </p><p>As a buyer, you specify the configuration of the Reserved Instance to purchase, and the Marketplace matches what you're searching for with what's available. The Marketplace first sells the lowest priced Reserved Instances to you, and continues to sell available Reserved Instance listings to you until your demand is met. You are charged based on the total price of all of the listings that you purchase.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesListings service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesListingsResult`.
 
 @see AWSEC2DescribeReservedInstancesListingsRequest
 @see AWSEC2DescribeReservedInstancesListingsResult
 */
- (AWSTask *)describeReservedInstancesListings:(AWSEC2DescribeReservedInstancesListingsRequest *)request;

/**
 <p>Describes the modifications made to your Reserved Instances. If no parameter is specified, information about all your Reserved Instances modification requests is returned. If a modification ID is specified, only information about the specific modification is returned.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide for Linux.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesModifications service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesModificationsResult`.
 
 @see AWSEC2DescribeReservedInstancesModificationsRequest
 @see AWSEC2DescribeReservedInstancesModificationsResult
 */
- (AWSTask *)describeReservedInstancesModifications:(AWSEC2DescribeReservedInstancesModificationsRequest *)request;

/**
 <p>Describes Reserved Instance offerings that are available for purchase. With Reserved Instances, you purchase the right to launch instances for a period of time. During that time period, you do not receive insufficient capacity errors, and you pay a lower usage rate than the rate charged for On-Demand instances for the actual time used.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedInstancesOfferings service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeReservedInstancesOfferingsResult`.
 
 @see AWSEC2DescribeReservedInstancesOfferingsRequest
 @see AWSEC2DescribeReservedInstancesOfferingsResult
 */
- (AWSTask *)describeReservedInstancesOfferings:(AWSEC2DescribeReservedInstancesOfferingsRequest *)request;

/**
 <p>Describes one or more of your route tables.</p><p>For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRouteTables service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeRouteTablesResult`.
 
 @see AWSEC2DescribeRouteTablesRequest
 @see AWSEC2DescribeRouteTablesResult
 */
- (AWSTask *)describeRouteTables:(AWSEC2DescribeRouteTablesRequest *)request;

/**
 <p>Describes one or more of your security groups.</p><p>A security group is for use with instances either in the EC2-Classic platform or in a specific VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i> and <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityGroups service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSecurityGroupsResult`.
 
 @see AWSEC2DescribeSecurityGroupsRequest
 @see AWSEC2DescribeSecurityGroupsResult
 */
- (AWSTask *)describeSecurityGroups:(AWSEC2DescribeSecurityGroupsRequest *)request;

/**
 <p>Describes the specified attribute of the specified snapshot. You can specify only one attribute at a time.</p><p>For more information about Amazon EBS snapshots, see <a href='http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html'>Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSnapshotAttributeResult`.
 
 @see AWSEC2DescribeSnapshotAttributeRequest
 @see AWSEC2DescribeSnapshotAttributeResult
 */
- (AWSTask *)describeSnapshotAttribute:(AWSEC2DescribeSnapshotAttributeRequest *)request;

/**
 <p>Describes one or more of the Amazon EBS snapshots available to you. Available snapshots include public snapshots available for any AWS account to launch, private snapshots that you own, and private snapshots owned by another AWS account but for which you've been given explicit create volume permissions.</p><p>The create volume permissions fall into the following categories:</p><ul><li><i>public</i>: The owner of the snapshot granted create volume permissions for the snapshot to the <code>all</code> group. All AWS accounts have create volume permissions for these snapshots.</li><li><i>explicit</i>: The owner of the snapshot granted create volume permissions to a specific AWS account.</li><li><i>implicit</i>: An AWS account has implicit create volume permissions for all snapshots it owns.</li></ul><p>The list of snapshots returned can be modified by specifying snapshot IDs, snapshot owners, or AWS accounts with create volume permissions. If no options are specified, Amazon EC2 returns all snapshots for which you have create volume permissions.</p><p>If you specify one or more snapshot IDs, only snapshots that have the specified IDs are returned. If you specify an invalid snapshot ID, an error is returned. If you specify a snapshot ID for which you do not have access, it is not included in the returned results.</p><p>If you specify one or more snapshot owners, only snapshots from the specified owners and for which you have access are returned. The results can include the AWS account IDs of the specified owners, <code>amazon</code> for snapshots owned by Amazon, or <code>self</code> for snapshots that you own.</p><p>If you specify a list of restorable users, only snapshots with create snapshot permissions for those users are returned. You can specify AWS account IDs (if you own the snapshots), <code>self</code> for snapshots for which you own or have explicit permissions, or <code>all</code> for public snapshots.</p><p>For more information about Amazon EBS snapshots, see <a href='http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html'>Amazon EBS Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshots service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSnapshotsResult`.
 
 @see AWSEC2DescribeSnapshotsRequest
 @see AWSEC2DescribeSnapshotsResult
 */
- (AWSTask *)describeSnapshots:(AWSEC2DescribeSnapshotsRequest *)request;

/**
 <p>Describes the datafeed for Spot Instances. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html">Spot Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotDatafeedSubscription service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotDatafeedSubscriptionResult`.
 
 @see AWSEC2DescribeSpotDatafeedSubscriptionRequest
 @see AWSEC2DescribeSpotDatafeedSubscriptionResult
 */
- (AWSTask *)describeSpotDatafeedSubscription:(AWSEC2DescribeSpotDatafeedSubscriptionRequest *)request;

/**
 <p>Describes the Spot Instance requests that belong to your account. Spot Instances are instances that Amazon EC2 starts on your behalf when the maximum price that you specify exceeds the current Spot Price. Amazon EC2 periodically sets the Spot Price based on available Spot Instance capacity and current Spot Instance requests. For more information about Spot Instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html">Spot Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>You can use <code>DescribeSpotInstanceRequests</code> to find a running Spot Instance by examining the response. If the status of the Spot Instance is <code>fulfilled</code>, the instance ID appears in the response and contains the identifier of the instance. Alternatively, you can use <a>DescribeInstances</a> with a filter to look for instances where the instance lifecycle is <code>spot</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotInstanceRequests service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotInstanceRequestsResult`.
 
 @see AWSEC2DescribeSpotInstanceRequestsRequest
 @see AWSEC2DescribeSpotInstanceRequestsResult
 */
- (AWSTask *)describeSpotInstanceRequests:(AWSEC2DescribeSpotInstanceRequestsRequest *)request;

/**
 <p>Describes the Spot Price history. Spot Instances are instances that Amazon EC2 starts on your behalf when the maximum price that you specify exceeds the current Spot Price. Amazon EC2 periodically sets the Spot Price based on available Spot Instance capacity and current Spot Instance requests. For more information about Spot Instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html">Spot Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>When you specify an Availability Zone, this operation describes the price history for the specified Availability Zone with the most recent set of prices listed first. If you don't specify an Availability Zone, you get the prices across all Availability Zones, starting with the most recent set. However, if you're using an API version earlier than 2011-05-15, you get the lowest price across the region for the specified time period. The prices returned are listed in chronological order, from the oldest to the most recent.</p><p>When you specify the start and end time options, this operation returns two pieces of data: the prices of the instance types within the time range that you specified and the time when the price changed. The price is valid within the time period that you specified; the response merely indicates the last time that the price changed.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSpotPriceHistory service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSpotPriceHistoryResult`.
 
 @see AWSEC2DescribeSpotPriceHistoryRequest
 @see AWSEC2DescribeSpotPriceHistoryResult
 */
- (AWSTask *)describeSpotPriceHistory:(AWSEC2DescribeSpotPriceHistoryRequest *)request;

/**
 <p>Describes one or more of your subnets.</p><p>For more information about subnets, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html">Your VPC and Subnets</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSubnets service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeSubnetsResult`.
 
 @see AWSEC2DescribeSubnetsRequest
 @see AWSEC2DescribeSubnetsResult
 */
- (AWSTask *)describeSubnets:(AWSEC2DescribeSubnetsRequest *)request;

/**
 <p>Describes one or more of the tags for your EC2 resources.</p><p>For more information about tags, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Resources</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeTagsResult`.
 
 @see AWSEC2DescribeTagsRequest
 @see AWSEC2DescribeTagsResult
 */
- (AWSTask *)describeTags:(AWSEC2DescribeTagsRequest *)request;

/**
 <p>Describes the specified attribute of the specified volume. You can specify only one attribute at a time.</p><p>For more information about Amazon EBS volumes, see <a href='http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html'>Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumeAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumeAttributeResult`.
 
 @see AWSEC2DescribeVolumeAttributeRequest
 @see AWSEC2DescribeVolumeAttributeResult
 */
- (AWSTask *)describeVolumeAttribute:(AWSEC2DescribeVolumeAttributeRequest *)request;

/**
 <p>Describes the status of the specified volumes. Volume status provides the result of the checks performed on your volumes to determine events that can impair the performance of your volumes. The performance of a volume can be affected if an issue occurs on the volume's underlying host. If the volume's underlying host experiences a power outage or system issue, after the system is restored, there could be data inconsistencies on the volume. Volume events notify you if this occurs. Volume actions notify you if any action needs to be taken in response to the event.</p><p>The <code>DescribeVolumeStatus</code> operation provides the following information about the specified volumes:</p><p><i>Status</i>: Reflects the current status of the volume. The possible values are <code>ok</code>, <code>impaired</code> , <code>warning</code>, or <code>insufficient-data</code>. If all checks pass, the overall status of the volume is <code>ok</code>. If the check fails, the overall status is <code>impaired</code>. If the status is <code>insufficient-data</code>, then the checks may still be taking place on your volume at the time. We recommend that you retry the request. For more information on volume status, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-status.html">Monitoring the Status of Your Volumes</a>.</p><p><i>Events</i>: Reflect the cause of a volume status and may require you to take action. For example, if your volume returns an <code>impaired</code> status, then the volume event might be <code>potential-data-inconsistency</code>. This means that your volume has been affected by an issue with the underlying host, has all I/O operations disabled, and may have inconsistent data.</p><p><i>Actions</i>: Reflect the actions you may have to take in response to an event. For example, if the status of the volume is <code>impaired</code> and the volume event shows <code>potential-data-inconsistency</code>, then the action shows <code>enable-volume-io</code>. This means that you may want to enable the I/O operations for the volume by calling the <a>EnableVolumeIO</a> action and then check the volume for data consistency.</p><note><p>Volume status is based on the volume status checks, and does not reflect the volume state. Therefore, volume status does not indicate volumes in the <code>error</code> state (for example, when a volume is incapable of accepting I/O.)</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeVolumeStatus service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumeStatusResult`.
 
 @see AWSEC2DescribeVolumeStatusRequest
 @see AWSEC2DescribeVolumeStatusResult
 */
- (AWSTask *)describeVolumeStatus:(AWSEC2DescribeVolumeStatusRequest *)request;

/**
 <p>Describes the specified Amazon EBS volumes.</p><p>If you are describing a long list of volumes, you can paginate the output to make the list more manageable. The <code>MaxResults</code> parameter sets the maximum number of results returned in a single page. If the list of results exceeds your <code>MaxResults</code> value, then that number of results is returned along with a <code>NextToken</code> value that can be passed to a subsequent <code>DescribeVolumes</code> request to retrieve the remaining results.</p><p>For more information about Amazon EBS volumes, see <a href='http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html'>Amazon EBS Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVolumes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVolumesResult`.
 
 @see AWSEC2DescribeVolumesRequest
 @see AWSEC2DescribeVolumesResult
 */
- (AWSTask *)describeVolumes:(AWSEC2DescribeVolumesRequest *)request;

/**
 <p>Describes the specified attribute of the specified VPC. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcAttributeResult`.
 
 @see AWSEC2DescribeVpcAttributeRequest
 @see AWSEC2DescribeVpcAttributeResult
 */
- (AWSTask *)describeVpcAttribute:(AWSEC2DescribeVpcAttributeRequest *)request;

/**
 DescribeVpcClassicLink
 
 @param request A container for the necessary parameters to execute the DescribeVpcClassicLink service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcClassicLinkResult`.
 
 @see AWSEC2DescribeVpcClassicLinkRequest
 @see AWSEC2DescribeVpcClassicLinkResult
 */
- (AWSTask *)describeVpcClassicLink:(AWSEC2DescribeVpcClassicLinkRequest *)request;

/**
 <p>Describes one or more of your VPC peering connections.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcPeeringConnections service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcPeeringConnectionsResult`.
 
 @see AWSEC2DescribeVpcPeeringConnectionsRequest
 @see AWSEC2DescribeVpcPeeringConnectionsResult
 */
- (AWSTask *)describeVpcPeeringConnections:(AWSEC2DescribeVpcPeeringConnectionsRequest *)request;

/**
 <p>Describes one or more of your VPCs.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpcs service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpcsResult`.
 
 @see AWSEC2DescribeVpcsRequest
 @see AWSEC2DescribeVpcsResult
 */
- (AWSTask *)describeVpcs:(AWSEC2DescribeVpcsRequest *)request;

/**
 <p>Describes one or more of your VPN connections.</p><p>For more information about VPN connections, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">Adding a Hardware Virtual Private Gateway to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpnConnections service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpnConnectionsResult`.
 
 @see AWSEC2DescribeVpnConnectionsRequest
 @see AWSEC2DescribeVpnConnectionsResult
 */
- (AWSTask *)describeVpnConnections:(AWSEC2DescribeVpnConnectionsRequest *)request;

/**
 <p>Describes one or more of your virtual private gateways.</p><p>For more information about virtual private gateways, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html">Adding an IPsec Hardware VPN to Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVpnGateways service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DescribeVpnGatewaysResult`.
 
 @see AWSEC2DescribeVpnGatewaysRequest
 @see AWSEC2DescribeVpnGatewaysResult
 */
- (AWSTask *)describeVpnGateways:(AWSEC2DescribeVpnGatewaysRequest *)request;

/**
 DetachClassicLinkVpc
 
 @param request A container for the necessary parameters to execute the DetachClassicLinkVpc service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DetachClassicLinkVpcResult`.
 
 @see AWSEC2DetachClassicLinkVpcRequest
 @see AWSEC2DetachClassicLinkVpcResult
 */
- (AWSTask *)detachClassicLinkVpc:(AWSEC2DetachClassicLinkVpcRequest *)request;

/**
 <p>Detaches an Internet gateway from a VPC, disabling connectivity between the Internet and the VPC. The VPC must not contain any running instances with Elastic IP addresses.</p>
 
 @param request A container for the necessary parameters to execute the DetachInternetGateway service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DetachInternetGatewayRequest
 */
- (AWSTask *)detachInternetGateway:(AWSEC2DetachInternetGatewayRequest *)request;

/**
 <p>Detaches a network interface from an instance.</p>
 
 @param request A container for the necessary parameters to execute the DetachNetworkInterface service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DetachNetworkInterfaceRequest
 */
- (AWSTask *)detachNetworkInterface:(AWSEC2DetachNetworkInterfaceRequest *)request;

/**
 <p>Detaches an Amazon EBS volume from an instance. Make sure to unmount any file systems on the device within your operating system before detaching the volume. Failure to do so results in the volume being stuck in a busy state while detaching.</p><p>If an Amazon EBS volume is the root device of an instance, it can't be detached while the instance is running. To detach the root volume, stop the instance first.</p><p>If the root volume is detached from an instance with an AWS Marketplace product code, then the AWS Marketplace product codes from that volume are no longer associated with the instance.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-detaching-volume.html">Detaching an Amazon EBS Volume</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the DetachVolume service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2VolumeAttachment`.
 
 @see AWSEC2DetachVolumeRequest
 @see AWSEC2VolumeAttachment
 */
- (AWSTask *)detachVolume:(AWSEC2DetachVolumeRequest *)request;

/**
 <p>Detaches a virtual private gateway from a VPC. You do this if you're planning to turn off the VPC and not use it anymore. You can confirm a virtual private gateway has been completely detached from a VPC by describing the virtual private gateway (any attachments to the virtual private gateway are also described).</p><p>You must wait for the attachment's state to switch to <code>detached</code> before you can delete the VPC or attach a different VPC to the virtual private gateway.</p>
 
 @param request A container for the necessary parameters to execute the DetachVpnGateway service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DetachVpnGatewayRequest
 */
- (AWSTask *)detachVpnGateway:(AWSEC2DetachVpnGatewayRequest *)request;

/**
 <p>Disables a virtual private gateway (VGW) from propagating routes to a specified route table of a VPC.</p>
 
 @param request A container for the necessary parameters to execute the DisableVgwRoutePropagation service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DisableVgwRoutePropagationRequest
 */
- (AWSTask *)disableVgwRoutePropagation:(AWSEC2DisableVgwRoutePropagationRequest *)request;

/**
 DisableVpcClassicLink
 
 @param request A container for the necessary parameters to execute the DisableVpcClassicLink service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2DisableVpcClassicLinkResult`.
 
 @see AWSEC2DisableVpcClassicLinkRequest
 @see AWSEC2DisableVpcClassicLinkResult
 */
- (AWSTask *)disableVpcClassicLink:(AWSEC2DisableVpcClassicLinkRequest *)request;

/**
 <p>Disassociates an Elastic IP address from the instance or network interface it's associated with.</p><p>An Elastic IP address is for use in either the EC2-Classic platform or in a VPC. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>This is an idempotent operation. If you perform the operation more than once, Amazon EC2 doesn't return an error.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateAddress service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DisassociateAddressRequest
 */
- (AWSTask *)disassociateAddress:(AWSEC2DisassociateAddressRequest *)request;

/**
 <p>Disassociates a subnet from a route table.</p><p>After you perform this action, the subnet no longer uses the routes in the route table. Instead, it uses the routes in the VPC's main route table. For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateRouteTable service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2DisassociateRouteTableRequest
 */
- (AWSTask *)disassociateRouteTable:(AWSEC2DisassociateRouteTableRequest *)request;

/**
 <p>Enables a virtual private gateway (VGW) to propagate routes to the specified route table of a VPC.</p>
 
 @param request A container for the necessary parameters to execute the EnableVgwRoutePropagation service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2EnableVgwRoutePropagationRequest
 */
- (AWSTask *)enableVgwRoutePropagation:(AWSEC2EnableVgwRoutePropagationRequest *)request;

/**
 <p>Enables I/O operations for a volume that had I/O operations disabled because the data on the volume was potentially inconsistent.</p>
 
 @param request A container for the necessary parameters to execute the EnableVolumeIO service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2EnableVolumeIORequest
 */
- (AWSTask *)enableVolumeIO:(AWSEC2EnableVolumeIORequest *)request;

/**
 EnableVpcClassicLink
 
 @param request A container for the necessary parameters to execute the EnableVpcClassicLink service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2EnableVpcClassicLinkResult`.
 
 @see AWSEC2EnableVpcClassicLinkRequest
 @see AWSEC2EnableVpcClassicLinkResult
 */
- (AWSTask *)enableVpcClassicLink:(AWSEC2EnableVpcClassicLinkRequest *)request;

/**
 <p>Gets the console output for the specified instance.</p><p>Instances do not have a physical monitor through which you can view their console output. They also lack physical controls that allow you to power up, reboot, or shut them down. To allow these actions, we provide them through the Amazon EC2 API and command line interface.</p><p>Instance console output is buffered and posted shortly after instance boot, reboot, and termination. Amazon EC2 preserves the most recent 64 KB output which is available for at least one hour after the most recent post.</p><p>For Linux/Unix instances, the instance console output displays the exact console output that would normally be displayed on a physical monitor attached to a machine. This output is buffered because the instance produces it and then posts it to a store where the instance's owner can retrieve it.</p><p>For Windows instances, the instance console output displays the last three system event log errors.</p>
 
 @param request A container for the necessary parameters to execute the GetConsoleOutput service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetConsoleOutputResult`.
 
 @see AWSEC2GetConsoleOutputRequest
 @see AWSEC2GetConsoleOutputResult
 */
- (AWSTask *)getConsoleOutput:(AWSEC2GetConsoleOutputRequest *)request;

/**
 <p>Retrieves the encrypted administrator password for an instance running Windows.</p><p>The Windows password is generated at boot if the <code>EC2Config</code> service plugin, <code>Ec2SetPassword</code>, is enabled. This usually only happens the first time an AMI is launched, and then <code>Ec2SetPassword</code> is automatically disabled. The password is not generated for rebundled AMIs unless <code>Ec2SetPassword</code> is enabled before bundling.</p><p>The password is encrypted using the key pair that you specified when you launched the instance. You must provide the corresponding key pair file.</p><p>Password generation and encryption takes a few moments. We recommend that you wait up to 15 minutes after launching an instance before trying to retrieve the generated password.</p>
 
 @param request A container for the necessary parameters to execute the GetPasswordData service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2GetPasswordDataResult`.
 
 @see AWSEC2GetPasswordDataRequest
 @see AWSEC2GetPasswordDataResult
 */
- (AWSTask *)getPasswordData:(AWSEC2GetPasswordDataRequest *)request;

/**
 <p>Creates an import instance task using metadata from the specified disk image. After importing the image, you then upload it using the <function>ec2-import-volume</function> command in the EC2 command line tools. For more information, see <ulink url="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UploadingYourInstancesandVolumes.html">Using the Command Line Tools to Import Your Virtual Machine to Amazon EC2</ulink> in the <emphasis>Amazon Elastic Compute Cloud User Guide for Linux</emphasis>.</p>
 
 @param request A container for the necessary parameters to execute the ImportInstance service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportInstanceResult`.
 
 @see AWSEC2ImportInstanceRequest
 @see AWSEC2ImportInstanceResult
 */
- (AWSTask *)importInstance:(AWSEC2ImportInstanceRequest *)request;

/**
 <p>Imports the public key from an RSA key pair that you created with a third-party tool. Compare this with <a>CreateKeyPair</a>, in which AWS creates the key pair and gives the keys to you (AWS keeps a copy of the public key). With ImportKeyPair, you create the key pair and give AWS just the public key. The private key is never transferred between you and AWS.</p><p>For more information about key pairs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the ImportKeyPair service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportKeyPairResult`.
 
 @see AWSEC2ImportKeyPairRequest
 @see AWSEC2ImportKeyPairResult
 */
- (AWSTask *)importKeyPair:(AWSEC2ImportKeyPairRequest *)request;

/**
 <p>Creates an import volume task using metadata from the specified disk image. After importing the image, you then upload it using the <function>ec2-import-volume</function> command in the Amazon EC2 command-line interface (CLI) tools. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UploadingYourInstancesandVolumes.html">Using the Command Line Tools to Import Your Virtual Machine to Amazon EC2</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the ImportVolume service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ImportVolumeResult`.
 
 @see AWSEC2ImportVolumeRequest
 @see AWSEC2ImportVolumeResult
 */
- (AWSTask *)importVolume:(AWSEC2ImportVolumeRequest *)request;

/**
 <p>Modifies the specified attribute of the specified AMI. You can specify only one attribute at a time.</p><note><p>AWS Marketplace product codes cannot be modified. Images with an AWS Marketplace product code cannot be made public.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyImageAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyImageAttributeRequest
 */
- (AWSTask *)modifyImageAttribute:(AWSEC2ModifyImageAttributeRequest *)request;

/**
 <p>Modifies the specified attribute of the specified instance. You can specify only one attribute at a time.</p><p>To modify some attributes, the instance must be stopped. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html">Modifying Attributes of a Stopped Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyInstanceAttributeRequest
 */
- (AWSTask *)modifyInstanceAttribute:(AWSEC2ModifyInstanceAttributeRequest *)request;

/**
 <p>Modifies the specified network interface attribute. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the ModifyNetworkInterfaceAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyNetworkInterfaceAttributeRequest
 */
- (AWSTask *)modifyNetworkInterfaceAttribute:(AWSEC2ModifyNetworkInterfaceAttributeRequest *)request;

/**
 <p>Modifies the Availability Zone, instance count, instance type, or network platform (EC2-Classic or EC2-VPC) of your Reserved Instances. The Reserved Instances to be modified must be identical, except for Availability Zone, network platform, and instance type.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying Reserved Instances</a> in the Amazon Elastic Compute Cloud User Guide for Linux.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReservedInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ModifyReservedInstancesResult`.
 
 @see AWSEC2ModifyReservedInstancesRequest
 @see AWSEC2ModifyReservedInstancesResult
 */
- (AWSTask *)modifyReservedInstances:(AWSEC2ModifyReservedInstancesRequest *)request;

/**
 <p>Adds or removes permission settings for the specified snapshot. You may add or remove specified AWS account IDs from a snapshot's list of create volume permissions, but you cannot do both in a single API call. If you need to both add and remove account IDs for a snapshot, you must use multiple API calls.</p><p>For more information on modifying snapshot permissions, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><note><p>Snapshots with AWS Marketplace product codes cannot be made public.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifySnapshotAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifySnapshotAttributeRequest
 */
- (AWSTask *)modifySnapshotAttribute:(AWSEC2ModifySnapshotAttributeRequest *)request;

/**
 <p>Modifies a subnet attribute.</p>
 
 @param request A container for the necessary parameters to execute the ModifySubnetAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifySubnetAttributeRequest
 */
- (AWSTask *)modifySubnetAttribute:(AWSEC2ModifySubnetAttributeRequest *)request;

/**
 <p>Modifies a volume attribute.</p><p>By default, all I/O operations for the volume are suspended when the data on the volume is determined to be potentially inconsistent, to prevent undetectable, latent data corruption. The I/O access to the volume can be resumed by first enabling I/O access and then checking the data consistency on your volume.</p><p>You can change the default behavior to resume I/O operations. We recommend that you change this only for boot volumes or for volumes that are stateless or disposable.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVolumeAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyVolumeAttributeRequest
 */
- (AWSTask *)modifyVolumeAttribute:(AWSEC2ModifyVolumeAttributeRequest *)request;

/**
 <p>Modifies the specified attribute of the specified VPC.</p>
 
 @param request A container for the necessary parameters to execute the ModifyVpcAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ModifyVpcAttributeRequest
 */
- (AWSTask *)modifyVpcAttribute:(AWSEC2ModifyVpcAttributeRequest *)request;

/**
 <p>Enables monitoring for a running instance. For more information about monitoring instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the MonitorInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2MonitorInstancesResult`.
 
 @see AWSEC2MonitorInstancesRequest
 @see AWSEC2MonitorInstancesResult
 */
- (AWSTask *)monitorInstances:(AWSEC2MonitorInstancesRequest *)request;

/**
 <p>Purchases a Reserved Instance for use with your account. With Amazon EC2 Reserved Instances, you obtain a capacity reservation for a certain instance configuration over a specified period of time. You pay a lower usage rate than with On-Demand instances for the time that you actually use the capacity reservation.</p><p>Use <a>DescribeReservedInstancesOfferings</a> to get a list of Reserved Instance offerings that match your specifications. After you've purchased a Reserved Instance, you can check for your new Reserved Instance with <a>DescribeReservedInstances</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html">Reserved Instances</a> and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html">Reserved Instance Marketplace</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedInstancesOffering service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2PurchaseReservedInstancesOfferingResult`.
 
 @see AWSEC2PurchaseReservedInstancesOfferingRequest
 @see AWSEC2PurchaseReservedInstancesOfferingResult
 */
- (AWSTask *)purchaseReservedInstancesOffering:(AWSEC2PurchaseReservedInstancesOfferingRequest *)request;

/**
 <p>Requests a reboot of one or more instances. This operation is asynchronous; it only queues a request to reboot the specified instances. The operation succeeds if the instances are valid and belong to you. Requests to reboot terminated instances are ignored.</p><p>If a Linux/Unix instance does not cleanly shut down within four minutes, Amazon EC2 performs a hard reboot.</p><p>For more information about troubleshooting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html">Getting Console Output and Rebooting Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the RebootInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2RebootInstancesRequest
 */
- (AWSTask *)rebootInstances:(AWSEC2RebootInstancesRequest *)request;

/**
 <p>Registers an AMI. When you're creating an AMI, this is the final step you must complete before you can launch an instance from the AMI. For more information about creating AMIs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami.html">Creating Your Own AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><note><p>For Amazon EBS-backed instances, <a>CreateImage</a> creates and registers the AMI in a single request, so you don't have to register the AMI yourself.</p></note><p>You can also use <code>RegisterImage</code> to create an Amazon EBS-backed AMI from a snapshot of a root device volume. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_LaunchingInstanceFromSnapshot.html">Launching an Instance from a Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>If needed, you can deregister an AMI at any time. Any modifications you make to an AMI backed by an instance store volume invalidates its registration. If you make changes to an image, deregister the previous image and register the new image.</p><note><p>You can't register an image where a secondary (non-root) snapshot has AWS Marketplace product codes.</p></note>
 
 @param request A container for the necessary parameters to execute the RegisterImage service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RegisterImageResult`.
 
 @see AWSEC2RegisterImageRequest
 @see AWSEC2RegisterImageResult
 */
- (AWSTask *)registerImage:(AWSEC2RegisterImageRequest *)request;

/**
 <p>Rejects a VPC peering connection request. The VPC peering connection must be in the <code>pending-acceptance</code> state. Use the <a>DescribeVpcPeeringConnections</a> request to view your outstanding VPC peering connection requests. To delete an active VPC peering connection, or to delete a VPC peering connection request that you initiated, use <a>DeleteVpcPeeringConnection</a>.</p>
 
 @param request A container for the necessary parameters to execute the RejectVpcPeeringConnection service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RejectVpcPeeringConnectionResult`.
 
 @see AWSEC2RejectVpcPeeringConnectionRequest
 @see AWSEC2RejectVpcPeeringConnectionResult
 */
- (AWSTask *)rejectVpcPeeringConnection:(AWSEC2RejectVpcPeeringConnectionRequest *)request;

/**
 <p>Releases the specified Elastic IP address.</p><p>After releasing an Elastic IP address, it is released to the IP address pool and might be unavailable to you. Be sure to update your DNS records and any servers or devices that communicate with the address. If you attempt to release an Elastic IP address that you already released, you'll get an <code>AuthFailure</code> error if the address is already allocated to another AWS account.</p><p>[EC2-Classic, default VPC] Releasing an Elastic IP address automatically disassociates it from any instance that it's associated with. To disassociate an Elastic IP address without releasing it, use <a>DisassociateAddress</a>.</p><p>[Nondefault VPC] You must use <a>DisassociateAddress</a> to disassociate the Elastic IP address before you try to release it. Otherwise, Amazon EC2 returns an error (<code>InvalidIPAddress.InUse</code>).</p>
 
 @param request A container for the necessary parameters to execute the ReleaseAddress service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ReleaseAddressRequest
 */
- (AWSTask *)releaseAddress:(AWSEC2ReleaseAddressRequest *)request;

/**
 <p>Changes which network ACL a subnet is associated with. By default when you create a subnet, it's automatically associated with the default network ACL. For more information about network ACLs, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceNetworkAclAssociation service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplaceNetworkAclAssociationResult`.
 
 @see AWSEC2ReplaceNetworkAclAssociationRequest
 @see AWSEC2ReplaceNetworkAclAssociationResult
 */
- (AWSTask *)replaceNetworkAclAssociation:(AWSEC2ReplaceNetworkAclAssociationRequest *)request;

/**
 <p>Replaces an entry (rule) in a network ACL. For more information about network ACLs, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_ACLs.html">Network ACLs</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceNetworkAclEntry service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ReplaceNetworkAclEntryRequest
 */
- (AWSTask *)replaceNetworkAclEntry:(AWSEC2ReplaceNetworkAclEntryRequest *)request;

/**
 <p>Replaces an existing route within a route table in a VPC. You must provide only one of the following: Internet gateway or virtual private gateway, NAT instance, VPC peering connection, or network interface.</p><p>For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceRoute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ReplaceRouteRequest
 */
- (AWSTask *)replaceRoute:(AWSEC2ReplaceRouteRequest *)request;

/**
 <p>Changes the route table associated with a given subnet in a VPC. After the operation completes, the subnet uses the routes in the new route table it's associated with. For more information about route tables, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html">Route Tables</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>You can also use ReplaceRouteTableAssociation to change which table is the main route table in the VPC. You just specify the main route table's association ID and the route table to be the new main route table.</p>
 
 @param request A container for the necessary parameters to execute the ReplaceRouteTableAssociation service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplaceRouteTableAssociationResult`.
 
 @see AWSEC2ReplaceRouteTableAssociationRequest
 @see AWSEC2ReplaceRouteTableAssociationResult
 */
- (AWSTask *)replaceRouteTableAssociation:(AWSEC2ReplaceRouteTableAssociationRequest *)request;

/**
 <p>Initiates the copy of an AMI from the specified source region to the region in which the request was made. You specify the destination region by using its endpoint when making the request. AMIs that use encrypted Amazon EBS snapshots cannot be copied with this method.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html">Copying AMIs</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplicateImage service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplicateImageResult`.
 
 @see AWSEC2ReplicateImageRequest
 @see AWSEC2ReplicateImageResult
 */
- (AWSTask *)replicateImage:(AWSEC2ReplicateImageRequest *)request;

/**
 <p>Copies a point-in-time snapshot of an Amazon EBS volume and stores it in Amazon S3. You can copy the snapshot within the same region or from one region to another. You can use the snapshot to create Amazon EBS volumes or Amazon Machine Images (AMIs). The snapshot is copied to the regional endpoint that you send the HTTP request to.</p><p>Copies of encrypted Amazon EBS snapshots remain encrypted. Copies of unencrypted snapshots remain unencrypted.</p><note><p>Copying snapshots that were encrypted with non-default AWS Key Management Service (KMS) master keys is not supported at this time. </p></note><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html">Copying an Amazon EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the ReplicateSnapshot service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2ReplicateSnapshotResult`.
 
 @see AWSEC2ReplicateSnapshotRequest
 @see AWSEC2ReplicateSnapshotResult
 */
- (AWSTask *)replicateSnapshot:(AWSEC2ReplicateSnapshotRequest *)request;

/**
 <p>Submits feedback about the status of an instance. The instance must be in the <code>running</code> state. If your experience with the instance differs from the instance status returned by <a>DescribeInstanceStatus</a>, use <a>ReportInstanceStatus</a> to report your experience with the instance. Amazon EC2 collects this information to improve the accuracy of status checks.</p><p>Use of this action does not change the value returned by <a>DescribeInstanceStatus</a>.</p>
 
 @param request A container for the necessary parameters to execute the ReportInstanceStatus service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ReportInstanceStatusRequest
 */
- (AWSTask *)reportInstanceStatus:(AWSEC2ReportInstanceStatusRequest *)request;

/**
 <p>Creates a Spot Instance request. Spot Instances are instances that Amazon EC2 starts on your behalf when the maximum price that you specify exceeds the current Spot Price. Amazon EC2 periodically sets the Spot Price based on available Spot Instance capacity and current Spot Instance requests. For more information about Spot Instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html">Spot Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>Users must be subscribed to the required product to run an instance with AWS Marketplace product codes.</p>
 
 @param request A container for the necessary parameters to execute the RequestSpotInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2RequestSpotInstancesResult`.
 
 @see AWSEC2RequestSpotInstancesRequest
 @see AWSEC2RequestSpotInstancesResult
 */
- (AWSTask *)requestSpotInstances:(AWSEC2RequestSpotInstancesRequest *)request;

/**
 <p>Resets an attribute of an AMI to its default value.</p>
 
 @param request A container for the necessary parameters to execute the ResetImageAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ResetImageAttributeRequest
 */
- (AWSTask *)resetImageAttribute:(AWSEC2ResetImageAttributeRequest *)request;

/**
 <p>Resets an attribute of an instance to its default value. To reset the <code>kernel</code> or <code>ramdisk</code>, the instance must be in a stopped state. To reset the <code>SourceDestCheck</code>, the instance can be either running or stopped.</p><p>The <code>SourceDestCheck</code> attribute controls whether source/destination checking is enabled. The default value is <code>true</code>, which means checking is enabled. This value must be <code>false</code> for a NAT instance to perform NAT. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResetInstanceAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ResetInstanceAttributeRequest
 */
- (AWSTask *)resetInstanceAttribute:(AWSEC2ResetInstanceAttributeRequest *)request;

/**
 <p>Resets a network interface attribute. You can specify only one attribute at a time.</p>
 
 @param request A container for the necessary parameters to execute the ResetNetworkInterfaceAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ResetNetworkInterfaceAttributeRequest
 */
- (AWSTask *)resetNetworkInterfaceAttribute:(AWSEC2ResetNetworkInterfaceAttributeRequest *)request;

/**
 <p>Resets permission settings for the specified snapshot.</p><p>For more information on modifying snapshot permissions, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html">Sharing Snapshots</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResetSnapshotAttribute service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2ResetSnapshotAttributeRequest
 */
- (AWSTask *)resetSnapshotAttribute:(AWSEC2ResetSnapshotAttributeRequest *)request;

/**
 <p>Removes one or more egress rules from a security group for EC2-VPC. The values that you specify in the revoke request (for example, ports) must match the existing rule's values for the rule to be revoked.</p><p>Each rule consists of the protocol and the CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSecurityGroupEgress service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2RevokeSecurityGroupEgressRequest
 */
- (AWSTask *)revokeSecurityGroupEgress:(AWSEC2RevokeSecurityGroupEgressRequest *)request;

/**
 <p>Removes one or more ingress rules from a security group. The values that you specify in the revoke request (for example, ports) must match the existing rule's values for the rule to be removed.</p><p>Each rule consists of the protocol and the CIDR range or source security group. For the TCP and UDP protocols, you must also specify the destination port or range of ports. For the ICMP protocol, you must also specify the ICMP type and code.</p><p>Rule changes are propagated to instances within the security group as quickly as possible. However, a small delay might occur.</p>
 
 @param request A container for the necessary parameters to execute the RevokeSecurityGroupIngress service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2RevokeSecurityGroupIngressRequest
 */
- (AWSTask *)revokeSecurityGroupIngress:(AWSEC2RevokeSecurityGroupIngressRequest *)request;

/**
 <p>Launches the specified number of instances using an AMI for which you have permissions.</p><p>When you launch an instance, it enters the <code>pending</code> state. After the instance is ready for you, it enters the <code>running</code> state. To check the state of your instance, call <a>DescribeInstances</a>.</p><p>If you don't specify a security group when launching an instance, Amazon EC2 uses the default security group. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>Linux instances have access to the public key of the key pair at boot. You can use this key to provide secure access to the instance. Amazon EC2 public images use this feature to provide secure access without passwords. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>You can provide optional user data when launching an instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html">Instance Metadata</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>If any of the AMIs have a product code attached for which the user has not subscribed, <code>RunInstances</code> fails.</p><p>T2 instance types can only be launched into a VPC. If you do not have a default VPC, or if you do not specify a subnet ID in the request, <code>RunInstances</code> fails.</p><p>For more information about troubleshooting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_InstanceStraightToTerminated.html">What To Do If An Instance Immediately Terminates</a>, and <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html">Troubleshooting Connecting to Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the RunInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2Reservation`.
 
 @see AWSEC2RunInstancesRequest
 @see AWSEC2Reservation
 */
- (AWSTask *)runInstances:(AWSEC2RunInstancesRequest *)request;

/**
 <p>Starts an Amazon EBS-backed AMI that you've previously stopped.</p><p>Instances that use Amazon EBS volumes as their root devices can be quickly stopped and started. When an instance is stopped, the compute resources are released and you are not billed for hourly instance usage. However, your root partition Amazon EBS volume remains, continues to persist your data, and you are charged for Amazon EBS volume usage. You can restart your instance at any time. Each time you transition an instance from stopped to started, Amazon EC2 charges a full instance hour, even if transitions happen multiple times within a single hour.</p><p>Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM.</p><p>Performing this operation on an instance that uses an instance store as its root device returns an error.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Stop_Start.html">Stopping Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2StartInstancesResult`.
 
 @see AWSEC2StartInstancesRequest
 @see AWSEC2StartInstancesResult
 */
- (AWSTask *)startInstances:(AWSEC2StartInstancesRequest *)request;

/**
 <p>Stops an Amazon EBS-backed instance. Each time you transition an instance from stopped to started, Amazon EC2 charges a full instance hour, even if transitions happen multiple times within a single hour.</p><p>You can't start or stop Spot Instances.</p><p>Instances that use Amazon EBS volumes as their root devices can be quickly stopped and started. When an instance is stopped, the compute resources are released and you are not billed for hourly instance usage. However, your root partition Amazon EBS volume remains, continues to persist your data, and you are charged for Amazon EBS volume usage. You can restart your instance at any time.</p><p>Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an instance does not preserve data stored in RAM.</p><p>Performing this operation on an instance that uses an instance store as its root device returns an error.</p><p>You can stop, start, and terminate EBS-backed instances. You can only terminate instance store-backed instances. What happens to an instance differs if you stop it or terminate it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, the root device and any other devices attached during the instance launch are automatically deleted. For more information about the differences between stopping and terminating instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>For more information about troubleshooting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesStopping.html">Troubleshooting Stopping Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2StopInstancesResult`.
 
 @see AWSEC2StopInstancesRequest
 @see AWSEC2StopInstancesResult
 */
- (AWSTask *)stopInstances:(AWSEC2StopInstancesRequest *)request;

/**
 <p>Shuts down one or more instances. This operation is idempotent; if you terminate an instance more than once, each call succeeds.</p><p>Terminated instances remain visible after termination (for approximately one hour).</p><p>By default, Amazon EC2 deletes all Amazon EBS volumes that were attached when the instance launched. Volumes attached after instance launch continue running.</p><p>You can stop, start, and terminate EBS-backed instances. You can only terminate instance store-backed instances. What happens to an instance differs if you stop it or terminate it. For example, when you stop an instance, the root device and any other devices attached to the instance persist. When you terminate an instance, the root device and any other devices attached during the instance launch are automatically deleted. For more information about the differences between stopping and terminating instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html">Instance Lifecycle</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p><p>For more information about troubleshooting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesShuttingDown.html">Troubleshooting Terminating Your Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the TerminateInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2TerminateInstancesResult`.
 
 @see AWSEC2TerminateInstancesRequest
 @see AWSEC2TerminateInstancesResult
 */
- (AWSTask *)terminateInstances:(AWSEC2TerminateInstancesRequest *)request;

/**
 <p>Unassigns one or more secondary private IP addresses from a network interface.</p>
 
 @param request A container for the necessary parameters to execute the UnassignPrivateIpAddresses service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSEC2UnassignPrivateIpAddressesRequest
 */
- (AWSTask *)unassignPrivateIpAddresses:(AWSEC2UnassignPrivateIpAddressesRequest *)request;

/**
 <p>Disables monitoring for a running instance. For more information about monitoring instances, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html">Monitoring Your Instances and Volumes</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux</i>.</p>
 
 @param request A container for the necessary parameters to execute the UnmonitorInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEC2UnmonitorInstancesResult`.
 
 @see AWSEC2UnmonitorInstancesRequest
 @see AWSEC2UnmonitorInstancesResult
 */
- (AWSTask *)unmonitorInstances:(AWSEC2UnmonitorInstancesRequest *)request;

@end

NS_ASSUME_NONNULL_END
