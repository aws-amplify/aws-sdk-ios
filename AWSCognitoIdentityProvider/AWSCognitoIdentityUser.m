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

#import "AWSCognitoIdentityProvider.h"
#import "AWSCognitoIdentityUser_Internal.h"
#import "AWSCognitoIdentityUserPool_Internal.h"
#import "AWSCognitoIdentityProviderSrpHelper.h"
#import "AWSJKBigInteger.h"
#import <CommonCrypto/CommonDigest.h>

@interface AWSCognitoIdentityUserPool()

@property (nonatomic, strong) AWSCognitoIdentityProvider *client;

@end

@implementation AWSCognitoIdentityUser

static const NSString * AWSCognitoIdentityUserDerivedKeyInfo = @"Caldera Derived Key";
static const NSString * AWSCognitoIdentityUserAccessToken = @"accessToken";
static const NSString * AWSCognitoIdentityUserIdToken = @"idToken";
static const NSString * AWSCognitoIdentityUserRefreshToken = @"refreshToken";
static const NSString * AWSCognitoIdentityUserTokenExpiration = @"tokenExpiration";

-(instancetype) initWithUsername: (NSString *)username pool:(AWSCognitoIdentityUserPool *)pool {
    self = [super init];
    if(self != nil) {
        _username = username;
        _pool = pool;
        _confirmedStatus = AWSCognitoIdentityUserStatusUnknown;
    }
    return self;
}

-(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *) confirmSignUp:(NSString *) confirmationCode {
    AWSCognitoIdentityProviderConfirmSignUpRequest *request = [AWSCognitoIdentityProviderConfirmSignUpRequest new];
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.username = self.username;
    request.secretHash = [self.pool calculateSecretHash:self.username];
    request.confirmationCode = confirmationCode;
    return [[self.pool.client confirmSignUp:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderConfirmSignUpResponse *> * _Nonnull task) {
        AWSCognitoIdentityUserConfirmSignUpResponse * response = [AWSCognitoIdentityUserConfirmSignUpResponse new];
        return [AWSTask taskWithResult:response];
    }];
}

-(AWSTask<AWSCognitoIdentityUserForgotPasswordResponse *> *) forgotPassword {
    AWSCognitoIdentityProviderForgotPasswordRequest *request = [AWSCognitoIdentityProviderForgotPasswordRequest new];
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.username = self.username;
    request.secretHash = [self.pool calculateSecretHash:self.username];
    return [[self.pool.client forgotPassword:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderForgotPasswordResponse *> * _Nonnull task) {
        AWSCognitoIdentityUserForgotPasswordResponse * response = [AWSCognitoIdentityUserForgotPasswordResponse new];
        return [AWSTask taskWithResult:response];
    }];

}

-(AWSTask<AWSCognitoIdentityUserConfirmForgotPasswordResponse *> *) confirmForgotPassword: (NSString *)confirmationCode password:(NSString *) password {
    AWSCognitoIdentityProviderConfirmForgotPasswordRequest *request = [AWSCognitoIdentityProviderConfirmForgotPasswordRequest new];
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.username = self.username;
    request.secretHash = [self.pool calculateSecretHash:self.username];
    request.password = password;
    request.confirmationCode = confirmationCode;
    return [[self.pool.client confirmForgotPassword:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderConfirmForgotPasswordResponse *> * _Nonnull task) {
        AWSCognitoIdentityUserConfirmForgotPasswordResponse * response = [AWSCognitoIdentityUserConfirmForgotPasswordResponse new];
        return [AWSTask taskWithResult:response];
    }];
}

-(AWSTask<AWSCognitoIdentityUserResendConfirmationCodeResponse *> *) resendConfirmationCode {
    AWSCognitoIdentityProviderResendConfirmationCodeRequest *request = [AWSCognitoIdentityProviderResendConfirmationCodeRequest new];
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.username = self.username;
    request.secretHash = [self.pool calculateSecretHash:self.username];
    return [[self.pool.client resendConfirmationCode:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderResendConfirmationCodeResponse *> * _Nonnull task) {
        AWSCognitoIdentityUserResendConfirmationCodeResponse * response = [AWSCognitoIdentityUserResendConfirmationCodeResponse new];
        return [AWSTask taskWithResult:response];
    }];
}

