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
 * 
 */
@interface AWSElasticLoadBalancing : AWSService

@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

+ (instancetype)defaultElasticLoadBalancing;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

- (BFTask *)addTags:(AWSElasticLoadBalancingAddTagsInput *)request;

- (BFTask *)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request;

- (BFTask *)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request;

- (BFTask *)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request;

- (BFTask *)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request;

- (BFTask *)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request;

- (BFTask *)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request;

- (BFTask *)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request;

- (BFTask *)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request;

- (BFTask *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request;

- (BFTask *)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request;

- (BFTask *)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request;

- (BFTask *)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request;

- (BFTask *)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request;

- (BFTask *)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request;

- (BFTask *)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request;

- (BFTask *)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request;

- (BFTask *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request;

- (BFTask *)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request;

- (BFTask *)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request;

- (BFTask *)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request;

- (BFTask *)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request;

- (BFTask *)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request;

- (BFTask *)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request;

- (BFTask *)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request;

- (BFTask *)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request;

- (BFTask *)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request;

- (BFTask *)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request;

@end
