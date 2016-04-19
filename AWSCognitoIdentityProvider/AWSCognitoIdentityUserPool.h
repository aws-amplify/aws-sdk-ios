//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License").
// You may not use this file except in compliance with the
// License. A copy of the License is located at
//
//     http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, express or implied. See the License
// for the specific language governing permissions and
// limitations under the License.
//

#import <Foundation/Foundation.h>
#import "AWSCognitoIdentityProviderService.h"

@class AWSCognitoIdentityUser;
@class AWSCognitoIdentityUserAttributeType;
@class AWSCognitoIdentityPasswordAuthenticationInput;
@class AWSCognitoIdentityPasswordAuthenticationDetails;
@class AWSCognitoIdentityUserPoolConfiguration;

NS_ASSUME_NONNULL_BEGIN

@interface AWSCognitoIdentityUserPool : NSObject <AWSIdentityProvider, AWSIdentityProviderManager>

@property (nonatomic, readonly) AWSServiceConfiguration *configuration;
@property (nonatomic, readonly) AWSCognitoIdentityUserPoolConfiguration *userPoolConfiguration;
@property (nonatomic, readonly) NSString *identityProviderName;

/**
 For interacting with the user to obtain username/password
 */
@property (nonatomic, copy) void(^getPasswordAuthenticationDetails)(AWSCognitoIdentityPasswordAuthenticationInput *authenticationInput, AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails *> *passwordAuthenticationDetails);

/**
 For interacting with the user to obtain multifactor auth code
 */
@property (nonatomic, copy, nullable) void(^getMultiFactorAuthenticationCode)(AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium, NSString *destination, AWSTaskCompletionSource<NSString *> * mfaCode);

+ (void)registerCognitoIdentityUserPoolWithUserPoolConfiguration:(AWSCognitoIdentityUserPoolConfiguration *)userPoolConfiguration
                                                          forKey:(NSString *)key;

+ (void)registerCognitoIdentityUserPoolWithConfiguration:(nullable AWSServiceConfiguration *)configuration
                                   userPoolConfiguration:(AWSCognitoIdentityUserPoolConfiguration *)userPoolConfiguration
                                                  forKey:(NSString *)key;

+ (instancetype)CognitoIdentityUserPoolForKey:(NSString *)key;

+ (void)removeCognitoIdentityUserPoolForKey:(NSString *)key;

/**
 Sign up a new user
 */
- (AWSTask<AWSCognitoIdentityUser *> *)signUp:(NSString *)username
                                     password:(NSString *)password
                               userAttributes:(nullable NSArray<AWSCognitoIdentityUserAttributeType *> *)userAttributes
                               validationData:(nullable NSArray<AWSCognitoIdentityUserAttributeType *> *)validationData;

/**
 Return the user who last authenticated.  Username may be nil if current user is unknown.
 @return The last authenticated user
 */
- (nullable AWSCognitoIdentityUser *)currentUser;

/**
 Return the user without a username, when username is unknown.
 */
- (AWSCognitoIdentityUser *)getUser;

/**
 Return the user with a specific username
 */
- (AWSCognitoIdentityUser *)getUser:(NSString *)username;

@end

@interface AWSCognitoIdentityUserPoolConfiguration : NSObject

@property (nonatomic, readonly) NSString *clientId;
@property (nonatomic, readonly, nullable) NSString *clientSecret;
@property (nonatomic, readonly) NSString *poolId;
@property (nonatomic, readonly) BOOL shouldProvideCognitoValidationData;

- (instancetype)initWithClientId:(NSString *)clientId
                    clientSecret:(nullable NSString *)clientSecret
                          poolId:(NSString *)poolId;

- (instancetype)initWithClientId:(NSString *)clientId
                    clientSecret:(nullable NSString *)clientSecret
                          poolId:(NSString *)poolId
shouldProvideCognitoValidationData:(BOOL)shouldProvideCognitoValidationData;

@end

/**
 When interactive sign in is initiated, this encapsulates the last known username
 */
@interface AWSCognitoIdentityPasswordAuthenticationInput : NSObject

@property(nonatomic, readonly, nullable) NSString *lastKnownUsername;

- (nullable instancetype) initWithLastKnownUsername:(nullable NSString *)lastKnownUsername;

@end

/**
 When responding to an interactive sign in, this encapsulates the end users' username and password
 */
@interface AWSCognitoIdentityPasswordAuthenticationDetails : NSObject

@property(nonatomic, strong) NSString *username;
@property(nonatomic, strong) NSString *password;
@property(nonatomic, strong, nullable) NSArray<AWSCognitoIdentityUserAttributeType *> *validationData;

- (nullable instancetype)initWithUsername:(NSString *)username
                                 password:(NSString *)password;
@end

/**
 The error domain for AWSCognitoIdentityProvider errors.
 <ul>
 <li>AWSCognitoIdentityProviderClientErrorUnknown - Unknown error.</li>
 <li>AWSCognitoIdentityProviderClientErrorInvalidAuthenticationBlock - Necessary authentication block isn't set.</li>
 </ul>
 */
typedef NS_ENUM(NSInteger, AWSCognitoIdentityClientErrorType) {
    AWSCognitoIdentityProviderClientErrorUnknown = 0,
    AWSCognitoIdentityProviderClientErrorInvalidAuthenticationBlock = -1000,
};

NS_ASSUME_NONNULL_END
