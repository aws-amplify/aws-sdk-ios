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
@class AWSCognitoIdentityMultifactorAuthenticationInput;
@class AWSCognitoIdentityPasswordAuthenticationDetails;
@class AWSCognitoIdentityCustomChallengeDetails;
@class AWSCognitoIdentityUserPoolConfiguration;
@class AWSCognitoIdentityUserPoolSignUpResponse;
@class AWSCognitoIdentityNewPasswordRequiredDetails;

@protocol AWSCognitoIdentityInteractiveAuthenticationDelegate;
@protocol AWSCognitoIdentityPasswordAuthentication;
@protocol AWSCognitoIdentityMultiFactorAuthentication;
@protocol AWSCognitoIdentityCustomAuthentication;
@protocol AWSCognitoIdentityRememberDevice;
@protocol AWSCognitoIdentityNewPasswordRequired;

NS_ASSUME_NONNULL_BEGIN

@interface AWSCognitoIdentityUserPool : NSObject <AWSIdentityProvider, AWSIdentityProviderManager>

@property (nonatomic, readonly) AWSServiceConfiguration *configuration;
@property (nonatomic, readonly) AWSCognitoIdentityUserPoolConfiguration *userPoolConfiguration;
@property (nonatomic, readonly) NSString *identityProviderName;

/**
 Set this delegate to interactively prompt users for authentication challenges when necessary
 */
@property (nonatomic, strong) id <AWSCognitoIdentityInteractiveAuthenticationDelegate> delegate;

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
- (AWSTask<AWSCognitoIdentityUserPoolSignUpResponse *> *)signUp:(NSString *)username
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

/**
 Clear the last known user only without signing out of their user session
 */
- (void) clearLastKnownUser;

/**
 Clear everything from keychain, including last known user and user sessions for all users.
 */
- (void) clearAll;

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

@end



/**
 When interactive auth requires a multifactor authentication code, this encapsulates the
 destination and delivery medium
 */
@interface AWSCognitoIdentityMultifactorAuthenticationInput : NSObject

@property(nonatomic, readonly, nullable) NSString *destination;
@property(nonatomic, assign, readonly) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;
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
 When responding to a custom sign in, this encapsulates the end users challenge responses
 */
@interface AWSCognitoIdentityCustomChallengeDetails : NSObject

/**
 Optional developer provided validation data to add to the initate auth call
 */
@property(nonatomic, strong, nullable) NSArray<AWSCognitoIdentityUserAttributeType *> *validationData;

/**
 If you know your initial challenge, set this property to the challenge name
 */
@property(nonatomic, strong, nullable) NSString *initialChallengeName;

/**
 The end user challenge responses for this challenge
 */
@property(nonatomic, strong) NSDictionary<NSString*,NSString*>* challengeResponses;

-(instancetype) initWithChallengeResponses: (NSDictionary<NSString*,NSString*> *) challengeResponses;

@end


/**
 When responding to a new password required challenge this encapsulates the end users' new password and required attributes
 */
@interface AWSCognitoIdentityNewPasswordRequiredDetails : NSObject
/**
 The end user's new password
 */
@property(nonatomic, strong, nonnull) NSString *proposedPassword;
/**
 Any attribute the end user is setting.  Values must be present for all
 required attributes.  Any other attributes are optional.
 */
@property(nonatomic, strong, nullable) NSArray<AWSCognitoIdentityUserAttributeType*> *userAttributes;

/**
 Initializer given a new password and map of user attributes to set 
 **/
-(instancetype) initWithProposedPassword: (NSString *) proposedPassword userAttributes:(NSDictionary<NSString*,NSString*> *) userAttributes;

@end

/**
 When responding to a custom sign in, this encapsulates the challenge parameters that define the challenge
 */
@interface AWSCognitoIdentityCustomAuthenticationInput : NSObject

@property(nonatomic, strong) NSDictionary<NSString*,NSString*>* challengeParameters;

-(instancetype) initWithChallengeParameters: (NSDictionary<NSString*,NSString*> *) challengeParameters;

@end

/**
 When responding to new password required, this encapsulates the existing user attributes and the required user attributes.
 */
@interface AWSCognitoIdentityNewPasswordRequiredInput : NSObject

@property(nonatomic, strong) NSDictionary<NSString*,NSString*>* userAttributes;

@property(nonatomic, strong) NSSet<NSString*>* requiredAttributes;

-(instancetype) initWithUserAttributes: (NSDictionary<NSString*,NSString*> *) userAttributes requiredAttributes: (NSSet<NSString*>*) requiredAttributes;

@end


/**
 The error domain for AWSCognitoIdentityProvider errors.
 <ul>
 <li>AWSCognitoIdentityProviderClientErrorUnknown - Unknown error.</li>
 <li>AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate - Necessary authentication delegate isn't set.</li>
 <li>AWSCognitoIdentityProviderClientErrorCustomAuthenticationNotSupported - Custom authentication is not supported by this SDK.</li>
 <li>AWSCognitoIdentityProviderClientErrorDeviceNotTracked - This device does not have an id, either it was never tracked or previously forgotten.</li>
 </ul>
 */