-(AWSTask<AWSCognitoIdentityUserChangePasswordResponse *>*) changePassword: (NSString*)currentPassword proposedPassword: (NSString *)proposedPassword {
    AWSCognitoIdentityProviderChangePasswordRequest* request = [AWSCognitoIdentityProviderChangePasswordRequest new];
    request.previousPassword = currentPassword;
    request.proposedPassword = proposedPassword;
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        return [[self.pool.client changePassword:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderChangePasswordResponse *> * _Nonnull task) {
            AWSCognitoIdentityProviderChangePasswordResponse * apiResponse = task.result;
            AWSCognitoIdentityUserChangePasswordResponse *response = [AWSCognitoIdentityUserChangePasswordResponse new];
            [response aws_copyPropertiesFromObject:apiResponse];
            return [AWSTask taskWithResult:response];
        }];
        
    }];
}

-(AWSTask<AWSCognitoIdentityUserGetDetailsResponse *>*) getDetails {
    AWSCognitoIdentityProviderGetUserRequest* request = [AWSCognitoIdentityProviderGetUserRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        return [[self.pool.client getUser:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderGetUserResponse *> * _Nonnull task) {
            AWSCognitoIdentityProviderGetUserResponse *apiResponse = task.result;
            AWSCognitoIdentityUserGetDetailsResponse * response = [AWSCognitoIdentityUserGetDetailsResponse new];
            [response aws_copyPropertiesFromObject:apiResponse];
            return [AWSTask taskWithResult:response];
        }];
    }];
}

/**
 Get a session using the last requested scopes
 */
-(AWSTask<AWSCognitoIdentityUserSession*> *) getSession {
    return [self getSession:self.lastScopes];
}

/**
 Get a session for the requested scopes
 */
-(AWSTask<AWSCognitoIdentityUserSession*> *) getSession: (NSSet<NSString*>*) scopes {
    
    //check to see if we have valid tokens
    __block NSString * keyChainNamespace = [self keyChainNamespace:self.username scopes:scopes];
    NSString * expirationTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserTokenExpiration];
    NSString * expirationDate = self.pool.keychain[expirationTokenKey];
    
    if(expirationDate){
        NSDate *expiration = [NSDate aws_dateFromString:expirationDate format:AWSDateISO8601DateFormat1];
        NSString * refreshTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserRefreshToken];
        NSString * refreshToken = self.pool.keychain[refreshTokenKey];
        //if the session expires > 5 minutes return it.
        if(expiration && [expiration compare:[NSDate dateWithTimeIntervalSinceNow:5 * 60]] == NSOrderedDescending){
            NSString * idTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserIdToken];
            NSString * accessTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserAccessToken];
            AWSCognitoIdentityUserSession * session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken:self.pool.keychain[idTokenKey] accessToken:self.pool.keychain[accessTokenKey] refreshToken:refreshToken expirationTime:expiration];
        
            session.expirationTime = expiration;
            self.lastScopes = scopes;
            return [AWSTask taskWithResult:session];
        }
        //else refresh it using the refresh token
        else if(refreshToken){
            AWSCognitoIdentityProviderRefreshTokensRequest * refreshTokens = [AWSCognitoIdentityProviderRefreshTokensRequest new];
            refreshTokens.clientId = self.pool.userPoolConfiguration.clientId;
            refreshTokens.clientSecret = self.pool.userPoolConfiguration.clientSecret;
            refreshTokens.refreshToken = refreshToken;
            return [[self.pool.client refreshTokens:refreshTokens] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRefreshTokensResponse *> * _Nonnull task) {
                if(task.error){
                    //If this token is no longer valid, fall back on interactive auth.
                    if(task.error.code == AWSCognitoIdentityProviderErrorNotAuthorized) {
                        return [self interactiveAuth:scopes];
                    } else {
                        return task;
                    }
                }
                
                AWSCognitoIdentityProviderRefreshTokensResponse *response = task.result;
                AWSCognitoIdentityProviderAuthenticationResultType *authResult = response.authenticationResult;
                AWSCognitoIdentityUserSession * session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken: authResult.idToken accessToken:authResult.accessToken refreshToken:authResult.refreshToken expiresIn:authResult.expiresIn];
                self.lastScopes = scopes;
                [self persistToKeychain:self.username scopes:scopes session:session];
                return [AWSTask taskWithResult:session];
            }];
        }
    }
    return [self interactiveAuth:scopes];
}


