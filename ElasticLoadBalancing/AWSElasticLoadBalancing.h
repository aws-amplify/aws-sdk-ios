/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSService.h"
#import "AWSElasticLoadBalancingModel.h"

@class BFTask;

/**
 * <fullname>Elastic Load Balancing</fullname><p> Elastic Load Balancing is a cost-effective and easy to use web service to help you improve the availability and scalability of your application running on Amazon Elastic Cloud Compute (Amazon EC2). It makes it easy for you to distribute application loads between two or more EC2 instances. Elastic Load Balancing supports the growth in traffic of your application by enabling availability through redundancy. </p><p>This guide provides detailed information about Elastic Load Balancingactions, data types, and parameters that can be used for sending aquery request. Query requests are HTTP or HTTPS requests that use theHTTP verb GET or POST and a query parameter named Action or Operation.Action is used throughout this documentation, although Operation issupported for backward compatibility with other AWS Query APIs.</p><p>For detailed information on constructing a query request using the actions, data types, and parameters mentioned in this guide, go to <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/using-query-api.html">Using the Query API</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p><p>For detailed information about Elastic Load Balancing features and their associated actions, go to<a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/UserScenarios.html">Using Elastic Load Balancing</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p><p>This reference guide is based on the current WSDL, which is available at: <a href="http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.wsdl"></a></p><p><b>Endpoints</b></p><p>The examples in this guide assume that your load balancers are created in the US East (Northern Virginia) region and use us-east-1 as the endpoint.</p><p>You can create your load balancers in other AWS regions. For information about regions and endpoints supported by Elastic Load Balancing, see<a href="http://docs.aws.amazon.com/general/latest/gr/index.html?rande.html">Regions and Endpoints</a>in the Amazon Web Services General Reference. </p>
 */
@interface AWSElasticLoadBalancing : AWSService

@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;
@property (nonatomic, strong, readonly) AWSEndpoint *endpoint;

+ (instancetype)defaultElasticLoadBalancing;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

/**
 * <p> Associates one or more security groups with your load balancer in Amazon Virtual Private Cloud (Amazon VPC).The provided security group IDs will override any currently applied security groups. </p><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/USVPC_ApplySG.html">Manage Security Groups in Amazon VPC</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p>
 *
 * @param request A container for the necessary parameters to execute the ApplySecurityGroupsToLoadBalancer service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest, AWSElasticLoadBalancingErrorInvalidSecurityGroup.
 *
 * @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput
 * @see AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput
 */
- (BFTask *)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request;

/**
 * <p> Adds one or more subnets to the set of configured subnets in the Amazon Virtual Private Cloud (Amazon VPC) for the load balancer. </p><p> The load balancers evenly distribute requests across all of the registered subnets.For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/UserScenariosForVPC.html">Deploy Elastic Load Balancing in Amazon VPC</a> in the <i>Elastic Load Balancing Developer Guide</i>. </p> 
 *
 * @param request A container for the necessary parameters to execute the AttachLoadBalancerToSubnets service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest, AWSElasticLoadBalancingErrorSubnetNotFound, AWSElasticLoadBalancingErrorInvalidSubnet.
 *
 * @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput
 * @see AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput
 */
- (BFTask *)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request;

/**
 * <p> Specifies the health check settings to use for evaluating the health state of your back-end instances. </p><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/TerminologyandKeyConcepts.html#healthcheck">Health Check</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p> 
 *
 * @param request A container for the necessary parameters to execute the ConfigureHealthCheck service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingConfigureHealthCheckOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound.
 *
 * @see AWSElasticLoadBalancingConfigureHealthCheckInput
 * @see AWSElasticLoadBalancingConfigureHealthCheckOutput
 */
- (BFTask *)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request;

