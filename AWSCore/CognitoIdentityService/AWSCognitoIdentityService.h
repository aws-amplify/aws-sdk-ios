/**
 * Copyright 2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
@property (nonatomic, strong, readonly) AWSEndpoint *endpoint;

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