/**
 * Explicitly get a session without using any cached tokens/refresh tokens.
 */
- (AWSTask<AWSCognitoIdentityUserSession*>*) getSession:(NSString *)username password:(NSString *)password validationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*)validationData scopes: (NSSet<NSString*> *) scopes{
    
    return [[self srpAuthInternal:username password:password validationData:validationData scopes:scopes] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderAuthenticateResponse *> * _Nonnull task) {
        return [self getSessionInternal:username scopes:scopes task:task];
    }];
}


- (AWSTask<AWSCognitoIdentityUserSession*>*) getSessionInternal:(NSString *) username scopes: (NSSet<NSString*> *) scopes task: (AWSTask<AWSCognitoIdentityProviderAuthenticateResponse *>*) task{
    return [task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderAuthenticateResponse *> * _Nonnull task) {
        AWSCognitoIdentityProviderAuthenticateResponse * authenticateResult = task.result;
        AWSCognitoIdentityProviderAuthenticationResultType * authResult = task.result.authenticationResult;
        AWSCognitoIdentityProviderCodeDeliveryDetailsType *codeDeliveryDetails = task.result.codeDeliveryDetails;
        
        //if no mfa required return session
        if(codeDeliveryDetails == nil){
            AWSCognitoIdentityUserSession * session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken:authResult.idToken accessToken:authResult.accessToken refreshToken:authResult.refreshToken expiresIn:authResult.expiresIn];
            self.username = username;
            [self persistToKeychain:username scopes:scopes session:session];
            return [AWSTask taskWithResult:session];
        }else {
            //else perform mfa step
            if ([self.pool.delegate respondsToSelector:@selector(startMultiFactorAuthentication)]) {
                id<AWSCognitoIdentityMultiFactorAuthentication> authenticationDelegate = [self.pool.delegate startMultiFactorAuthentication];
                return [self mfaAuthInternal:username codeDeliveryDetails:codeDeliveryDetails authState:authenticateResult.authState scopes:scopes authenticationDelegate:authenticationDelegate];
                
            }else {
                return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"startMultiFactorAuthentication not implemented by authentication delegate"}]];
            }
        }
    }];
}

/**
 * Kick off interactive auth to prompt developer for username/password and optionally mfa code
 */
- (AWSTask<AWSCognitoIdentityUserSession*>*) interactiveAuth: (NSSet<NSString*>*) scopes {
    if(self.pool.delegate != nil){
        id<AWSCognitoIdentityPasswordAuthentication> authenticationDelegate = [self.pool.delegate startPasswordAuthentication];
        return [self passwordAuthInternal:scopes authenticationDelegate:authenticationDelegate];
    } else {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"Authentication delegate not set"}]];
    };
}

/**
 * Prompt developer to obtain username/password and do SRP auth
 */