/**
 * <p> Generates a stickiness policy with sticky session lifetimes that followthat of an application-generated cookie. This policy can be associated only with HTTP/HTTPS listeners. </p><p> This policy is similar to the policy created by <a>CreateLBCookieStickinessPolicy</a>,except that the lifetime of the special Elastic Load Balancing cookie follows the lifetime of the application-generated cookie specified in the policy configuration.The load balancer only inserts a new stickiness cookie when the application response includes a new application cookie.</p><p> If the application cookie is explicitly removed or expires, the session stops being sticky until a new application cookie is issued.</p><note> An application client must receive and send two cookies: the application-generatedcookie and the special Elastic Load Balancing cookie named <code>AWSELB</code>.This is the default behavior for many common web browsers. </note><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/US_StickySessions.html#US_EnableStickySessionsAppCookies">Enabling Application-Controlled Session Stickiness</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p> 
 *
 * @param request A container for the necessary parameters to execute the CreateAppCookieStickinessPolicy service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorDuplicatePolicyName, AWSElasticLoadBalancingErrorTooManyPolicies, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput
 * @see AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput
 */
- (BFTask *)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request;

/**
 * <p> Generates a stickiness policy with sticky session lifetimes controlled by thelifetime of the browser (user-agent) or a specified expiration period. Thispolicy can be associated only with HTTP/HTTPS listeners. </p><p> When a load balancer implements this policy, the load balancer uses a special cookie to track the backend server instance for each request. When the load balancer receives a request, it first checks to see if this cookie is present in the request.If so, the load balancer sends the request to the application server specified in the cookie. If not, the load balancer sends the request to a server that is chosen based on the existing load balancing algorithm. </p><p> A cookie is inserted into the response for binding subsequent requests from the same user to that server. The validity of the cookie is based on the cookie expiration time, which isspecified in the policy configuration.</p><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/US_StickySessions.html#US_EnableStickySessionsLBCookies">Enabling Duration-Based Session Stickiness</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p> 
 *
 * @param request A container for the necessary parameters to execute the CreateLBCookieStickinessPolicy service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorDuplicatePolicyName, AWSElasticLoadBalancingErrorTooManyPolicies, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput
 * @see AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput
 */
- (BFTask *)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request;

/**
 * <p> Creates a new load balancer. </p><p> After the call has completed successfully, a new load balancer is created with a unique Domain Name Service (DNS) name. The DNSname includes the name of the AWS region in which the load balancewas created. For example, if your load balancer was created in the United States, the DNS name might end with either of the following:</p><ul><li><i>us-east-1.elb.amazonaws.com</i> (for the Northern Virginia Region) </li><li><i>us-west-1.elb.amazonaws.com</i> (for the Northern California Region) </li></ul><p>For information about the AWS regions supported by Elastic Load Balancing,see <a href="http://docs.aws.amazon.com/general/latest/gr/rande.html#elb_region">Regions and Endpoints</a>.</p><p>You can create up to 20 load balancers per region per account.</p><p>Elastic Load Balancing supports load balancing your Amazon EC2 instances launched within any one of the following platforms:</p><ul><li><i>EC2-Classic</i><p>For information on creating and managing your load balancers in EC2-Classic,see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/UserScenariosForEC2.html">Deploy Elastic Load Balancing in Amazon EC2-Classic</a>.</p></li><li><i>EC2-VPC</i><p>For information on creating and managing your load balancers in EC2-VPC,see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/UserScenariosForVPC.html">Deploy Elastic Load Balancing in Amazon VPC</a>.</p></li></ul> 
 *
 * @param request A container for the necessary parameters to execute the CreateLoadBalancer service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingCreateAccessPointOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorDuplicateAccessPointName, AWSElasticLoadBalancingErrorTooManyAccessPoints, AWSElasticLoadBalancingErrorCertificateNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest, AWSElasticLoadBalancingErrorSubnetNotFound, AWSElasticLoadBalancingErrorInvalidSubnet, AWSElasticLoadBalancingErrorInvalidSecurityGroup, AWSElasticLoadBalancingErrorInvalidScheme.
 *
 * @see AWSElasticLoadBalancingCreateAccessPointInput
 * @see AWSElasticLoadBalancingCreateAccessPointOutput
 */
- (BFTask *)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request;

/**
 * <p> Creates one or more listeners on a load balancer for the specified port.If a listener with the given port does not already exist, it will be created;otherwise, the properties of the new listener must match the propertiesof the existing listener.</p><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/us-add-listener.html">Add a Listener to Your Load Balancer</a>in the <i>Elastic Load Balancing Developer Guide</i>.</p>
 *
 * @param request A container for the necessary parameters to execute the CreateLoadBalancerListeners service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingCreateLoadBalancerListenerOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorDuplicateListener, AWSElasticLoadBalancingErrorCertificateNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingCreateLoadBalancerListenerInput
 * @see AWSElasticLoadBalancingCreateLoadBalancerListenerOutput
 */
