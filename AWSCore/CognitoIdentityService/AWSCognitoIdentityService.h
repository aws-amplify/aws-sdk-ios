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
#import "AWSCognitoIdentityServiceModel.h"

@class BFTask;

/**
 * 
 */
@interface AWSCognitoIdentityService : AWSService

@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

+ (instancetype)defaultCognitoIdentityService;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

- (BFTask *)createIdentityPool:(AWSCognitoIdentityServiceCreateIdentityPoolInput *)request;

- (BFTask *)deleteIdentityPool:(AWSCognitoIdentityServiceDeleteIdentityPoolInput *)request;

- (BFTask *)describeIdentityPool:(AWSCognitoIdentityServiceDescribeIdentityPoolInput *)request;

- (BFTask *)getId:(AWSCognitoIdentityServiceGetIdInput *)request;

- (BFTask *)getOpenIdToken:(AWSCognitoIdentityServiceGetOpenIdTokenInput *)request;

- (BFTask *)listIdentities:(AWSCognitoIdentityServiceListIdentitiesInput *)request;

- (BFTask *)listIdentityPools:(AWSCognitoIdentityServiceListIdentityPoolsInput *)request;

- (BFTask *)unlinkIdentity:(AWSCognitoIdentityServiceUnlinkIdentityInput *)request;

- (BFTask *)updateIdentityPool:(AWSCognitoIdentityServiceIdentityPool *)request;

@end