- (AWSTask<AWSCognitoIdentityUserSession*>*) passwordAuthInternal: (NSSet<NSString*>*) scopes authenticationDelegate: (id<AWSCognitoIdentityPasswordAuthentication>) authenticationDelegate {
    AWSCognitoIdentityPasswordAuthenticationInput * input = [[AWSCognitoIdentityPasswordAuthenticationInput alloc] initWithLastKnownUsername:[self.pool currentUsername]];
    AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails*>*passwordAuthenticationDetails = [AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails*> new];
    [authenticationDelegate getPasswordAuthenticationDetails:input passwordAuthenticationCompletionSource:passwordAuthenticationDetails];
    return [passwordAuthenticationDetails.task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityPasswordAuthenticationDetails *> * _Nonnull task) {
        AWSCognitoIdentityPasswordAuthenticationDetails * authDetails = task.result;
        return [[self srpAuthInternal:authDetails.username password:authDetails.password validationData:authDetails.validationData scopes:scopes] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderAuthenticateResponse *> * _Nonnull task) {
            [authenticationDelegate didCompletePasswordAuthenticationStepWithError:task.error];
            if(task.isCancelled){
                return task;
            }
            if(task.error){
                //retry password auth on error
                return [self passwordAuthInternal:scopes authenticationDelegate:authenticationDelegate];
            }else {
                return [self getSessionInternal:authDetails.username scopes:scopes task:task];
            }
        }];
    }];
}

/**
 * Perform SRP based authentication (GetAuthenticationDetails and Authenticate) given a username and password
 */
- (AWSTask<AWSCognitoIdentityProviderAuthenticateResponse*>*) srpAuthInternal:(NSString *)username password:(NSString *)password validationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*)validationData scopes: (NSSet<NSString*> *) scopes{
    
    AWSCognitoIdentityProviderGetAuthenticationDetailsRequest *input = [AWSCognitoIdentityProviderGetAuthenticationDetailsRequest new];
    input.clientId = self.pool.userPoolConfiguration.clientId;
    input.username = username;
    input.validationData = [self.pool getValidationData:validationData];
    
    AWSCognitoIdentityProviderSrpHelper *srpHelper = [AWSCognitoIdentityProviderSrpHelper beginUserAuthentication:username password:password];
    input.srpA = [srpHelper.clientState.publicA stringValueWithRadix:16];
    input.secretHash = [self.pool calculateSecretHash:username];
    
    return [[self.pool.client getAuthenticationDetails:input] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderGetAuthenticationDetailsResponse *> * _Nonnull task) {
        
        AWSCognitoIdentityProviderGetAuthenticationDetailsResponse *authDetails = task.result;
        self.username = authDetails.username;
        NSString * strippedPool = [self.pool.userPoolConfiguration.poolId substringFromIndex:[self.pool.userPoolConfiguration.poolId rangeOfString:@"_" ].location+1];
        AWSCognitoIdentityProviderSrpServerState *serverState =
        [AWSCognitoIdentityProviderSrpServerState
         
         //TODO Need poolName from getUserAuthenticationDetailsResponse
         serverStateForPoolName:strippedPool
         publicBHexString:authDetails.srpB
         saltHexString:authDetails.salt
         derivedKeyInfo:AWSCognitoIdentityUserDerivedKeyInfo
         derivedKeySize:16
         serviceSecretBlock:authDetails.secretBlock];
        
        NSData *hash = [srpHelper completeAuthentication:serverState];
        AWSCognitoIdentityProviderAuthenticateRequest *authInput = [AWSCognitoIdentityProviderAuthenticateRequest new];
        authInput.clientId = self.pool.userPoolConfiguration.clientId;
        authInput.username = username;
        authInput.timestamp = srpHelper.clientState.timestamp;
        authInput.passwordClaim = [[AWSCognitoIdentityProviderPasswordClaimType alloc] init];
        authInput.passwordClaim.secretBlock = authDetails.secretBlock;
        authInput.passwordClaim.signature = hash;
        authInput.secretHash = [self.pool calculateSecretHash:username];
        return [self.pool.client authenticate:authInput];
        
    }];
}



/**
 * Invoke developer's ui to prompt user for mfa code and call enhanceAuth
 */