typedef NS_ENUM(NSInteger, AWSCognitoIdentityClientErrorType) {
    AWSCognitoIdentityProviderClientErrorUnknown = 0,
    AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate = -1000,
    AWSCognitoIdentityProviderClientErrorCustomAuthenticationNotSupported = -2000,
    AWSCognitoIdentityProviderClientErrorDeviceNotTracked = -3000,
};

@interface AWSCognitoIdentityUserPoolSignUpResponse : AWSCognitoIdentityProviderSignUpResponse
@property (nonatomic, readonly) AWSCognitoIdentityUser* user;
@end

@protocol AWSCognitoIdentityInteractiveAuthenticationDelegate <NSObject>
@optional
/**
 Initialize ui to prompt end user for username and password
 */
-(id<AWSCognitoIdentityPasswordAuthentication>) startPasswordAuthentication;

/**
 Initialize ui to prompt end user for multifactor authentication code
 */
-(id<AWSCognitoIdentityMultiFactorAuthentication>) startMultiFactorAuthentication;

/**
 Initialize ui to prompt end user to remember this device
 */
-(id<AWSCognitoIdentityRememberDevice>) startRememberDevice;

/**
 Initialize ui to prompt end user to set a new password and specify profile information as part of sign in
 */
-(id<AWSCognitoIdentityNewPasswordRequired>) startNewPasswordRequired;

/**
 Initialize ui to prompt end user for custom authentication flow
 */
-(id<AWSCognitoIdentityCustomAuthentication>) startCustomAuthentication;

@end

@protocol AWSCognitoIdentityPasswordAuthentication <NSObject>
/**
 Obtain username and password from end user.
 @param authenticationInput input details including last known username
 @param passwordAuthenticationCompletionSource set passwordAuthenticationCompletionSource.result
 with the username and password received from the end user.
 */
-(void) getPasswordAuthenticationDetails: (AWSCognitoIdentityPasswordAuthenticationInput *) authenticationInput  passwordAuthenticationCompletionSource: (AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails *> *) passwordAuthenticationCompletionSource;
/**
 This step completed, usually either display an error to the end user or dismiss ui
 @param error the error if any that occured
 */
-(void) didCompletePasswordAuthenticationStepWithError:(NSError* _Nullable) error;
@end

@protocol AWSCognitoIdentityMultiFactorAuthentication <NSObject>
/**
 Obtain mfa code from the end user
 @param authenticationInput details about the deliveryMedium and masked destination for where the code was sent
 @param mfaCodeCompletionSource set mfaCodeCompletionSource.result with the mfa code from end user
 */
-(void) getMultiFactorAuthenticationCode: (AWSCognitoIdentityMultifactorAuthenticationInput *) authenticationInput mfaCodeCompletionSource: (AWSTaskCompletionSource<NSString *> *) mfaCodeCompletionSource;
/**
 This step completed, usually either display an error to the end user or dismiss ui
 @param error the error if any that occured
 */
-(void) didCompleteMultifactorAuthenticationStepWithError:(NSError* _Nullable) error;
@end


@protocol AWSCognitoIdentityCustomAuthentication <NSObject>


/**
 Obtain input for a custom challenge from the end user
 @param authenticationInput details the challenge including the challenge name and inputs
 @param customAuthCompletionSource set customAuthCompletionSource.result with the challenge answers from the end user
 */
-(void) getCustomChallengeDetails: (AWSCognitoIdentityCustomAuthenticationInput *) authenticationInput customAuthCompletionSource: (AWSTaskCompletionSource<AWSCognitoIdentityCustomChallengeDetails *> *) customAuthCompletionSource;
/**
 This step completed, usually either display an error to the end user or dismiss ui
 @param error the error if any that occured
 */
-(void) didCompleteCustomAuthenticationStepWithError:(NSError* _Nullable) error;


@end

@protocol AWSCognitoIdentityRememberDevice <NSObject>

/**
 Obtain whether to remember this device or not
 @param rememberDeviceCompletionSource set customAuthCompletionSource.result with YES or NO answer from the end user
 */
-(void) getRememberDevice: (AWSTaskCompletionSource<NSNumber *> *) rememberDeviceCompletionSource;
/**
 This step completed, usually either display an error to the end user or dismiss ui
 @param error the error if any that occured
 */
-(void) didCompleteRememberDeviceStepWithError:(NSError* _Nullable) error;
@end


@protocol AWSCognitoIdentityNewPasswordRequired <NSObject>

/**
 Obtain a new password and specify profile information as part of sign in from the end user
 @param newPasswordRequiredInput user profile and required attributes of the end user
 @param newPasswordRequiredCompletionSource set newPasswordRequiredCompletionSource with the new password and any attribute updates from the end user
 */
-(void) getNewPasswordDetails: (AWSCognitoIdentityNewPasswordRequiredInput *) newPasswordRequiredInput newPasswordRequiredCompletionSource: (AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails *> *) newPasswordRequiredCompletionSource;
/**
 This step completed, usually either display an error to the end user or dismiss ui
 @param error the error if any that occured
 */
-(void) didCompleteNewPasswordStepWithError:(NSError* _Nullable) error;


@end


NS_ASSUME_NONNULL_END