- (BFTask *)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request;

/**
 * <p>	Creates a new policy that contains the necessary attributes depending on the policy type.	Policies are settings that are saved for your load balancer and that can be applied to the	front-end listener, or the back-end application server, depending on your policy type.	</p>
 *
 * @param request A container for the necessary parameters to execute the CreateLoadBalancerPolicy service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorPolicyTypeNotFound, AWSElasticLoadBalancingErrorDuplicatePolicyName, AWSElasticLoadBalancingErrorTooManyPolicies, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingCreateLoadBalancerPolicyInput
 * @see AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput
 */
- (BFTask *)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request;

/**
 * <p> Deletes the specified load balancer. </p><p> If attempting to recreate the load balancer, you must reconfigure all the settings. The DNS name associated with a deleted load balancer will no longer be usable. Once deleted, the name and associated DNS record of the load balancer no longer exist and traffic sent to any of its IP addresses will no longer be delivered to back-end instances. </p><p> To successfully call this API, you must provide the same account credentials as were used to create the load balancer. </p><note> By design, if the load balancer does not exist or has already been deleted, a call to <code>DeleteLoadBalancer</code> action still succeeds. </note>
 *
 * @param request A container for the necessary parameters to execute the DeleteLoadBalancer service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingDeleteAccessPointOutput.
 *
 * @see AWSElasticLoadBalancingDeleteAccessPointInput
 * @see AWSElasticLoadBalancingDeleteAccessPointOutput
 */