-(AWSTask<AWSCognitoIdentityUserSession *>*) mfaAuthInternal: (NSString *) username codeDeliveryDetails: (AWSCognitoIdentityProviderCodeDeliveryDetailsType *) codeDeliveryDetails authState:(NSString *) authState scopes:(NSSet<NSString*>*) scopes authenticationDelegate:(id<AWSCognitoIdentityMultiFactorAuthentication>)authenticationDelegate{
    AWSTaskCompletionSource<NSString *> *mfaCode = [[AWSTaskCompletionSource<NSString *> alloc] init];
    AWSCognitoIdentityMultifactorAuthenticationInput* authenticationInput = [[AWSCognitoIdentityMultifactorAuthenticationInput alloc] initWithDeliveryMedium:codeDeliveryDetails.deliveryMedium destination:codeDeliveryDetails.destination];
    [authenticationDelegate getMultiFactorAuthenticationCode:authenticationInput mfaCodeCompletionSource:mfaCode];
    return [mfaCode.task
            continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
                AWSCognitoIdentityProviderEnhanceAuthRequest *enhance = [AWSCognitoIdentityProviderEnhanceAuthRequest new];
                enhance.clientId = self.pool.userPoolConfiguration.clientId;
                enhance.username = username;
                enhance.authState = authState;
                enhance.secretHash = [self.pool calculateSecretHash:username];
                enhance.code = mfaCode.task.result;
                return [[[self.pool.client enhanceAuth:enhance] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderEnhanceAuthResponse *> * _Nonnull task) {
                    AWSCognitoIdentityProviderEnhanceAuthResponse *response = task.result;
                    AWSCognitoIdentityProviderAuthenticationResultType * authResult = response.authenticationResult;
                    AWSCognitoIdentityUserSession * session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken:authResult.idToken accessToken:authResult.accessToken refreshToken:authResult.refreshToken expiresIn:authResult.expiresIn];
                    self.username = username;
                    [self persistToKeychain:username scopes:scopes session:session];
                    return [AWSTask taskWithResult:session];
                }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                    [authenticationDelegate didCompleteMultifactorAuthenticationStepWithError:task.error];
                    if([task isCancelled]){
                        return task;
                    }
                    if(task.error){
                        //retry on error
                        return [self mfaAuthInternal:username codeDeliveryDetails:codeDeliveryDetails authState:authState scopes:scopes authenticationDelegate:authenticationDelegate];
                    }else {
                        return task;
                    }
                }];
            }];
}

/**
 * Update this user's attributes
 */
-(AWSTask<AWSCognitoIdentityUserUpdateAttributesResponse *>*) updateAttributes: (NSArray<AWSCognitoIdentityUserAttributeType *>*) attributes {
    AWSCognitoIdentityProviderUpdateUserAttributesRequest *request = [AWSCognitoIdentityProviderUpdateUserAttributesRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        NSMutableArray *userAttributes = [NSMutableArray new];
        request.userAttributes = userAttributes;
        for (AWSCognitoIdentityUserAttributeType * attribute in attributes) {
            AWSCognitoIdentityProviderAttributeType *apiAttribute = [AWSCognitoIdentityProviderAttributeType new];
            apiAttribute.name = attribute.name;
            apiAttribute.value = attribute.value;
            [userAttributes addObject: apiAttribute];
        }
        return [[self.pool.client updateUserAttributes:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderUpdateUserAttributesResponse *> * _Nonnull task) {
            AWSCognitoIdentityUserUpdateAttributesResponse * response = [AWSCognitoIdentityUserUpdateAttributesResponse new];
            [response aws_copyPropertiesFromObject:task.result];
            return [AWSTask taskWithResult:response];
        }];
    }];
}

/**
 * Delete the attributes specified by attributeNames
 */
-(AWSTask<AWSCognitoIdentityUserDeleteAttributesResponse *>*) deleteAttributes: (NSArray<NSString *>*) attributeNames {
    AWSCognitoIdentityProviderDeleteUserAttributesRequest *request = [AWSCognitoIdentityProviderDeleteUserAttributesRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        NSMutableArray *userAttributes = [NSMutableArray new];
        request.userAttributeNames = userAttributes;
        return [[self.pool.client deleteUserAttributes:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderDeleteUserAttributesResponse *> * _Nonnull task) {
            [self signOut];
            AWSCognitoIdentityUserDeleteAttributesResponse * response = [AWSCognitoIdentityUserDeleteAttributesResponse new];
            return [AWSTask taskWithResult:response];
        }];
    }];
}


