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
#import "AWSCognitoIdentityModel.h"

@class BFTask;

/**
 * 
 */
@interface AWSCognitoIdentity : AWSService

@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

+ (instancetype)defaultCognitoIdentity;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

- (BFTask *)createIdentityPool:(AWSCognitoIdentityCreateIdentityPoolInput *)request;

- (BFTask *)deleteIdentityPool:(AWSCognitoIdentityDeleteIdentityPoolInput *)request;

- (BFTask *)describeIdentityPool:(AWSCognitoIdentityDescribeIdentityPoolInput *)request;

- (BFTask *)getId:(AWSCognitoIdentityGetIdInput *)request;

- (BFTask *)getOpenIdToken:(AWSCognitoIdentityGetOpenIdTokenInput *)request;

- (BFTask *)listIdentities:(AWSCognitoIdentityListIdentitiesInput *)request;

- (BFTask *)listIdentityPools:(AWSCognitoIdentityListIdentityPoolsInput *)request;

- (BFTask *)unlinkIdentity:(AWSCognitoIdentityUnlinkIdentityInput *)request;

- (BFTask *)updateIdentityPool:(AWSCognitoIdentityIdentityPool *)request;

@end
