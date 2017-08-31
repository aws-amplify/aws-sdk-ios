//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSSignInProvider.h"
#import "AWSSignInProviderApplicationIntercept.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSIdentityManager : NSObject<AWSIdentityProviderManager>

/**
 * Amazon Cognito User Identity ID. This uniquely identifies the user, regardless of
 * whether or not the user is signed-in, if User Sign-in is enabled in the project.
 * @return unique user identifier
 */
@property (nonatomic, readonly, nullable) NSString *identityId;

/**
 * Amazon Cognito Credentials Provider. This is the credential provider used by the Identity Manager.
 *
 * @return the cognito credentials provider
 */
@property (nonatomic, readonly, strong) AWSCognitoCredentialsProvider *credentialsProvider;

/*
 Fetches the current auth state for a user
 */
-(AWSIdentityManagerAuthState)authState;

/**
 Returns the Identity Manager singleton instance configured using the information provided in `awsconfiguration.json` or `Info.plist` file.
 
 *Swift*
 
 let identityManager = AWSIdentityManager.default()
 
 *Objective-C*
 
 AWSIdentityManager *identityManager = [AWSIdentityManager defaultIdentityManager];
 */
+ (instancetype)defaultIdentityManager;


@end

NS_ASSUME_NONNULL_END