/**
 * Verify a user attribute upon receiving the verification code.
 */
-(AWSTask<AWSCognitoIdentityUserVerifyAttributeResponse *>*) verifyAttribute: (NSString *) attributeName code: (NSString *) code {
    AWSCognitoIdentityProviderVerifyUserAttributeRequest *request = [AWSCognitoIdentityProviderVerifyUserAttributeRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        request.attributeName = attributeName;
        request.code = code;
        return [[self.pool.client verifyUserAttribute:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderVerifyUserAttributeResponse *> * _Nonnull task) {
            AWSCognitoIdentityUserVerifyAttributeResponse * response = [AWSCognitoIdentityUserVerifyAttributeResponse new];
            return [AWSTask taskWithResult:response];
        }];
    }];

}

/**
 * Request a verification code to verify an attribute.
 */
-(AWSTask<AWSCognitoIdentityUserGetAttributeVerificationCodeResponse *>*) getAttributeVerificationCode: (NSString *) attributeName {
    AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest *request = [AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        request.attributeName = attributeName;
        return [[self.pool.client getUserAttributeVerificationCode:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse *> * _Nonnull task) {
            AWSCognitoIdentityUserGetAttributeVerificationCodeResponse * response = [AWSCognitoIdentityUserGetAttributeVerificationCodeResponse new];
            [response aws_copyPropertiesFromObject:task.result];
            return [AWSTask taskWithResult:response];
        }];
    }];
}

/**
 * Set the user settings for this user such as MFA
 */
-(AWSTask<AWSCognitoIdentityUserSetUserSettingsResponse *>*) setUserSettings: (AWSCognitoIdentityUserSettings *) settings; {
    
    AWSCognitoIdentityProviderSetUserSettingsRequest *request = [AWSCognitoIdentityProviderSetUserSettingsRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        NSMutableArray * mfaOptions = [NSMutableArray new];
        for(AWSCognitoIdentityUserMFAOption* mfaOption in settings.mfaOptions){
            [mfaOptions addObject:[mfaOption mfaOptionTypeValue]];
        }
        request.MFAOptions = mfaOptions;
        return [[self.pool.client setUserSettings:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderSetUserSettingsResponse *> * _Nonnull task) {
            AWSCognitoIdentityUserSetUserSettingsResponse * response = [AWSCognitoIdentityUserSetUserSettingsResponse new];
            [response aws_copyPropertiesFromObject:task.result];
            return [AWSTask taskWithResult:response];
        }];
    }];
}

/**
 * Delete this user
 */
-(AWSTask*) deleteUser {
    AWSCognitoIdentityProviderDeleteUserRequest *request = [AWSCognitoIdentityProviderDeleteUserRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        return [self.pool.client deleteUser:request];
    }];

}

-(void) signOut {
    NSArray *keys = self.pool.keychain.allKeys;
    NSString *keyChainPrefix = [[self keyChainNamespace:self.username scopes:self.lastScopes] stringByAppendingString:@"."];
    for (NSString *key in keys) {
        if([key hasPrefix:keyChainPrefix]){
            [self.pool.keychain removeItemForKey:key];
        }
    }
}

- (void) persistToKeychain:(NSString *) username scopes:(NSSet<NSString*>*) scopes session: (AWSCognitoIdentityUserSession *) session {
    [self.pool setCurrentUser:username];
    NSString * keyChainNamespace = [self keyChainNamespace:username scopes:scopes];
    if(session.idToken){
        NSString * idTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserIdToken];
        self.pool.keychain[idTokenKey] = session.idToken.tokenString;
    }
    if(session.accessToken){
        NSString * accessTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserAccessToken];
        self.pool.keychain[accessTokenKey] = session.accessToken.tokenString;
    }
    if(session.refreshToken){
        NSString * refreshTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserRefreshToken];
        self.pool.keychain[refreshTokenKey] = session.refreshToken.tokenString;
    }
    if(session.expirationTime){
        NSString * expirationTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserTokenExpiration];
        self.pool.keychain[expirationTokenKey] = [session.expirationTime aws_stringValue:AWSDateISO8601DateFormat1];
    }
}