- (BFTask *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request;

/**
 * <p> Deletes listeners from the load balancer for the specified port. </p>
 *
 * @param request A container for the necessary parameters to execute the DeleteLoadBalancerListeners service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound.
 *
 * @see AWSElasticLoadBalancingDeleteLoadBalancerListenerInput
 * @see AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput
 */
- (BFTask *)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request;

/**
 * <p> Deletes a policy from the load balancer.The specified policy must not be enabled for any listeners. </p>
 *
 * @param request A container for the necessary parameters to execute the DeleteLoadBalancerPolicy service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput
 * @see AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput
 */
- (BFTask *)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request;

/**
 * <p> Deregisters instances from the load balancer. Once the instance is deregistered, it will stop receiving traffic from the load balancer.</p><p> In order to successfully call this API, the same account credentials as those used to create the load balancer must be provided. </p><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/US_DeReg_Reg_Instances.html">De-register and Register Amazon EC2 Instances</a>in the <i>Elastic Load Balancing Developer Guide</i>.</p><p>You can use <a>DescribeLoadBalancers</a> to verify if the instance is deregistered from the load balancer.</p> 
 *
 * @param request A container for the necessary parameters to execute the DeregisterInstancesFromLoadBalancer service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingDeregisterEndPointsOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorInvalidEndPoint.
 *
 * @see AWSElasticLoadBalancingDeregisterEndPointsInput
 * @see AWSElasticLoadBalancingDeregisterEndPointsOutput
 */
- (BFTask *)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request;

/**
 * <p> Returns the current state of the specified instances registered with the specified load balancer. If no instances are specified, the state of all the instances registered with the load balancer is returned. </p><note>You must provide the same account credentials as those that were used to create the load balancer. </note> 
 *
 * @param request A container for the necessary parameters to execute the DescribeInstanceHealth service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingDescribeEndPointStateOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorInvalidEndPoint.
 *
 * @see AWSElasticLoadBalancingDescribeEndPointStateInput
 * @see AWSElasticLoadBalancingDescribeEndPointStateOutput
 */
- (BFTask *)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request;

/**
 * <p>Returns detailed information about all of the attributes associated with the specified load balancer.</p> 
 *
 * @param request A container for the necessary parameters to execute the DescribeLoadBalancerAttributes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound.
 *
 * @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput
 * @see AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput
 */
- (BFTask *)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request;

/**
 * <p>Returns detailed descriptions of the policies.If you specify a load balancer name, the action returns the descriptions of all the policies created for the load balancer.If you specify a policy name associated with your load balancer, the action returns the description of that policy. If you don't specify a load balancer name, the action returns descriptions of the specified sample policies, or descriptions of all the sample policies.The names of the sample policies have the <code>ELBSample-</code> prefix.</p>
 *
 * @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicies service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorPolicyNotFound.
 *
 * @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput
 * @see AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput
 */
- (BFTask *)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request;

/**
 * <p>	Returns meta-information on the specified load balancer policies defined by the	Elastic Load Balancing service.The policy types that are	returned from this action can be used in a <a>CreateLoadBalancerPolicy</a> action to	instantiate specific policy configurations that will be applied to a load balancer.	</p>
 *
 * @param request A container for the necessary parameters to execute the DescribeLoadBalancerPolicyTypes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorPolicyTypeNotFound.
 *
 * @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput
 * @see AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput
 */
- (BFTask *)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request;

/**
 * <p> Returns detailed configuration information for all the load balancers created for the account. If you specify load balancer names, the action returns configuration information of the specified load balancers. </p><note> In order to retrieve this information, you must provide the same account credentialsthat was used to create the load balancer.</note> 
 *
 * @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingDescribeAccessPointsOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound.
 *
 * @see AWSElasticLoadBalancingDescribeAccessPointsInput
 * @see AWSElasticLoadBalancingDescribeAccessPointsOutput
 */
- (BFTask *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request;

/**
 * <p> Removes subnets from the set of configured subnets in the Amazon Virtual Private Cloud (Amazon VPC) for the load balancer. </p><p> After a subnet is removed all of the EC2 instances registered with the load balancer that arein the removed subnet will go into the <i>OutOfService</i> state. When a subnet is removed, the load balancer will balance the traffic among the remaining routable subnets for the load balancer. </p> 
 *
 * @param request A container for the necessary parameters to execute the DetachLoadBalancerFromSubnets service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput
 * @see AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput
 */
- (BFTask *)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request;

/**
 * <p> Removes the specified EC2 Availability Zones from the set of configured Availability Zones for the load balancer. </p><p> There must be at least one Availability Zone registered with a load balancer at all times.Once an Availability Zone is removed, all the instances registered with the load balancer that are in the removed Availability Zone go into the <i>OutOfService</i> state. Upon Availability Zone removal, the load balancer attempts to equally balance the traffic among its remaining usable Availability Zones. Trying to remove an Availability Zone that was not associated with the load balancer does nothing. </p><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/US_ShrinkLBApp04.html">Disable an Availability Zone from a Load-Balanced Application</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p> 
 *
 * @param request A container for the necessary parameters to execute the DisableAvailabilityZonesForLoadBalancer service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingRemoveAvailabilityZonesOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingRemoveAvailabilityZonesInput
 * @see AWSElasticLoadBalancingRemoveAvailabilityZonesOutput
 */
- (BFTask *)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request;

/**
 * <p> Adds one or more EC2 Availability Zones to the load balancer. </p><p> The load balancer evenly distributes requests across all its registered Availability Zones that contain instances. </p><note> The new EC2 Availability Zones to be added must be in the same EC2 Region as the Availability Zones for which the load balancer was created. </note><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/US_AddLBAvailabilityZone.html">Expand a Load Balanced Application to an Additional Availability Zone</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p> 
 *
 * @param request A container for the necessary parameters to execute the EnableAvailabilityZonesForLoadBalancer service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingAddAvailabilityZonesOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound.
 *
 * @see AWSElasticLoadBalancingAddAvailabilityZonesInput
 * @see AWSElasticLoadBalancingAddAvailabilityZonesOutput
 */
- (BFTask *)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request;

/**
 * <p>Modifies the attributes of a specified load balancer.</p><p>You can modify the load balancer attributes, such as <code>AccessLogs</code>, <code>ConnectionDraining</code>, and<code>CrossZoneLoadBalancing</code> by either enabling or disabling them.</p><p>For information on cross-zone load balancing, see <b>Request Routing</b> and for information on connection draining, see <b>Connection Draining</b>in the <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/TerminologyandKeyConcepts.html">Concepts</a> section of the<i>Elastic Load Balancer Developer Guide</i>. For information on access logs, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/access-log-collection.html">Access Logs</a>.</p>
 *
 * @param request A container for the necessary parameters to execute the ModifyLoadBalancerAttributes service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingModifyLoadBalancerAttributesInput
 * @see AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput
 */
- (BFTask *)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request;

/**
 * <p> Adds new instances to the load balancer. </p><p> Once the instance is registered, it starts receiving traffic and requests from the load balancer. Any instance that is not in any of the Availability Zones registered for the load balancer will be moved to the <i>OutOfService</i> state. It will move to the <i>InService</i> state when the Availability Zone is added to the load balancer. </p><p>When an instance registered with a load balancer is stopped and then restarted,the IP addresses associated with the instance changes. Elastic Load Balancingcannot recognize the new IP address, which prevents it from routing traffic to the instances. We recommend that you de-register your Amazon EC2 instances from your load balancer after you stop your instance, and then register the loadbalancer with your instance after you've restarted. To de-register your instancesfrom load balancer, use <a>DeregisterInstancesFromLoadBalancer</a> action.</p><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/US_DeReg_Reg_Instances.html">De-register and Register Amazon EC2 Instances</a>in the <i>Elastic Load Balancing Developer Guide</i>.</p><note> In order for this call to be successful, you must provide the sameaccount credentials as those that were used to create the load balancer. </note><note> Completion of this API does not guarantee that operation has completed. Rather, it means that the request has been registered and the changes will happen shortly. </note><p>You can use <a>DescribeLoadBalancers</a> or <a>DescribeInstanceHealth</a> action to check the state of the newly registered instances.</p> 
 *
 * @param request A container for the necessary parameters to execute the RegisterInstancesWithLoadBalancer service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingRegisterEndPointsOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorInvalidEndPoint.
 *
 * @see AWSElasticLoadBalancingRegisterEndPointsInput
 * @see AWSElasticLoadBalancingRegisterEndPointsOutput
 */
- (BFTask *)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request;

/**
 * <p> Sets the certificate that terminates the specified listener's SSL connections.The specified certificate replaces any prior certificate that was used on the same load balancer and port.</p><p>For more information on updating your SSL certificate, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/US_UpdatingLoadBalancerSSL.html">Updating an SSL Certificate for a Load Balancer</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p>
 *
 * @param request A container for the necessary parameters to execute the SetLoadBalancerListenerSSLCertificate service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorCertificateNotFound, AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorListenerNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput
 * @see AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput
 */
- (BFTask *)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request;

/**
 * <p> Replaces the current set of policies associated with a port on which the back-end server is listening with a new set of policies. After the policies have been created using <a>CreateLoadBalancerPolicy</a>,they can be applied here as a list. At this time, only the back-end server authentication policy type can be applied to the back-end ports; this policy type is composed of multiple public key policies. </p><note><p>The <i>SetLoadBalancerPoliciesForBackendServer</i> replaces the current set of policies associated with the specified instance port.Every time you use this action to enable the policies, use the <code>PolicyNames</code> parameter to list all the policies you want to enable.</p></note><p>You can use <a>DescribeLoadBalancers</a> or <a>DescribeLoadBalancerPolicies</a> action to verify that the policy has been associated with the back-end server.</p>
 *
 * @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesForBackendServer service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorPolicyNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput
 * @see AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput
 */
- (BFTask *)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request;

/**
 * <p> Associates, updates, or disables a policy with a listener on the load balancer.You can associate multiple policies with a listener.</p> 
 *
 * @param request A container for the necessary parameters to execute the SetLoadBalancerPoliciesOfListener service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput. On failed execution, task.error may contain an NSError with AWSElasticLoadBalancingErrorDomain domian and the following error code: AWSElasticLoadBalancingErrorAccessPointNotFound, AWSElasticLoadBalancingErrorPolicyNotFound, AWSElasticLoadBalancingErrorListenerNotFound, AWSElasticLoadBalancingErrorInvalidConfigurationRequest.
 *
 * @see AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput
 * @see AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput
 */
- (BFTask *)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request;

@end
