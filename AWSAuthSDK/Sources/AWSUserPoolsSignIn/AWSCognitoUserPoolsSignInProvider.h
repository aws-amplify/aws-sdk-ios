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

#import <Foundation/Foundation.h>
#import <AWSAuthCore/AWSSignInProvider.h>
#import <AWSCognitoIdentityProvider/AWSCognitoIdentityProvider.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSCognitoUserPoolsSignInProviderKey;

@protocol AWSCognitoUserPoolsSignInHandler

/**
 *  This method is called when `loginWithSignInProvider` is called by `AWSIdentityManager`.
 *  This method should handle the input from the user and set the `taskCompletionSource` result required by Cognito Idp SDK.
 */
- (void)handleUserPoolSignInFlowStart;

@end

/**
 * `AWSCognitoUserPoolsSignInProvider` adopts the `AWSSignInProvider` protocol.
 *
 * It works with the AWS Cognito User Pools SDK internally.
 */
@interface AWSCognitoUserPoolsSignInProvider : NSObject <AWSSignInProvider>

/**
 *  Registers the cognito pool with specified configuration. The pool object can be accessed by using the `CognitoIdentityUserPoolForKey:` method using `AWSCognitoUserPoolsSignInProviderKey` as the identifier key.
 *
 *  @param cognitoIdentityUserPoolId              The Cognito Identity User Pool Id
 *  @param cognitoIdentityUserPoolAppClientId     The Cognito Identity User Pool Client Id
 *  @param cognitoIdentityUserPoolAppClientSecret The Cognito Identity User Pool Client Secret
 *  @param region                                 The Cognito Identity User Pool Service Region
 */
+ (void)setupUserPoolWithId:(NSString *)cognitoIdentityUserPoolId
cognitoIdentityUserPoolAppClientId:(NSString *)cognitoIdentityUserPoolAppClientId
cognitoIdentityUserPoolAppClientSecret:(NSString *)cognitoIdentityUserPoolAppClientSecret
                        region:(AWSRegionType)region;

/**
 Fetches the shared instance for AWSCognitoUserPoolsSignInProvider. The method `setupUserPoolWithId:cognitoIdentityUserPoolAppClientId:cognitoIdentityUserPoolAppClientSecret:region` has to be called once before accessing the shared instance.
 
 @return the single instance of AWSCognitoUserPoolsSignInProvider
 */
+ (instancetype)sharedInstance;

/**
 *  Set the instance of the class adopting the `AWSCognitoIdentityInteractiveAuthenticationDelegate` protocol of Cognito Idp SDK.
 *
 *  @param interactiveAuthDelegate A class adopting the `AWSCognitoIdentityInteractiveAuthenticationDelegate` protocol
 */
- (void)setInteractiveAuthDelegate:(id)interactiveAuthDelegate;

/**
 *  Returns the status of the current user pool user.
 *
 *  @return `YES` if the user is signed in.
 */
- (BOOL)isLoggedIn;

/**
 *  Returns the configured underlying user pool client.
 *
 *  @return the configured user pool instance
 */
- (AWSCognitoIdentityUserPool *)getUserPool;


@end

NS_ASSUME_NONNULL_END