- (NSString *) keyChainNamespace: (NSString *) username scopes:(NSSet<NSString *>*) scopes {
    if(scopes == nil){
            return [NSString stringWithFormat:@"%@.%@", self.pool.userPoolConfiguration.clientId, username];
    }
    return [NSString stringWithFormat:@"%@.%@.%@", self.pool.userPoolConfiguration.clientId, username, [self normalizeScopes:scopes]];
}

/**
 * Get a namespaced keychain key given a namespace and key
 */
- (NSString *) keyChainKey: (NSString *) namespace key:(const NSString *) key {
    return [NSString stringWithFormat:@"%@.%@", namespace, key];
}

/**
 * Sort scopes into a normalized order, and hash them to compact them
 */
- (NSString *) normalizeScopes: (NSSet<NSString *>*) scopes {
    if(scopes == nil){
        return @"";
    }
    NSArray * sortedScopes = [scopes sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
    return [[sortedScopes componentsJoinedByString:@"."] aws_md5String];
}


@end

@implementation AWSCognitoIdentityUserSession

-(instancetype) initWithIdToken:(NSString *)idToken accessToken:(NSString *)accessToken refreshToken:(NSString *)refreshToken expiresIn:(NSNumber *) expiresIn {
    self = [self initWithIdToken:idToken accessToken:accessToken refreshToken:refreshToken expirationTime:[NSDate dateWithTimeIntervalSinceNow:expiresIn.doubleValue]];
    return self;
}

-(instancetype) initWithIdToken:(NSString *)idToken accessToken:(NSString *)accessToken refreshToken:(NSString *)refreshToken expirationTime:(NSDate *) expirationTime {
    self = [super init];
    if(self != nil) {
        self.idToken = [[AWSCognitoIdentityUserSessionToken alloc] initWithToken:idToken];
        self.accessToken = [[AWSCognitoIdentityUserSessionToken alloc] initWithToken:accessToken];
        self.refreshToken = [[AWSCognitoIdentityUserSessionToken alloc] initWithToken:refreshToken];
        self.expirationTime = expirationTime;
    }
    return self;
}
@end

@implementation AWSCognitoIdentityUserSessionToken

-(instancetype) initWithToken:(NSString *)token {
    if(token == nil){
        return nil;
    }
    self = [super init];
    if(self != nil) {
        self.tokenString = token;
    }
    return self;
}
@end

@implementation AWSCognitoIdentityUserSettings

@end

@implementation AWSCognitoIdentityUserMFAOption

- (AWSCognitoIdentityProviderMFAOptionType *) mfaOptionTypeValue{
    AWSCognitoIdentityProviderMFAOptionType *result = [AWSCognitoIdentityProviderMFAOptionType new];
    [result aws_copyPropertiesFromObject:self];
    return result;
}
@end

@implementation AWSCognitoIdentityUserAttributeType

@end

@implementation AWSCognitoIdentityUserConfirmSignUpResponse

@end

@implementation AWSCognitoIdentityUserResendConfirmationCodeResponse

@end

@implementation AWSCognitoIdentityUserGetDetailsResponse

@end

@implementation AWSCognitoIdentityUserForgotPasswordResponse

@end

@implementation AWSCognitoIdentityUserConfirmForgotPasswordResponse

@end

@implementation AWSCognitoIdentityUserChangePasswordResponse

@end

@implementation AWSCognitoIdentityUserUpdateAttributesResponse

@end

@implementation AWSCognitoIdentityUserDeleteAttributesResponse

@end

@implementation AWSCognitoIdentityUserVerifyAttributeResponse

@end

@implementation AWSCognitoIdentityUserGetAttributeVerificationCodeResponse

@end

@implementation AWSCognitoIdentityUserSetUserSettingsResponse

@end
