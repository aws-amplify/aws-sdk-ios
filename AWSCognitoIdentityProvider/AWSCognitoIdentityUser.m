//
// Copyright 2014-2018 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import "AWSCognitoIdentityProvider.h"
#import "AWSCognitoIdentityUser_Internal.h"
#import "AWSCognitoIdentityUserPool_Internal.h"
#import "AWSCognitoIdentityProviderSrpHelper.h"
#import "AWSJKBigInteger.h"
#import "NSData+AWSCognitoIdentityProvider.h"
#import <CommonCrypto/CommonDigest.h>

@interface AWSCognitoIdentityUserPool()

@property (nonatomic, strong) AWSCognitoIdentityProvider *client;
@property (nonatomic, assign) BOOL isCustomAuth;

@end

@implementation AWSCognitoIdentityUser

static const NSString * AWSCognitoIdentityUserDerivedKeyInfo = @"Caldera Derived Key";
static const NSString * AWSCognitoIdentityUserAccessToken = @"accessToken";
static const NSString * AWSCognitoIdentityUserIdToken = @"idToken";
static const NSString * AWSCognitoIdentityUserRefreshToken = @"refreshToken";
static const NSString * AWSCognitoIdentityUserTokenExpiration = @"tokenExpiration";
static const NSString * AWSCognitoIdentityUserDeviceId = @"device.id";
static const NSString * AWSCognitoIdentityUserAsfDeviceId = @"asf.device.id";
static const NSString * AWSCognitoIdentityUserDeviceSecret = @"device.secret";
static const NSString * AWSCognitoIdentityUserDeviceGroup = @"device.group";
static const NSString * AWSCognitoIdentityUserUserAttributePrefix = @"userAttributes.";

-(instancetype) initWithUsername: (NSString *)username pool:(AWSCognitoIdentityUserPool *)pool {
    self = [super init];
    if(self != nil) {
        _username = username;
        _pool = pool;
        _confirmedStatus = AWSCognitoIdentityUserStatusUnknown;
    }
    return self;
}


-(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *) confirmSignUp:(NSString *) confirmationCode
                                                       forceAliasCreation:(BOOL)forceAliasCreation
                                                           clientMetaData:(nullable NSDictionary<NSString *,NSString *> *)clientMetaData {
    AWSCognitoIdentityProviderConfirmSignUpRequest *request = [AWSCognitoIdentityProviderConfirmSignUpRequest new];
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.username = self.username;
    request.secretHash = [self.pool calculateSecretHash:self.username];
    request.confirmationCode = confirmationCode;
    request.forceAliasCreation = (forceAliasCreation?@(YES):@(NO));
    request.analyticsMetadata = [self.pool analyticsMetadata];
    request.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];
    request.clientMetadata = clientMetaData;
    
    return [[self.pool.client confirmSignUp:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderConfirmSignUpResponse *> * _Nonnull task) {
        if (task.error) {
            self.confirmedStatus = AWSCognitoIdentityUserStatusUnconfirmed;
            return task;
        } else {
            self.confirmedStatus = AWSCognitoIdentityUserStatusConfirmed;
            AWSCognitoIdentityUserConfirmSignUpResponse * response = [AWSCognitoIdentityUserConfirmSignUpResponse new];
            [response aws_copyPropertiesFromObject:task.result];
            return [AWSTask taskWithResult:response];
        }
    }];
}


-(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *) confirmSignUp:(NSString *) confirmationCode
                                                       forceAliasCreation:(BOOL)forceAliasCreation {
    return [self confirmSignUp:confirmationCode forceAliasCreation:forceAliasCreation clientMetaData:nil];
}


-(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *) confirmSignUp:(NSString *) confirmationCode
                                                           clientMetaData:(nullable NSDictionary<NSString *,NSString *> *)clientMetaData {
    return [self confirmSignUp:confirmationCode forceAliasCreation:NO clientMetaData:clientMetaData];
}


-(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *) confirmSignUp:(NSString *) confirmationCode {
    return [self confirmSignUp:confirmationCode forceAliasCreation:NO clientMetaData:nil];
}


-(AWSTask<AWSCognitoIdentityUserForgotPasswordResponse *> *) forgotPassword:(nullable NSDictionary<NSString *, NSString*> *) clientMetaData {
    AWSCognitoIdentityProviderForgotPasswordRequest *request = [AWSCognitoIdentityProviderForgotPasswordRequest new];
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.username = self.username;
    request.secretHash = [self.pool calculateSecretHash:self.username];
    request.analyticsMetadata = [self.pool analyticsMetadata];
    request.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];
    request.clientMetadata = clientMetaData;
    
    return [[self.pool.client forgotPassword:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderForgotPasswordResponse *> * _Nonnull task) {
        AWSCognitoIdentityUserForgotPasswordResponse * response = [AWSCognitoIdentityUserForgotPasswordResponse new];
        [response aws_copyPropertiesFromObject:task.result];
        return [AWSTask taskWithResult:response];
    }];

}

-(AWSTask<AWSCognitoIdentityUserForgotPasswordResponse *> *) forgotPassword {
    return [self forgotPassword:nil];
}


-(AWSTask<AWSCognitoIdentityUserConfirmForgotPasswordResponse *> *) confirmForgotPassword: (NSString *)confirmationCode
                                                                                 password:(NSString *) password
                                                                           clientMetaData:(nullable NSDictionary<NSString *,NSString *> *)clientMetaData {
    AWSCognitoIdentityProviderConfirmForgotPasswordRequest *request = [AWSCognitoIdentityProviderConfirmForgotPasswordRequest new];
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.username = self.username;
    request.secretHash = [self.pool calculateSecretHash:self.username];
    request.password = password;
    request.confirmationCode = confirmationCode;
    request.analyticsMetadata = [self.pool analyticsMetadata];
    request.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];
    request.clientMetadata = clientMetaData;
    
    return [[self.pool.client confirmForgotPassword:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderConfirmForgotPasswordResponse *> * _Nonnull task) {
        AWSCognitoIdentityUserConfirmForgotPasswordResponse * response = [AWSCognitoIdentityUserConfirmForgotPasswordResponse new];
        [response aws_copyPropertiesFromObject:task.result];
        return [AWSTask taskWithResult:response];
    }];
}

-(AWSTask<AWSCognitoIdentityUserConfirmForgotPasswordResponse *> *) confirmForgotPassword: (NSString *)confirmationCode
                                                                                 password:(NSString *) password {
    return [self confirmForgotPassword:confirmationCode
                              password:password
                              clientMetaData:nil];
}

-(AWSTask<AWSCognitoIdentityUserResendConfirmationCodeResponse *> *) resendConfirmationCode: (nullable NSDictionary<NSString *,NSString *> *)clientMetaData {
    AWSCognitoIdentityProviderResendConfirmationCodeRequest *request = [AWSCognitoIdentityProviderResendConfirmationCodeRequest new];
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.username = self.username;
    request.secretHash = [self.pool calculateSecretHash:self.username];
    request.analyticsMetadata = [self.pool analyticsMetadata];
    request.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];
    request.clientMetadata = clientMetaData;

    return [[self.pool.client resendConfirmationCode:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderResendConfirmationCodeResponse *> * _Nonnull task) {
        AWSCognitoIdentityUserResendConfirmationCodeResponse * response = [AWSCognitoIdentityUserResendConfirmationCodeResponse new];
        [response aws_copyPropertiesFromObject:task.result];
        return [AWSTask taskWithResult:response];
    }];
}

-(AWSTask<AWSCognitoIdentityUserResendConfirmationCodeResponse *> *) resendConfirmationCode {
    return [self resendConfirmationCode: nil];
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
            AWSCognitoIdentityUserGetDetailsResponse * response = [AWSCognitoIdentityUserGetDetailsResponse new];
            [response aws_copyPropertiesFromObject:task.result];
            return [AWSTask taskWithResult:response];
        }];
    }];
}

- (BOOL) isSessionValid:(AWSCognitoIdentityUserSession * _Nonnull)session {
    // If id token is not present we only need to check the accessToken to determine the validity of the token.
    if (!session.idToken) {
        return [self isTokenValid:session.accessToken];
    } else {
        return [self isTokenValid:session.accessToken] && [self isTokenValid:session.idToken];
    }
    return false;
}

// Check if the token is valid or not. Returns true if the token is valid.
//
// The token is consider invalid if the token expiry is less than or equal to 2 min. This 2 minute buffer is
// given so that we do not hand over a token to the user which will get expired immediately. This guarrantees that the
// returned session tokens are valid for atleast 2 min.
- (BOOL) isTokenValid:(AWSCognitoIdentityUserSessionToken * _Nonnull)token {
    if ([token.tokenClaims valueForKey:@"exp"]) {
        int expiryWindow = 2 * 60;
        NSTimeInterval expiryInterval = [[token.tokenClaims valueForKey:@"exp"] doubleValue];
        NSDate *tokenExpiration =  [NSDate dateWithTimeIntervalSince1970:expiryInterval];
        return (tokenExpiration &&
                [tokenExpiration compare:[NSDate dateWithTimeIntervalSinceNow:expiryWindow]] == NSOrderedDescending);
    }
    return false;
}

/**
 Get a session
 */
-(AWSTask<AWSCognitoIdentityUserSession*> *) getSession {
    
    //check to see if we have valid tokens
    __block NSString * keyChainNamespace = [self keyChainNamespaceClientId];
    NSString * expirationTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserTokenExpiration];
    NSString * expirationDate = self.pool.keychain[expirationTokenKey];
    
    if(expirationDate){
        NSDate *expiration = [NSDate aws_dateFromString:expirationDate format:AWSDateISO8601DateFormat1];
        NSString * refreshToken = [self refreshTokenFromKeyChain:keyChainNamespace];

        // Token exists, the user is confirmed
        self.confirmedStatus = AWSCognitoIdentityUserStatusConfirmed;

        NSString * accessTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserAccessToken];
        NSString * idTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserIdToken];
        
        NSString * idToken = self.pool.keychain[idTokenKey];
        NSString * accessToken = self.pool.keychain[accessTokenKey];
        
        AWSCognitoIdentityUserSession * session;
        
        // Session is available if we have expiration and accessToken.
        if (expiration && accessToken) {
            session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken:idToken
                                                                 accessToken:accessToken
                                                                refreshToken:refreshToken
                                                              expirationTime:expiration];
        }

        // If the session expires > 2 minutes return it. We need to check both accessToken and id Token expiry
        // since user can change both of them in Cognito console.
        if(session
           && [self isSessionValid:session]
           && [expiration compare:[NSDate dateWithTimeIntervalSinceNow:2 * 60]] == NSOrderedDescending) {
            return [AWSTask taskWithResult:session];
        }
        //else refresh it using the refresh token
        else if(refreshToken){
            AWSCognitoIdentityProviderInitiateAuthRequest * request = [AWSCognitoIdentityProviderInitiateAuthRequest new];
            request.authFlow = AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth;
            request.clientId = self.pool.userPoolConfiguration.clientId;
            request.analyticsMetadata = [self.pool analyticsMetadata];
            request.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];
            
            NSMutableDictionary * authParameters = [[NSMutableDictionary alloc] initWithDictionary:@{@"REFRESH_TOKEN" : refreshToken}];
            
            //refresh token secret hash is actually client secret for this api, set it if it is supplied
            if(self.pool.userPoolConfiguration.clientSecret != nil){
                [authParameters setObject:self.pool.userPoolConfiguration.clientSecret forKey:@"SECRET_HASH"];
            }
            
            [self addDeviceKey:authParameters];
            
            request.authParameters = authParameters;
            return [[self.pool.client initiateAuth:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> * _Nonnull task) {
                if(task.error){
                    //If this token is no longer valid, fall back on interactive auth.
                    if(task.error.code == AWSCognitoIdentityProviderErrorNotAuthorized) {
                        return [self interactiveAuth];
                    } else {
                        return task;
                    }
                }
                
                AWSCognitoIdentityProviderInitiateAuthResponse *response = task.result;
                AWSCognitoIdentityProviderAuthenticationResultType *authResult = response.authenticationResult;
                /** Check to see if refreshToken is received in the response.
                 If not, load it from the keychain.
                 */
                NSString * refreshToken = authResult.refreshToken;
                if (refreshToken == nil){
                    NSString * keyChainNamespace = [self keyChainNamespaceClientId];
                    refreshToken = [self refreshTokenFromKeyChain:keyChainNamespace];
                }
                AWSCognitoIdentityUserSession * session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken: authResult.idToken accessToken:authResult.accessToken refreshToken:refreshToken expiresIn:authResult.expiresIn];
                [self updateUsernameAndPersistTokens:session];
                return [AWSTask taskWithResult:session];
            }];
        }
    }
    return [self setConfirmationStatus: [self interactiveAuth]];
}

- (AWSTask<AWSCognitoIdentityUserSession*>*) getSession:(NSString *) username
                                               password:(NSString *) password
                                         validationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*) validationData
                                         clientMetaData:(nullable NSDictionary<NSString *,NSString *> *) clientMetaData
                               isInitialCustomChallenge:(BOOL) isInitialCustomChallenge {
    AWSTask *authenticationTask = nil;
    if (self.pool.userPoolConfiguration.migrationEnabled) {
        authenticationTask = [self migrationAuth:username
                                        password:password
                                  validationData:validationData
                                  clientMetaData:clientMetaData
                                   lastChallenge:nil];
    } else {
        authenticationTask = [self srpAuthInternal:username
                                          password:password
                                    validationData:validationData
                                    clientMetaData:clientMetaData
                                     lastChallenge:nil
                          isInitialCustomChallenge:isInitialCustomChallenge];
    }
    
    return [self setConfirmationStatus: [authenticationTask continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
        
        return [self getSessionInternal:task];
        
    }]];
}

- (AWSTask<AWSCognitoIdentityUserSession*>*) getSession:(NSString *) username
                                               password:(NSString *) password
                                         validationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*) validationData
                               isInitialCustomChallenge:(BOOL) isInitialCustomChallenge {
    return [self getSession:username password:password validationData:validationData clientMetaData:nil isInitialCustomChallenge:isInitialCustomChallenge];
}

/**
 * Explicitly get a session without using any cached tokens/refresh tokens.
 */
- (AWSTask<AWSCognitoIdentityUserSession*>*) getSession:(NSString *) username
                                               password:(NSString *) password
                                         validationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*) validationData {
    return [self getSession:username
                   password:password
             validationData:validationData
            clientMetaData:nil
   isInitialCustomChallenge:NO];
}

- (AWSTask<AWSCognitoIdentityUserSession*>*) getSession:(NSString *) username
                                               password:(NSString *) password
                                         validationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*) validationData
                                         clientMetaData:(nullable NSDictionary<NSString *,NSString *> *) clientMetaData {
    return [self getSession:username
                   password:password
             validationData:validationData
            clientMetaData:clientMetaData
   isInitialCustomChallenge:NO];
}

- (AWSTask<AWSCognitoIdentityUserSession*>*) setConfirmationStatus: (AWSTask<AWSCognitoIdentityUserSession*>*) task {
    
    // If the user status is unknown
    if (self.confirmedStatus == AWSCognitoIdentityUserStatusUnknown) {
        if (task.error) {
            if (task.error.code == AWSCognitoIdentityProviderErrorUserNotConfirmed) {
                self.confirmedStatus = AWSCognitoIdentityUserStatusUnconfirmed;
            }
        } else {
            self.confirmedStatus = AWSCognitoIdentityUserStatusConfirmed;
        }
    }
    return task;
}


- (AWSTask<AWSCognitoIdentityUserSession*>*) getSessionInternal: (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *>*) task{
    return [task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
        AWSCognitoIdentityProviderRespondToAuthChallengeResponse * authenticateResult = task.result;
        AWSCognitoIdentityProviderAuthenticationResultType * authResult = task.result.authenticationResult;
        AWSCognitoIdentityProviderChallengeNameType nextChallenge = authenticateResult.challengeName;

        AWSCognitoIdentityUserSession * session = nil;
        //No more challenges we have a session
        if(authResult != nil){
            session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken:authResult.idToken accessToken:authResult.accessToken refreshToken:authResult.refreshToken expiresIn:authResult.expiresIn];
        }
        
        //last step is to perform device auth if device key is supplied or we are being challenged with device auth
        if(authResult.latestDeviceMetadata != nil || nextChallenge == AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth){
            return [self performDeviceAuth: task session:session];
        }
        
        //if mfa required, present mfa challenge
        if(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa == nextChallenge || AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa == nextChallenge){
            if ([self.pool.delegate respondsToSelector:@selector(startMultiFactorAuthentication)]) {
                BOOL isSoftwareToken = AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa == nextChallenge;
                id<AWSCognitoIdentityMultiFactorAuthentication> authenticationDelegate = [self.pool.delegate startMultiFactorAuthentication];
                NSString *deliveryMedium = isSoftwareToken ?  @"SOFTWARE_TOKEN" : authenticateResult.challengeParameters[@"CODE_DELIVERY_DELIVERY_MEDIUM"];
                NSString *destination = isSoftwareToken ? authenticateResult.challengeParameters[@"FRIENDLY_DEVICE_NAME"] : authenticateResult.challengeParameters[@"CODE_DELIVERY_DESTINATION"];
                return [self mfaAuthInternal:deliveryMedium destination:destination authState:authenticateResult.session challengeName:nextChallenge authenticationDelegate:authenticationDelegate];
                
            }else {
                return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"startMultiFactorAuthentication not implemented by authentication delegate"}]];
            }
        }else if(AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType == nextChallenge){
            return [self startSelectMfaUI:authenticateResult];
        }else if(AWSCognitoIdentityProviderChallengeNameTypeMfaSetup == nextChallenge){
            return [self startMfaSetupRequiredUI:authenticateResult];
        }else if(AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired == nextChallenge){
            return [self startNewPasswordRequiredUI:authenticateResult];
        }else if(AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth == nextChallenge){ //if srp auth happens mid auth
            return [self startPasswordAuthenticationUI:authenticateResult];
        }else if (session) { //we have a session, return it
            [self updateUsernameAndPersistTokens:session];
            return [AWSTask taskWithResult:session];
        }else { //this is a custom challenge
            id<AWSCognitoIdentityCustomAuthentication> authenticationDelegate = nil;
            // The below condition is added to support AWSMobileClient.
            if (self.pool.isCustomAuth && [self.pool.delegate respondsToSelector:@selector(startCustomAuthentication_v2)]) {
                authenticationDelegate = [self.pool.delegate performSelector:@selector(startCustomAuthentication_v2)];
            } else if ([self.pool.delegate respondsToSelector:@selector(startCustomAuthentication)]) {
                authenticationDelegate = [self.pool.delegate startCustomAuthentication];
            }
            if (authenticationDelegate != nil) {
                if ([authenticateResult.challengeParameters objectForKey:@"USERNAME"] != nil) {
                    self.username = [authenticateResult.challengeParameters objectForKey:@"USERNAME"];
                }
                AWSCognitoIdentityCustomAuthenticationInput *input = [AWSCognitoIdentityCustomAuthenticationInput new];
                input.challengeParameters = authenticateResult.challengeParameters;
                AWSTaskCompletionSource<AWSCognitoIdentityCustomChallengeDetails *> *challengeDetails = [AWSTaskCompletionSource<AWSCognitoIdentityCustomChallengeDetails *> new];
                [authenticationDelegate getCustomChallengeDetails:input customAuthCompletionSource:challengeDetails];
                return [challengeDetails.task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityCustomChallengeDetails *> * _Nonnull task) {
                    
                    return [[self performRespondCustomAuthChallenge:task.result session:authenticateResult.session] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
                        
                        [authenticationDelegate didCompleteCustomAuthenticationStepWithError:task.error];
                        return [self getSessionInternal: task];
                    }];
                    
                }];
                
            } else {
                return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"startCustomAuthentication not implemented by authentication delegate"}]];
            }
        }
    }];
}

- (AWSTask<AWSCognitoIdentityUserSession*>*) startPasswordAuthenticationUI:(AWSCognitoIdentityProviderRespondToAuthChallengeResponse*) lastChallenge {
    if([self.pool.delegate respondsToSelector:@selector(startPasswordAuthentication)]){
        id<AWSCognitoIdentityPasswordAuthentication> authenticationDelegate = [self.pool.delegate startPasswordAuthentication];
        return [self passwordAuthInternal:authenticationDelegate lastChallenge:lastChallenge isInitialCustomChallenge:lastChallenge == nil];
    }else {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"startPasswordAuthentication must be implemented on your AWSCognitoIdentityInteractiveAuthenticationDelegate"}]];
    }
}

- (AWSTask<AWSCognitoIdentityUserSession*>*) startNewPasswordRequiredUI:(AWSCognitoIdentityProviderRespondToAuthChallengeResponse*) lastChallenge {
    if ([self.pool.delegate respondsToSelector:@selector(startNewPasswordRequired)]) {
        id<AWSCognitoIdentityNewPasswordRequired> newPasswordRequiredDelegate = [self.pool.delegate startNewPasswordRequired];
        NSString * userAttributes = lastChallenge.challengeParameters[@"userAttributes"];
        NSString * requiredAttributes = lastChallenge.challengeParameters[@"requiredAttributes"];
        NSDictionary<NSString*, NSString *> *userAttributesDict = [NSMutableDictionary new];
        NSMutableSet<NSString*> *requiredAttributesSet = [NSMutableSet new];
        
        if(requiredAttributes) {
            NSArray * requiredAttributesArray = [NSJSONSerialization JSONObjectWithData:[requiredAttributes dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
            for (NSString * requiredAttribute in requiredAttributesArray) {
                //strip off userAttributes. from all the attribute names
                NSString *strippedKey = [requiredAttribute substringFromIndex:[AWSCognitoIdentityUserUserAttributePrefix length]];
                [requiredAttributesSet addObject:strippedKey];
            }
        }
        AWSCognitoIdentityNewPasswordRequiredInput *newPasswordRequiredInput = [[AWSCognitoIdentityNewPasswordRequiredInput alloc] initWithUserAttributes:userAttributesDict requiredAttributes:requiredAttributesSet];
        AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails *> *newPasswordRequiredDetails = [AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails *> new];
        [newPasswordRequiredDelegate getNewPasswordDetails:newPasswordRequiredInput newPasswordRequiredCompletionSource:newPasswordRequiredDetails];
        return [[newPasswordRequiredDetails.task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityNewPasswordRequiredDetails *> * _Nonnull task) {
            return [self performRespondToNewPasswordChallenge:task.result session:lastChallenge.session];
        }] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
            [newPasswordRequiredDelegate didCompleteNewPasswordStepWithError:task.error];
            if(task.error){
                return [self startNewPasswordRequiredUI:lastChallenge];
            }
            return [self getSessionInternal:task];
        }];
        
    }else {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"startNewPasswordRequired not implemented by authentication delegate"}]];
    }
}

- (AWSTask<AWSCognitoIdentityUserSession*>*) startMfaSetupRequiredUI:(AWSCognitoIdentityProviderRespondToAuthChallengeResponse*) lastChallenge {
    NSString * availableMfas = lastChallenge.challengeParameters[@"MFAS_CAN_SETUP"];
    NSMutableSet<NSString*> *availableMfasSet = [NSMutableSet new];
    
    if(availableMfas) {
        NSArray * availableMfasArray = [NSJSONSerialization JSONObjectWithData:[availableMfas dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
        for (NSString * availableMfa in availableMfasArray) {
            [availableMfasSet addObject:availableMfa];
        }
    }
    
    if([availableMfasSet containsObject:@"SOFTWARE_TOKEN_MFA"]){
        if ([self.pool.delegate respondsToSelector:@selector(startSoftwareMfaSetupRequired)]) {
            id<AWSCognitoIdentitySoftwareMfaSetupRequired> softwareMfaSetupRequiredDelegate = [self.pool.delegate startSoftwareMfaSetupRequired];
            AWSCognitoIdentityProviderAssociateSoftwareTokenRequest *request = [AWSCognitoIdentityProviderAssociateSoftwareTokenRequest new];
            request.session = lastChallenge.session;
            return [[self.pool.client associateSoftwareToken:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderAssociateSoftwareTokenResponse *> * _Nonnull task) {
                AWSCognitoIdentitySoftwareMfaSetupRequiredInput *softwareMfaSetupRequiredInput = [[AWSCognitoIdentitySoftwareMfaSetupRequiredInput alloc] initWithSecretCode:task.result.secretCode username:self.username];
                return [self verifyMfaSetup:task.result.session selectMfaDelegate:softwareMfaSetupRequiredDelegate input:softwareMfaSetupRequiredInput];
            }];
        } else {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"startSoftwareMfaSetupRequired not implemented by authentication delegate"}]];
        }
    } else {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"This version of the SDK does not support setup of the MFA types necessary to authenticate"}]];
    }
    
}

- (AWSTask<AWSCognitoIdentityUserSession*>*) verifyMfaSetup:(NSString *) session selectMfaDelegate:(id<AWSCognitoIdentitySoftwareMfaSetupRequired> ) softwareMfaSetupRequiredDelegate input:(AWSCognitoIdentitySoftwareMfaSetupRequiredInput *) input {
        AWSTaskCompletionSource<AWSCognitoIdentitySoftwareMfaSetupRequiredDetails *> *softwareMfaSetupRequiredDetails = [AWSTaskCompletionSource<AWSCognitoIdentitySoftwareMfaSetupRequiredDetails *> new];
        [softwareMfaSetupRequiredDelegate getSoftwareMfaSetupDetails:input softwareMfaSetupRequiredCompletionSource:softwareMfaSetupRequiredDetails];
        return [[softwareMfaSetupRequiredDetails.task continueWithSuccessBlock:^id _Nullable(AWSTask <AWSCognitoIdentitySoftwareMfaSetupRequiredDetails *>* _Nonnull mfaDetails) {
        AWSCognitoIdentityProviderVerifySoftwareTokenRequest *verifyRequest = [AWSCognitoIdentityProviderVerifySoftwareTokenRequest new];
        verifyRequest.session = session;
        verifyRequest.friendlyDeviceName = mfaDetails.result.friendlyDeviceName;
        verifyRequest.userCode = mfaDetails.result.userCode;
        return [self.pool.client verifySoftwareToken:verifyRequest];
    }] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderVerifySoftwareTokenResponse *> *_Nonnull verifySoftwareToken) {
        [softwareMfaSetupRequiredDelegate didCompleteMfaSetupStepWithError:verifySoftwareToken.error];
        if(verifySoftwareToken.error){
            return [self verifyMfaSetup:session selectMfaDelegate:softwareMfaSetupRequiredDelegate input:input];
        }
        
        NSMutableDictionary<NSString *,NSString *> *challengeResponses = [NSMutableDictionary new];
        
        return [self getSessionInternal:[self performRespondToAuthChallenge:challengeResponses challengeName:AWSCognitoIdentityProviderChallengeNameTypeMfaSetup session:verifySoftwareToken.result.session]];
    }];
}

- (AWSTask<AWSCognitoIdentityUserSession*>*) startSelectMfaUI:(AWSCognitoIdentityProviderRespondToAuthChallengeResponse*) lastChallenge {
    if ([self.pool.delegate respondsToSelector:@selector(startSelectMfa)]) {
        id<AWSCognitoIdentitySelectMfa> selectMfaDelegate = [self.pool.delegate startSelectMfa];
        NSString * availableMfas = lastChallenge.challengeParameters[@"MFAS_CAN_CHOOSE"];
        NSMutableDictionary<NSString*,NSString*> *availableMfasDict = [NSMutableDictionary new];
        
        if(availableMfas) {
            NSArray * availableMfasArray = [NSJSONSerialization JSONObjectWithData:[availableMfas dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
            for (NSString * availableMfa in availableMfasArray) {
                NSString *value = nil;
                if([@"SOFTWARE_TOKEN_MFA" isEqualToString:availableMfa]){
                    value = lastChallenge.challengeParameters[@"FRIENDLY_DEVICE_NAME"];
                }else if([@"SMS_MFA" isEqualToString:availableMfa]){
                    value = lastChallenge.challengeParameters[@"CODE_DELIVERY_DESTINATION"];
                }
                if(value == nil){
                    value = @"unknown";
                }
                [availableMfasDict setObject:value forKey:availableMfa];
            }
        }
        AWSCognitoIdentitySelectMfaInput *selectMfaInput = [[AWSCognitoIdentitySelectMfaInput alloc] initWithAvailableMfas:availableMfasDict];
        AWSTaskCompletionSource<AWSCognitoIdentitySelectMfaDetails *> *selectMfaDetails = [AWSTaskCompletionSource<AWSCognitoIdentitySelectMfaDetails *> new];
        [selectMfaDelegate getSelectMfaDetails:selectMfaInput selectMfaCompletionSource:selectMfaDetails];
        return [[selectMfaDetails.task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentitySelectMfaDetails *> * _Nonnull task) {
            return [self performRespondToSelectMfaChallenge:task.result session:lastChallenge.session];
        }] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
            [selectMfaDelegate didCompleteSelectMfaStepWithError:task.error];
            if(task.error){
                return [self startSelectMfaUI:lastChallenge];
            }
            return [self getSessionInternal:task];
        }];
    }else {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"startSelectMfa not implemented by authentication delegate"}]];
    }
}

- (AWSTask<AWSCognitoIdentityUserSession*>*) performDeviceAuth:(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *>*) lastChallengeResponse session: (AWSCognitoIdentityUserSession *) session {
    if(session){
        [self updateUsernameAndPersistTokens:session];
    }
    if(lastChallengeResponse.result.challengeName == AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth){
        return [[self deviceAuthInternal:lastChallengeResponse] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
            if(task.cancelled || task.error) {
                return task;
            }else {
                AWSCognitoIdentityProviderRespondToAuthChallengeResponse *response = task.result;
                AWSCognitoIdentityUserSession * session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken:response.authenticationResult.idToken accessToken:response.authenticationResult.accessToken refreshToken:response.authenticationResult.refreshToken expiresIn:response.authenticationResult.expiresIn];
                [self updateUsernameAndPersistTokens:session];
                return [AWSTask taskWithResult:session];
            }
        }];
    }else {
        return [[self confirmDeviceInternal:lastChallengeResponse.result.authenticationResult] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if(task.error || task.isCancelled){
                return task;
            }else {
                return [AWSTask taskWithResult:session];
            }
        }];
    }
}

/**
 * Generates a device password, calls service to exchange the password verifier and prompts user to remember the device as required.
 */
- (AWSTask*) confirmDeviceInternal:(AWSCognitoIdentityProviderAuthenticationResultType *) authResult {
    if(authResult.latestDeviceMetadata != nil){
        NSString * deviceKey = authResult.latestDeviceMetadata.deviceKey;
        NSString * deviceGroup = authResult.latestDeviceMetadata.deviceGroupKey;
        if(deviceKey != nil){
            NSString *secret = [[NSUUID UUID] UUIDString];
            AWSCognitoIdentityProviderConfirmDeviceRequest * request = [AWSCognitoIdentityProviderConfirmDeviceRequest new];
            request.accessToken = authResult.accessToken;
            request.deviceKey = deviceKey;
            request.deviceName = [[UIDevice currentDevice] name];

            AWSCognitoIdentityProviderSrpHelper * srpHelper = [[AWSCognitoIdentityProviderSrpHelper alloc] initWithPoolName:deviceGroup userName:deviceKey password:secret];
            request.deviceSecretVerifierConfig = [AWSCognitoIdentityProviderDeviceSecretVerifierConfigType new];
            request.deviceSecretVerifierConfig.salt = [[NSData aws_dataWithSignedBigInteger:srpHelper.salt] base64EncodedStringWithOptions:0];
            request.deviceSecretVerifierConfig.passwordVerifier = [[NSData aws_dataWithSignedBigInteger:srpHelper.v] base64EncodedStringWithOptions:0];
            return [[self.pool.client confirmDevice:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderConfirmDeviceResponse *> * _Nonnull task) {
                [self persistDevice:deviceKey deviceSecret:secret deviceGroup:deviceGroup];
                AWSCognitoIdentityProviderConfirmDeviceResponse *confirmDeviceResponse = task.result;
                if([confirmDeviceResponse.userConfirmationNecessary boolValue]) {
                    if ([self.pool.delegate respondsToSelector:@selector(startRememberDevice)]) {
                        id<AWSCognitoIdentityRememberDevice> rememberDeviceStep = [self.pool.delegate startRememberDevice];
                        AWSTaskCompletionSource<NSNumber *> *rememberDevice = [[AWSTaskCompletionSource<NSNumber *> alloc] init];
                        [rememberDeviceStep getRememberDevice:rememberDevice];
                        return [rememberDevice.task continueWithBlock:^id _Nullable(AWSTask<NSNumber *> * _Nonnull rememberDeviceTask) {
                            if(rememberDeviceTask.isCancelled || rememberDeviceTask.error){
                                [rememberDeviceStep didCompleteRememberDeviceStepWithError:rememberDeviceTask.error];
                                return rememberDeviceStep;
                            }else if ([rememberDeviceTask.result boolValue]){
                                AWSCognitoIdentityProviderUpdateDeviceStatusRequest * request = [AWSCognitoIdentityProviderUpdateDeviceStatusRequest new];
                                request.accessToken = authResult.accessToken;
                                request.deviceKey = deviceKey;
                                request.deviceRememberedStatus = AWSCognitoIdentityProviderDeviceRememberedStatusTypeRemembered;
                                return [[self.pool.client updateDeviceStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderUpdateDeviceStatusResponse *> * _Nonnull updateDeviceStatusTask) {
                                    [rememberDeviceStep didCompleteRememberDeviceStepWithError:rememberDeviceTask.error];
                                    return updateDeviceStatusTask;
                                }];
                            }
                            return task;
                        }];


                    }else {
                        AWSDDLogWarn(@"startRememberDevice is not implemented by authentication delegate, defaulting to not remembered.");
                    }
                }
                return task;
            }];
        }
    }
    return [AWSTask taskWithResult:nil];
}

/**
 * Kick off interactive auth to prompt developer to challenge end user for credentials
 */
- (AWSTask<AWSCognitoIdentityUserSession*>*) interactiveAuth {
    if (self.pool.delegate != nil) {
        // The below condition is added to support AWSMobileClient. 
        if (self.pool.isCustomAuth &&
            [self.pool.delegate respondsToSelector:@selector(startCustomAuthentication_v2)]) {
            id<AWSCognitoIdentityCustomAuthentication> authenticationDelegate = [self.pool.delegate performSelector:@selector(startCustomAuthentication_v2)];
            return [self customAuthInternal:authenticationDelegate];
        }

        if ([self.pool.delegate respondsToSelector:@selector(startCustomAuthentication)] && !self.pool.userPoolConfiguration.migrationEnabled) {
            id<AWSCognitoIdentityCustomAuthentication> authenticationDelegate = [self.pool.delegate startCustomAuthentication];
            return [self customAuthInternal:authenticationDelegate];
        }

        if ([self.pool.delegate respondsToSelector:@selector(startPasswordAuthentication)]) {
            id<AWSCognitoIdentityPasswordAuthentication> authenticationDelegate = [self.pool.delegate startPasswordAuthentication];
            return [self passwordAuthInternal:authenticationDelegate lastChallenge:nil isInitialCustomChallenge:NO];
        }

        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain
                                                          code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"Either startCustomAuthentication or startPasswordAuthentication must be implemented on your AWSCognitoIdentityInteractiveAuthenticationDelegate"}]];
        
    } else {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain
                                                          code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"Authentication delegate not set"}]];
    };
}

/**
 * Prompt developer to obtain username/password and do SRP auth
 */
- (AWSTask<AWSCognitoIdentityUserSession*>*) passwordAuthInternal: (id<AWSCognitoIdentityPasswordAuthentication>) authenticationDelegate
                                                    lastChallenge:(AWSCognitoIdentityProviderRespondToAuthChallengeResponse*) lastChallenge
                                         isInitialCustomChallenge:(BOOL) isInitialCustomChallenge {
    
    AWSCognitoIdentityPasswordAuthenticationInput * input = [[AWSCognitoIdentityPasswordAuthenticationInput alloc] initWithLastKnownUsername:[self.pool currentUsername]];
    AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails*>*passwordAuthenticationDetails = [AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails*> new];
    [authenticationDelegate getPasswordAuthenticationDetails:input
                      passwordAuthenticationCompletionSource:passwordAuthenticationDetails];
    
    return [passwordAuthenticationDetails.task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityPasswordAuthenticationDetails *> * _Nonnull task) {
        AWSCognitoIdentityPasswordAuthenticationDetails * authDetails = task.result;
        
        if (self.pool.userPoolConfiguration.migrationEnabled) {
            return [[self migrationAuth:authDetails.username
                               password:authDetails.password
                         validationData:authDetails.validationData
                        clientMetaData:nil
                          lastChallenge:lastChallenge]
                    continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
                        
                        [authenticationDelegate didCompletePasswordAuthenticationStepWithError:task.error];
                        if (task.isCancelled) {
                            return task;
                        }
                        if (task.error) {
                            //retry password auth on error
                            return [self passwordAuthInternal:authenticationDelegate
                                                lastChallenge:lastChallenge
                                     isInitialCustomChallenge:NO];
                        } else {
                            //morph this initiate auth response into a respond to auth challenge response so it works as input to getSessionInternal
                            AWSCognitoIdentityProviderRespondToAuthChallengeResponse * response = [AWSCognitoIdentityProviderRespondToAuthChallengeResponse new];
                            [response aws_copyPropertiesFromObject:task.result];
                            return [self getSessionInternal:[AWSTask taskWithResult:response]];
                        }
                    }];
        } else {
            return [[self srpAuthInternal:authDetails.username
                                 password:authDetails.password
                           validationData:authDetails.validationData
                           clientMetaData:nil
                            lastChallenge:lastChallenge
                 isInitialCustomChallenge:isInitialCustomChallenge]
                    continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
                        
                        [authenticationDelegate didCompletePasswordAuthenticationStepWithError:task.error];
                        if (task.isCancelled) {
                            return task;
                        }
                        if (task.error) {
                            //retry password auth on error
                            return [self passwordAuthInternal:authenticationDelegate
                                                lastChallenge:lastChallenge
                                     isInitialCustomChallenge:isInitialCustomChallenge];
                        } else {
                            return [self getSessionInternal:task];
                        }
                    }];
        }
    }];
}

/**
 * Pass username and password in plaintext so developer can validate login and migrate as appropriate.
 **/
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) migrationAuth:(NSString *)username
                                                                             password:(NSString *)password
                                                                       validationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*)validationData
                                                                       clientMetaData:(nullable NSDictionary<NSString *,NSString *> *)clientMetaData
                                                                        lastChallenge:(AWSCognitoIdentityProviderRespondToAuthChallengeResponse*) lastChallenge {
    self.username = username;
    NSMutableDictionary *challengeResponses = [NSMutableDictionary new];
    [self addSecretHashDeviceKeyAndUsername:challengeResponses];
    [challengeResponses setObject:password forKey:@"PASSWORD"];

    if(lastChallenge){
        AWSCognitoIdentityProviderRespondToAuthChallengeRequest *input = [AWSCognitoIdentityProviderRespondToAuthChallengeRequest new];
        input.challengeName = lastChallenge.challengeName;
        input.challengeResponses = challengeResponses;
        input.session = lastChallenge.session;
        input.analyticsMetadata = [self.pool analyticsMetadata];
        input.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];
        input.clientMetadata = clientMetaData;

        return [[self.pool.client respondToAuthChallenge:input] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
            return [self forgetDeviceOnRespondDeviceNotFoundError:task retryContinuation:^AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> *{
                return [self migrationAuth:username password:password validationData:validationData clientMetaData:clientMetaData lastChallenge:lastChallenge];
            }];
        }];
    }
    else{
        AWSCognitoIdentityProviderInitiateAuthRequest *input = [AWSCognitoIdentityProviderInitiateAuthRequest new];
        input.clientId = self.pool.userPoolConfiguration.clientId;
        input.clientMetadata = [self.pool getValidationData:validationData clientMetaData: clientMetaData];
        input.analyticsMetadata = [self.pool analyticsMetadata];
        input.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];
        input.authFlow = AWSCognitoIdentityProviderAuthFlowTypeUserPasswordAuth;
        input.authParameters = challengeResponses;
        
        return [[self.pool.client initiateAuth:input] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> * _Nonnull task) {
            //if there was an error, it may be due to the device being forgotten, reset the device and retry if that is the case
            return [self forgetDeviceOnInitiateDeviceNotFoundError:task retryContinuation:^AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> *{
                return [self migrationAuth:username password:password validationData:validationData clientMetaData:clientMetaData lastChallenge:lastChallenge];
            }];
        }];
    }
}


/**
 * Prompt developer to obtain custom challenge details
 */
- (AWSTask<AWSCognitoIdentityUserSession*>*) customAuthInternal: (id<AWSCognitoIdentityCustomAuthentication>) authenticationDelegate {
    
    AWSTaskCompletionSource<AWSCognitoIdentityCustomChallengeDetails *> *customAuthenticationDetails = [AWSTaskCompletionSource<AWSCognitoIdentityCustomChallengeDetails *> new];
    AWSCognitoIdentityCustomAuthenticationInput *input = [[AWSCognitoIdentityCustomAuthenticationInput alloc] initWithChallengeParameters: [NSDictionary new]];
    [authenticationDelegate getCustomChallengeDetails:input customAuthCompletionSource:customAuthenticationDetails];
    return [customAuthenticationDetails.task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityCustomChallengeDetails *> * _Nonnull task) {
        
        //if first challenge is SRP auth
        if([self isFirstCustomStepSRP:task.result]){
            return [self startPasswordAuthenticationUI:nil];
        }else {
            return [[self performInitiateCustomAuthChallenge:task.result]
                    continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> * _Nonnull task) {
                [authenticationDelegate didCompleteCustomAuthenticationStepWithError:task.error];
                if(task.isCancelled){
                    return task;
                }
                if(task.error){
                    //retry auth on error
                    return [self customAuthInternal:authenticationDelegate];
                }else {
                    //morph this initiate auth response into a respond to auth challenge response so it works as input to getSessionInternal
                    AWSCognitoIdentityProviderRespondToAuthChallengeResponse * response = [AWSCognitoIdentityProviderRespondToAuthChallengeResponse new];
                    [response aws_copyPropertiesFromObject:task.result];
                    return [self getSessionInternal:[AWSTask taskWithResult:response]];
                }
            }];
        }
    }];
}

- (BOOL) isFirstCustomStepSRP: (AWSCognitoIdentityCustomChallengeDetails *) customAuthenticationDetails {
    return customAuthenticationDetails.initialChallengeName != nil && [@"SRP_A" isEqualToString: customAuthenticationDetails.initialChallengeName];
}


/**
 * Run initiate auth on challenge responses from end user for custom auth
 */
- (AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse*>*) performInitiateCustomAuthChallenge: (AWSCognitoIdentityCustomChallengeDetails *) challengeDetails {
    AWSCognitoIdentityProviderInitiateAuthRequest *input = [AWSCognitoIdentityProviderInitiateAuthRequest new];
    input.clientId = self.pool.userPoolConfiguration.clientId;
    input.clientMetadata = [self.pool getValidationData:challengeDetails.validationData clientMetaData:challengeDetails.clientMetaData];
    input.analyticsMetadata = [self.pool analyticsMetadata];
    input.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];

    
    NSMutableDictionary * authParameters = [[NSMutableDictionary alloc] initWithDictionary:challengeDetails.challengeResponses];
    [self addSecretHashDeviceKeyAndUsername:authParameters];
    
    if(challengeDetails.initialChallengeName != nil){
        [authParameters setObject:challengeDetails.initialChallengeName forKey:@"CHALLENGE_NAME"];
    }
    
    input.authFlow = AWSCognitoIdentityProviderAuthFlowTypeCustomAuth;
    input.authParameters = authParameters;
    
    return [[self.pool.client initiateAuth:input] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> * _Nonnull task) {
        //if there was an error, it may be due to the device being forgotten, reset the device and retry if that is the case
        return [self forgetDeviceOnInitiateDeviceNotFoundError:task retryContinuation:^AWSTask *{
                return [self performInitiateCustomAuthChallenge:challengeDetails];
        }];
    }];
}


/**
 * Run respond to auth challenges on challenge responses from end user for custom auth
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) performRespondCustomAuthChallenge: (AWSCognitoIdentityCustomChallengeDetails *) challengeDetails session: (NSString *) session{
    NSMutableDictionary<NSString *,NSString *> *challengeResponses = [NSMutableDictionary new];
    [challengeResponses addEntriesFromDictionary:challengeDetails.challengeResponses];
    
    if([challengeResponses objectForKey:@"USERNAME"] != nil){
        self.username = [challengeResponses objectForKey:@"USERNAME"];
    }
    return [[self performRespondToAuthChallenge: challengeResponses
                                  challengeName: AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge
                                 clientMetaData: challengeDetails.clientMetaData
                                        session: session] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
        //if there was an error, it may be due to the device being forgotten, reset the device and retry if that is the case
        return [self forgetDeviceOnRespondDeviceNotFoundError:task retryContinuation:^AWSTask *{
            return [self performRespondCustomAuthChallenge:challengeDetails session:session];
        }];
    }];
}


/**
 * Run respond to auth challenges on new password required responses from end user
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) performRespondToNewPasswordChallenge: (AWSCognitoIdentityNewPasswordRequiredDetails *) details session: (NSString *) session{
    NSMutableDictionary<NSString *,NSString *> *challengeResponses = [NSMutableDictionary new];
    [challengeResponses setObject:details.proposedPassword forKey:@"NEW_PASSWORD"];
    
    for(AWSCognitoIdentityUserAttributeType *userAttribute in details.userAttributes){
        [challengeResponses setObject:userAttribute.value forKey: [NSString stringWithFormat:@"%@%@", AWSCognitoIdentityUserUserAttributePrefix, userAttribute.name]];
    }
    
    return [self performRespondToAuthChallenge:challengeResponses
                                 challengeName:AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired
                                clientMetaData: details.clientMetaData
                                       session:session];
}


/**
 * Run respond to auth challenges on select mfa responses from end user
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) performRespondToSelectMfaChallenge: (AWSCognitoIdentitySelectMfaDetails *) details session: (NSString *) session{
    NSMutableDictionary<NSString *,NSString *> *challengeResponses = [NSMutableDictionary new];
    [challengeResponses setObject:details.selectedMfa forKey:@"ANSWER"];
    return [self performRespondToAuthChallenge:challengeResponses challengeName:AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType session:session];
}


/**
 * Run respond to auth challenges
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) performRespondToAuthChallenge: (NSMutableDictionary *) challengeResponses
                                                                                        challengeName: (AWSCognitoIdentityProviderChallengeNameType) challengeName
                                                                                              session: (NSString *) session {
    return [self performRespondToAuthChallenge:challengeResponses
                                 challengeName:challengeName
                                clientMetaData: nil
                                       session:session];
}

/**
 * Run respond to auth challenges
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) performRespondToAuthChallenge:(NSMutableDictionary *) challengeResponses
                                                                                        challengeName:(AWSCognitoIdentityProviderChallengeNameType) challengeName
                                                                                       clientMetaData:(NSDictionary *) clientMetaData
                                                                                              session:(NSString *) session {
    AWSCognitoIdentityProviderRespondToAuthChallengeRequest *request = [AWSCognitoIdentityProviderRespondToAuthChallengeRequest new];
    request.session = session;
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.challengeName = challengeName;
    request.clientMetadata = clientMetaData;
    request.analyticsMetadata = [self.pool analyticsMetadata];
    request.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];

    [self addSecretHashDeviceKeyAndUsername:challengeResponses];
    request.challengeResponses = challengeResponses;

    return [self.pool.client respondToAuthChallenge:request];
}
/**
 * Perform SRP based authentication (initiateAuth(SRP_AUTH) and respondToAuthChallenge) given a username and password. If lastChallenge is supplied it starts with respondToAuthChallenge instead of initiate.
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) srpAuthInternal:(NSString *)username
                                                                               password:(NSString *)password
                                                                         validationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*)validationData
                                                                         clientMetaData:(nullable NSDictionary<NSString *,NSString *> *) clientMetaData
                                                                          lastChallenge:(AWSCognitoIdentityProviderRespondToAuthChallengeResponse*) lastChallenge isInitialCustomChallenge:(BOOL) isInitialCustomChallenge {
    self.username = username;
    AWSCognitoIdentityProviderSrpHelper *srpHelper = [AWSCognitoIdentityProviderSrpHelper beginUserAuthentication:self.username password:password];
    NSMutableDictionary * challengeResponses = [[NSMutableDictionary alloc] initWithDictionary:@{@"SRP_A" : [srpHelper.clientState.publicA stringValueWithRadix:16]}];
    [self addSecretHashDeviceKeyAndUsername:challengeResponses];
    
    if(lastChallenge){
        AWSCognitoIdentityProviderRespondToAuthChallengeRequest *input = [AWSCognitoIdentityProviderRespondToAuthChallengeRequest new];
        input.clientId = self.pool.userPoolConfiguration.clientId;
        input.challengeName = lastChallenge.challengeName;
        input.challengeResponses = challengeResponses;
        input.session = lastChallenge.session;
        input.analyticsMetadata = [self.pool analyticsMetadata];
        input.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];
        input.clientMetadata = clientMetaData;

        return [[self.pool.client respondToAuthChallenge:input] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
            //if there was an error, it may be due to the device being forgotten, reset the device and retry if that is the case
            return [[self forgetDeviceOnRespondDeviceNotFoundError:task retryContinuation:^AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> *{
                return [self srpAuthInternal:username password:password validationData:validationData clientMetaData: clientMetaData lastChallenge:lastChallenge isInitialCustomChallenge:isInitialCustomChallenge];
            }] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> * _Nonnull task) {
                //morph this initiate auth response into a respond to auth challenge response so it works as input to srpAuthInternalStep2
                AWSCognitoIdentityProviderRespondToAuthChallengeResponse * response = [AWSCognitoIdentityProviderRespondToAuthChallengeResponse new];
                [response aws_copyPropertiesFromObject:task.result];
                //continue with second step of SRP auth
                return [self srpAuthInternalStep2:[AWSTask taskWithResult:response] srpHelper:srpHelper clientMetaData:clientMetaData];
            }];
        }];
    }else{
        AWSCognitoIdentityProviderInitiateAuthRequest *input = [AWSCognitoIdentityProviderInitiateAuthRequest new];
        input.clientId = self.pool.userPoolConfiguration.clientId;
        input.clientMetadata = [self.pool getValidationData:validationData clientMetaData:clientMetaData];
        input.analyticsMetadata = [self.pool analyticsMetadata];
        input.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];

        //based on whether this is custom auth or not set the auth flow
        if(isInitialCustomChallenge){
            input.authFlow = AWSCognitoIdentityProviderAuthFlowTypeCustomAuth;
            //set challenge name parameter to SRP_A
            [challengeResponses setObject:@"SRP_A" forKey:@"CHALLENGE_NAME"];
        }else {
            input.authFlow = AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth;
        }
        
        
        input.authParameters = challengeResponses;
        
        return [[self.pool.client initiateAuth:input] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> * _Nonnull task) {
            //if there was an error, it may be due to the device being forgotten, reset the device and retry if that is the case
            return [[self forgetDeviceOnInitiateDeviceNotFoundError:task retryContinuation:^AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> *{
                return [self srpAuthInternal:username password:password validationData:validationData clientMetaData:clientMetaData lastChallenge:lastChallenge isInitialCustomChallenge:isInitialCustomChallenge];
            }] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> * _Nonnull task) {
                //morph this initiate auth response into a respond to auth challenge response so it works as input to getSessionInternal
                AWSCognitoIdentityProviderRespondToAuthChallengeResponse * response = [AWSCognitoIdentityProviderRespondToAuthChallengeResponse new];
                [response aws_copyPropertiesFromObject:task.result];
                
                if (response.challengeName == AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge) {
                    return [AWSTask taskWithResult:response];
                } else {
                    //continue with second step of SRP auth
                    return [self srpAuthInternalStep2:[AWSTask taskWithResult:response] srpHelper:srpHelper clientMetaData:clientMetaData];
                }
                
            }];
        }];
    }
}

- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> *) srpAuthInternalStep2: (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> *) task
                                                                                     srpHelper:(AWSCognitoIdentityProviderSrpHelper *) srpHelper
                                                                                clientMetaData:(nullable NSDictionary<NSString *,NSString *> *) clientMetaData {
    AWSCognitoIdentityProviderRespondToAuthChallengeResponse *authDetails = task.result;
    AWSCognitoIdentityProviderSrpServerState *serverState =
    [AWSCognitoIdentityProviderSrpServerState
     serverStateForPoolName:[self.pool strippedPoolId]
     publicBHexString:authDetails.challengeParameters[@"SRP_B"]
     saltHexString:authDetails.challengeParameters[@"SALT"]
     derivedKeyInfo:AWSCognitoIdentityUserDerivedKeyInfo
     derivedKeySize:16
     serviceSecretBlock:[[NSData alloc] initWithBase64EncodedString:authDetails.challengeParameters[@"SECRET_BLOCK"] options:0]];
    
    self.username = authDetails.challengeParameters[@"USERNAME"];
    self.userIdForSRP = authDetails.challengeParameters[@"USER_ID_FOR_SRP"];
    srpHelper.clientState.userName = self.userIdForSRP;
    
    AWSCognitoIdentityProviderRespondToAuthChallengeRequest *authInput = [AWSCognitoIdentityProviderRespondToAuthChallengeRequest new];
    authInput.session = authDetails.session;
    authInput.challengeName = authDetails.challengeName;
    authInput.analyticsMetadata = [self.pool analyticsMetadata];
    authInput.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];
    authInput.clientMetadata = clientMetaData;
    
    NSMutableDictionary * authParameters = [[NSMutableDictionary alloc] initWithDictionary:@{@"TIMESTAMP": [AWSCognitoIdentityProviderSrpHelper generateDateString:srpHelper.clientState.timestamp],
                                                                                             @"PASSWORD_CLAIM_SECRET_BLOCK" :  authDetails.challengeParameters[@"SECRET_BLOCK"],
                                                                                             @"PASSWORD_CLAIM_SIGNATURE" : [[srpHelper completeAuthentication:serverState] base64EncodedStringWithOptions:0]
                                                                                             }];
    
    [self addSecretHashDeviceKeyAndUsername:authParameters];
    
    authInput.challengeResponses = authParameters;
    authInput.clientId = self.pool.userPoolConfiguration.clientId;
    return [[self.pool.client respondToAuthChallenge:authInput] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull responseTask) {
        return [self forgetDeviceOnRespondDeviceNotFoundError:responseTask retryContinuation:^AWSTask *{
            return [self srpAuthInternalStep2:task srpHelper:srpHelper clientMetaData:clientMetaData];
        }];
    }];
}


//Determine whether the error (if any) on the initiateAuth is a device not found error and if so forget the device and retry
- (AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse*>*) forgetDeviceOnInitiateDeviceNotFoundError:(AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse*> * _Nonnull) task retryContinuation: (AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse*>* (^_Nonnull)(void)) retryContinuation {
    if([self isDeviceNotFoundError:task.error]){
        [self forgetDeviceInternal];
        return retryContinuation();
    }
    return task;
}

//Determine whether the error (if any) on the respondToAuthChallenge is a device not found error and if so forget the device and retry
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) forgetDeviceOnRespondDeviceNotFoundError:(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*> * _Nonnull) task retryContinuation: (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>* (^_Nonnull)(void)) retryContinuation {
    if([self isDeviceNotFoundError:task.error]){
        [self forgetDeviceInternal];
        return retryContinuation();
    }
    return task;
}

- (BOOL) isDeviceNotFoundError: (NSError *) error {
    return error != nil && error.code == AWSCognitoIdentityProviderErrorResourceNotFound && [@"Device does not exist." isEqualToString:error.userInfo[@"message"]];
}

/**
 * Perform SRP based authentication (initiateAuth(SRP_AUTH) and respondToAuthChallenge) given a username and password
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) deviceAuthInternal:(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *>*) deviceChallengeResponse {
    AWSCognitoIdentityProviderRespondToAuthChallengeRequest *input = [AWSCognitoIdentityProviderRespondToAuthChallengeRequest new];
    input.clientId = self.pool.userPoolConfiguration.clientId;
    AWSCognitoIdentityUserDeviceCredentials *deviceCredentials = [self getDeviceCredentials];
    AWSCognitoIdentityProviderRespondToAuthChallengeResponse * deviceChallenge =  deviceChallengeResponse.result;
    
    
    AWSCognitoIdentityProviderSrpHelper *srpHelper = [AWSCognitoIdentityProviderSrpHelper beginUserAuthentication:deviceCredentials.deviceId password:deviceCredentials.deviceSecret];
    NSMutableDictionary * challengeResponses = [[NSMutableDictionary alloc] initWithDictionary:@{@"SRP_A" : [srpHelper.clientState.publicA stringValueWithRadix:16]}];
    [self addSecretHashDeviceKeyAndUsername:challengeResponses];
    
    input.challengeName = deviceChallenge.challengeName;
    input.session = deviceChallenge.session;
    input.challengeResponses = challengeResponses;
    input.analyticsMetadata = [self.pool analyticsMetadata];
    input.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];

    return [[self.pool.client respondToAuthChallenge:input] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
        
        AWSCognitoIdentityProviderRespondToAuthChallengeResponse *authDetails = task.result;
        AWSCognitoIdentityProviderSrpServerState *serverState =
        [AWSCognitoIdentityProviderSrpServerState
         
         serverStateForPoolName:deviceCredentials.deviceGroup
         publicBHexString:authDetails.challengeParameters[@"SRP_B"]
         saltHexString:authDetails.challengeParameters[@"SALT"]
         derivedKeyInfo:AWSCognitoIdentityUserDerivedKeyInfo
         derivedKeySize:16
         serviceSecretBlock:[[NSData alloc] initWithBase64EncodedString:authDetails.challengeParameters[@"SECRET_BLOCK"] options:0]];
        
        AWSCognitoIdentityProviderRespondToAuthChallengeRequest *authInput = [AWSCognitoIdentityProviderRespondToAuthChallengeRequest new];
        authInput.session = authDetails.session;
        authInput.challengeName = authDetails.challengeName;
        authInput.analyticsMetadata = [self.pool analyticsMetadata];
        authInput.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];

        NSMutableDictionary * authParameters = [[NSMutableDictionary alloc] initWithDictionary:@{@"TIMESTAMP": [AWSCognitoIdentityProviderSrpHelper generateDateString:srpHelper.clientState.timestamp],
                                                                                                 @"PASSWORD_CLAIM_SECRET_BLOCK" :  authDetails.challengeParameters[@"SECRET_BLOCK"],
                                                                                                 @"PASSWORD_CLAIM_SIGNATURE" : [[srpHelper completeAuthentication:serverState] base64EncodedStringWithOptions:0]
                                                                                                 }];
        [self addSecretHashDeviceKeyAndUsername:authParameters];
        
        authInput.challengeResponses = authParameters;
        authInput.clientId = self.pool.userPoolConfiguration.clientId;
        return [self.pool.client respondToAuthChallenge:authInput];
        
    }];
}

/**
 * Adds a device key to the authParameters dictionary if it is known for this username
 */
-(void) addDeviceKey:(NSMutableDictionary<NSString *,NSString*> *) authParameters {
    AWSCognitoIdentityUserDeviceCredentials *deviceCredentials = [self getDeviceCredentials];
    if(deviceCredentials != nil){
        [authParameters setObject:deviceCredentials.deviceId forKey:@"DEVICE_KEY"];
    }
}

/**
 * Adds a SECRET_HASH and USERNAME and DEVICE_KEY to the authParameters dictionary.
 */
-(void) addSecretHashDeviceKeyAndUsername:(NSMutableDictionary<NSString *,NSString*> *) authParameters {
    if(self.username == nil) {
        self.username = authParameters[@"USERNAME"];
    }
    
    [authParameters setObject:self.username forKey:@"USERNAME"];
    NSString* secretHash = [self.pool calculateSecretHash:self.username];
    
    if(secretHash != nil){
        [authParameters setObject:secretHash forKey:@"SECRET_HASH"];
    }
    [self addDeviceKey:authParameters];
}

/**
 * Invoke developer's ui to prompt user for mfa code and call enhanceAuth
 */
-(AWSTask<AWSCognitoIdentityUserSession *>*) mfaAuthInternal: (NSString *) deliveryMedium
                                                 destination: (NSString *) destination
                                                   authState: (NSString *) authState
                                               challengeName: (AWSCognitoIdentityProviderChallengeNameType) challengeName
                                      authenticationDelegate: (id<AWSCognitoIdentityMultiFactorAuthentication>) authenticationDelegate {

    if ([authenticationDelegate respondsToSelector:@selector(getMultiFactorAuthenticationCode_v2:mfaCodeCompletionSource:)]) {
        AWSTaskCompletionSource<AWSCognitoIdentityMfaCodeDetails *> *mfaCompletionSource = [[AWSTaskCompletionSource<AWSCognitoIdentityMfaCodeDetails *> alloc] init];
        AWSCognitoIdentityMultifactorAuthenticationInput* authenticationInput = [[AWSCognitoIdentityMultifactorAuthenticationInput alloc]
                                                                                 initWithDeliveryMedium:deliveryMedium
                                                                                 destination:destination];
        [authenticationDelegate getMultiFactorAuthenticationCode_v2:authenticationInput mfaCodeCompletionSource:mfaCompletionSource];
        return [mfaCompletionSource.task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityMfaCodeDetails *> * _Nonnull task) {
            return [self mfaAuthInternal:deliveryMedium
                             destination:destination
                               authState:authState
                           challengeName:challengeName
                  authenticationDelegate:authenticationDelegate
                                 mfaCode:task.result.mfaCode
                          clientMetaData:task.result.clientMetaData];
        }];
    } else {
        AWSTaskCompletionSource<NSString *> *mfaCompletionSource = [[AWSTaskCompletionSource<NSString *> alloc] init];
        AWSCognitoIdentityMultifactorAuthenticationInput* authenticationInput = [[AWSCognitoIdentityMultifactorAuthenticationInput alloc] initWithDeliveryMedium:deliveryMedium destination:destination];
        [authenticationDelegate getMultiFactorAuthenticationCode:authenticationInput mfaCodeCompletionSource:mfaCompletionSource];
        return [mfaCompletionSource.task continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
            return [self mfaAuthInternal:deliveryMedium
                             destination:destination
                               authState:authState
                           challengeName:challengeName
                  authenticationDelegate:authenticationDelegate
                                 mfaCode:task.result
                          clientMetaData:nil];
                }];
    }
}

-(AWSTask<AWSCognitoIdentityUserSession *>*) mfaAuthInternal: (NSString *) deliveryMedium
                                                 destination: (NSString *) destination
                                                   authState: (NSString *) authState
                                               challengeName: (AWSCognitoIdentityProviderChallengeNameType) challengeName
                                      authenticationDelegate: (id<AWSCognitoIdentityMultiFactorAuthentication>) authenticationDelegate
                                                     mfaCode: (NSString *) mfaCode
                                              clientMetaData: (nullable NSDictionary<NSString *,NSString *> *) clientMetaData {

    AWSCognitoIdentityProviderRespondToAuthChallengeRequest *mfaChallenge = [AWSCognitoIdentityProviderRespondToAuthChallengeRequest new];
    mfaChallenge.session = authState;
    mfaChallenge.challengeName = challengeName;
    mfaChallenge.clientId = self.pool.userPoolConfiguration.clientId;

    NSString * responseKey = @"SMS_MFA_CODE";
    if(AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa == challengeName){
        responseKey = @"SOFTWARE_TOKEN_MFA_CODE";
    }

    NSMutableDictionary * challengeResponses = [[NSMutableDictionary alloc] initWithDictionary:@{responseKey: mfaCode}];
    [self addSecretHashDeviceKeyAndUsername:challengeResponses];

    mfaChallenge.challengeResponses = challengeResponses;
    mfaChallenge.analyticsMetadata = [self.pool analyticsMetadata];
    mfaChallenge.userContextData = [self.pool userContextData:self.username deviceId: [self asfDeviceId]];
    mfaChallenge.clientMetadata = clientMetaData;

    return [[[self.pool.client respondToAuthChallenge:mfaChallenge] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
        AWSCognitoIdentityProviderRespondToAuthChallengeResponse *response = task.result;
        AWSCognitoIdentityProviderAuthenticationResultType * authResult = response.authenticationResult;
        AWSCognitoIdentityUserSession * session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken:authResult.idToken accessToken:authResult.accessToken refreshToken:authResult.refreshToken expiresIn:authResult.expiresIn];
        //last step is to perform device auth if device key is supplied or we are being challenged with device auth
        if(authResult.latestDeviceMetadata != nil || response.challengeName == AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth){
            return [self performDeviceAuth: task session:session];
        } else {
            [self updateUsernameAndPersistTokens:session];
            return [AWSTask taskWithResult:session];
        }
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        [authenticationDelegate didCompleteMultifactorAuthenticationStepWithError:task.error];
        if([task isCancelled]){
            return task;
        }
        if(task.error){
            //retry on error
            return [self mfaAuthInternal:deliveryMedium destination:destination authState:authState challengeName: challengeName authenticationDelegate:authenticationDelegate];
        }else {
            return task;
        }
    }];
}

/**
 * Update this user's attributes
 */
-(AWSTask<AWSCognitoIdentityUserUpdateAttributesResponse *>*) updateAttributes: (NSArray<AWSCognitoIdentityUserAttributeType *>*) attributes
                                                                clientMetaData: (nullable NSDictionary<NSString *,NSString *> *) clientMetaData {
    AWSCognitoIdentityProviderUpdateUserAttributesRequest *request = [AWSCognitoIdentityProviderUpdateUserAttributesRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        NSMutableArray *userAttributes = [NSMutableArray new];
        request.userAttributes = userAttributes;
        request.clientMetadata = clientMetaData;
        for (AWSCognitoIdentityUserAttributeType * attribute in attributes) {
            AWSCognitoIdentityProviderAttributeType *apiAttribute = [AWSCognitoIdentityProviderAttributeType new];
            apiAttribute.name = attribute.name;
            apiAttribute.value = attribute.value;
            [userAttributes addObject: apiAttribute];
        }
        return [[self.pool.client updateUserAttributes:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderUpdateUserAttributesResponse *> * _Nonnull task) {
            AWSCognitoIdentityUserUpdateAttributesResponse * response = [AWSCognitoIdentityUserUpdateAttributesResponse new];
            [response aws_copyPropertiesFromObject:task.result];
            // drop id and access token to force a refresh
            [self clearSession];
            return [AWSTask taskWithResult:response];
        }];
    }];
}

-(AWSTask<AWSCognitoIdentityUserUpdateAttributesResponse *>*) updateAttributes: (NSArray<AWSCognitoIdentityUserAttributeType *>*) attributes {
    return [self updateAttributes:attributes clientMetaData:nil];
}

/**
 * Delete the attributes specified by attributeNames
 */
-(AWSTask<AWSCognitoIdentityUserDeleteAttributesResponse *>*) deleteAttributes: (NSArray<NSString *>*) attributeNames {
    AWSCognitoIdentityProviderDeleteUserAttributesRequest *request = [AWSCognitoIdentityProviderDeleteUserAttributesRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        request.userAttributeNames = attributeNames;
        return [[self.pool.client deleteUserAttributes:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderDeleteUserAttributesResponse *> * _Nonnull task) {
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
-(AWSTask<AWSCognitoIdentityUserGetAttributeVerificationCodeResponse *>*) getAttributeVerificationCode: (NSString *) attributeName
                                                                                        clientMetaData: (nullable NSDictionary<NSString *,NSString *> *) clientMetaData {
    AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest *request = [AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        request.attributeName = attributeName;
        request.clientMetadata = clientMetaData;
        return [[self.pool.client getUserAttributeVerificationCode:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse *> * _Nonnull task) {
            AWSCognitoIdentityUserGetAttributeVerificationCodeResponse * response = [AWSCognitoIdentityUserGetAttributeVerificationCodeResponse new];
            [response aws_copyPropertiesFromObject:task.result];
            return [AWSTask taskWithResult:response];
        }];
    }];
}

-(AWSTask<AWSCognitoIdentityUserGetAttributeVerificationCodeResponse *>*) getAttributeVerificationCode: (NSString *) attributeName {
    return [self getAttributeVerificationCode:attributeName clientMetaData:nil];
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
 * Set the user settings for this user such as MFA
 */
-(AWSTask<AWSCognitoIdentityUserSetUserSettingsResponse *>*) setUserMfaPreference: (AWSCognitoIdentityUserMfaPreferences*) settings; {
    
    AWSCognitoIdentityProviderSetUserMFAPreferenceRequest *request = [AWSCognitoIdentityProviderSetUserMFAPreferenceRequest new];
    if(settings.smsMfa != nil){
        AWSCognitoIdentityProviderSMSMfaSettingsType* smsMfaSettings = [AWSCognitoIdentityProviderSMSMfaSettingsType new];
        smsMfaSettings.enabled = [NSNumber numberWithBool:settings.smsMfa.enabled];
        smsMfaSettings.preferredMfa = [NSNumber numberWithBool:settings.smsMfa.preferred];
        request.SMSMfaSettings = smsMfaSettings;
    }
    if(settings.softwareTokenMfa != nil){
        AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType* softwareTokenMfaSettings = [AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType new];
        softwareTokenMfaSettings.enabled = [NSNumber numberWithBool:settings.softwareTokenMfa.enabled];
        softwareTokenMfaSettings.preferredMfa = [NSNumber numberWithBool:settings.softwareTokenMfa.preferred];
        request.softwareTokenMfaSettings = softwareTokenMfaSettings;
    }
    
    return [[[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        return [self.pool.client setUserMFAPreference:request];
    }] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderSetUserMFAPreferenceResponse *> * _Nonnull task) {
        AWSCognitoIdentityUserSetUserMfaPreferenceResponse * response = [AWSCognitoIdentityUserSetUserMfaPreferenceResponse new];
        [response aws_copyPropertiesFromObject:task.result];
        return [AWSTask taskWithResult:response];
    }];
}


/**
 * Start the process of associating a software token
 */
-(AWSTask<AWSCognitoIdentityUserAssociateSoftwareTokenResponse *>*) associateSoftwareToken {
    AWSCognitoIdentityProviderAssociateSoftwareTokenRequest * request = [AWSCognitoIdentityProviderAssociateSoftwareTokenRequest new];
    return [[[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        return [self.pool.client associateSoftwareToken:request];
    }] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserAssociateSoftwareTokenResponse *> * _Nonnull task) {
        AWSCognitoIdentityUserAssociateSoftwareTokenResponse * response = [AWSCognitoIdentityUserAssociateSoftwareTokenResponse new];
        [response aws_copyPropertiesFromObject:task.result];
        return [AWSTask taskWithResult:response];
    }];
}


/**
 * Complete the process of associating a software token by verifying the code and setting device friendly name
 */
-(AWSTask<AWSCognitoIdentityUserVerifySoftwareTokenResponse *>*) verifySoftwareToken: (NSString*) userCode friendlyDeviceName: (NSString* _Nullable) friendlyDeviceName {
    
    AWSCognitoIdentityProviderVerifySoftwareTokenRequest *request = [AWSCognitoIdentityProviderVerifySoftwareTokenRequest new];
    request.friendlyDeviceName = friendlyDeviceName;
    request.userCode = userCode;
    return [[[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        return [self.pool.client verifySoftwareToken:request];
    }] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderVerifySoftwareTokenResponse *> * _Nonnull task) {
        AWSCognitoIdentityUserVerifySoftwareTokenResponse * response = [AWSCognitoIdentityUserVerifySoftwareTokenResponse new];
        [response aws_copyPropertiesFromObject:task.result];
        return [AWSTask taskWithResult:response];
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
    if(self.username){
        NSArray *keys = self.pool.keychain.allKeys;
        NSString *keyChainPrefix = [[self keyChainNamespaceClientId] stringByAppendingString:@"."];
        for (NSString *key in keys) {
            //clear tokens associated with this user
            if([key hasPrefix:keyChainPrefix]){
                [self.pool.keychain removeItemForKey:key];
            }
        }
    }
}

-(void) signOutAndClearLastKnownUser{
    [self signOut];
    [self.pool clearLastKnownUser];
}

-(void) clearSession{
    if(self.username){
        NSString * keyChainNamespace = [self keyChainNamespaceClientId];
        NSString * idTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserIdToken];
        NSString * accessTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserAccessToken];
        [self.pool.keychain removeItemForKey:idTokenKey];
        [self.pool.keychain removeItemForKey:accessTokenKey];
    }
}

- (NSString *) refreshTokenFromKeyChain: (NSString *) keyChainNamespace {
    NSString * refreshTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserRefreshToken];
    NSString * refreshToken = self.pool.keychain[refreshTokenKey];
    return refreshToken;
}

-(BOOL) isSignedIn {
    if(self.username == nil){
        return NO;
    }
    
    NSString * keyChainNamespace = [self keyChainNamespaceClientId];
    NSString * refreshToken = [self refreshTokenFromKeyChain:keyChainNamespace];
    return refreshToken != nil;
}

-(BOOL) isSessionRevocable {
    NSString * keyChainNamespace = [self keyChainNamespaceClientId];
    NSString * accessTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserAccessToken];
    NSString * accessTokenString = self.pool.keychain[accessTokenKey];
    AWSCognitoIdentityUserSessionToken * accessToken = [[AWSCognitoIdentityUserSessionToken alloc] initWithToken:accessTokenString];
    return [accessToken.tokenClaims objectForKey:@"origin_jti"];
}

- (AWSTask<AWSCognitoIdentityProviderRevokeTokenResponse *> *) revokeToken {
    NSString * keyChainNamespace = [self keyChainNamespaceClientId];
    AWSCognitoIdentityProviderRevokeTokenRequest *request = [AWSCognitoIdentityProviderRevokeTokenRequest new];
    NSString * refreshToken = [self refreshTokenFromKeyChain:keyChainNamespace];
    request.token = refreshToken;
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.clientSecret = self.pool.userPoolConfiguration.clientSecret;
    return [self.pool.client revokeToken:request];
}

- (AWSTask<AWSCognitoIdentityUserGlobalSignOutResponse *> *) globalSignOut {
    AWSCognitoIdentityProviderGlobalSignOutRequest *request = [AWSCognitoIdentityProviderGlobalSignOutRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        return [[self.pool.client globalSignOut:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderGlobalSignOutResponse *> * _Nonnull task) {
            [self signOut];
            return task;
        }];
    }];
}

- (AWSTask<AWSCognitoIdentityUserListDevicesResponse *> *) listDevices:(int) limit paginationToken:(NSString * _Nullable) paginationToken {
    AWSCognitoIdentityProviderListDevicesRequest *request = [AWSCognitoIdentityProviderListDevicesRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        request.paginationToken = paginationToken;
        request.limit = [NSNumber numberWithInt:limit];
        return [[self.pool.client listDevices:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderListDevicesResponse *> * _Nonnull task) {
            AWSCognitoIdentityUserListDevicesResponse * response = [AWSCognitoIdentityUserListDevicesResponse new];
            [response aws_copyPropertiesFromObject:task.result];
            return [AWSTask taskWithResult:response];
        }];
    }];
}

- (AWSTask<AWSCognitoIdentityUserUpdateDeviceStatusResponse *> *) updateDeviceStatus: (NSString *) deviceId remembered:(BOOL) remembered {
    AWSCognitoIdentityProviderUpdateDeviceStatusRequest *request = [AWSCognitoIdentityProviderUpdateDeviceStatusRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        request.deviceKey = deviceId;
        request.deviceRememberedStatus = remembered ? AWSCognitoIdentityProviderDeviceRememberedStatusTypeRemembered : AWSCognitoIdentityProviderDeviceRememberedStatusTypeNotRemembered;
        return [[self.pool.client updateDeviceStatus:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderUpdateDeviceStatusRequest *> * _Nonnull task) {
            AWSCognitoIdentityUserUpdateDeviceStatusResponse * response = [AWSCognitoIdentityUserUpdateDeviceStatusResponse new];
            [response aws_copyPropertiesFromObject:task.result];
            return [AWSTask taskWithResult:response];
        }];
    }];
}


- (AWSTask<AWSCognitoIdentityUserUpdateDeviceStatusResponse *> *) updateDeviceStatus: (BOOL) remembered {
    AWSCognitoIdentityUserDeviceCredentials * credentials = [self getDeviceCredentials];
    if(credentials){
        return [self updateDeviceStatus:[self getDeviceCredentials].deviceId remembered:remembered];
    }else{
        return [self deviceNotTrackedError];
    }
}


- (AWSTask<AWSCognitoIdentityUserGetDeviceResponse *> *) getDevice: (NSString *) deviceId {
    AWSCognitoIdentityProviderGetDeviceRequest *request = [AWSCognitoIdentityProviderGetDeviceRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        request.deviceKey = deviceId;
        return [[self.pool.client getDevice:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderGetDeviceResponse *> * _Nonnull task) {
            AWSCognitoIdentityUserGetDeviceResponse * response = [AWSCognitoIdentityUserGetDeviceResponse new];
            [response aws_copyPropertiesFromObject:task.result];
            return [AWSTask taskWithResult:response];
        }];
    }];
}

- (AWSTask<AWSCognitoIdentityUserGetDeviceResponse *> *) getDevice {
    AWSCognitoIdentityUserDeviceCredentials * credentials = [self getDeviceCredentials];
    if(credentials){
        return [self getDevice:credentials.deviceId];
    }else{
        return [self deviceNotTrackedError];
    }
}

- (AWSTask *) forgetDevice {
    AWSCognitoIdentityUserDeviceCredentials * credentials = [self getDeviceCredentials];
    if(credentials){
        return [self forgetDevice:credentials.deviceId];
    }else{
        return [self deviceNotTrackedError];
    }
}

- (AWSTask *) deviceNotTrackedError {
    return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorDeviceNotTracked userInfo:@{NSLocalizedDescriptionKey: @"This device does not have an id, either it was never tracked or previously forgotten."}]];
}


- (AWSTask *) forgetDevice: (NSString *) deviceId {
    AWSCognitoIdentityProviderForgetDeviceRequest * request = [AWSCognitoIdentityProviderForgetDeviceRequest new];
    return [[self getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        request.accessToken = task.result.accessToken.tokenString;
        request.deviceKey = deviceId;
        return [[self.pool.client forgetDevice:request] continueWithSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
            
            AWSCognitoIdentityUserDeviceCredentials * credentials = [self getDeviceCredentials];
            //if it was this device that was forgotten and call was successful, clear cached device.
            if(credentials && credentials.deviceId && [credentials.deviceId isEqualToString:deviceId]){
                [self forgetDeviceInternal];
            }
            return task;
        }];
    }];
}

- (void) updateUsernameAndPersistTokens: (AWSCognitoIdentityUserSession *) session {
    [self.pool setCurrentUser:self.username];
    NSString * keyChainNamespace = [self keyChainNamespaceClientId];
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

- (void) persistDevice:(NSString *) deviceKey deviceSecret: (NSString *) deviceSecret  deviceGroup: (NSString *) deviceGroup {
    NSString * keyChainNamespace = [self keyChainNamespacePoolId];
    if(deviceKey){
        NSString * deviceIdKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserDeviceId];
        self.pool.keychain[deviceIdKey] = deviceKey;
    }
    if(deviceSecret){
        NSString * deviceSecretKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserDeviceSecret];
        self.pool.keychain[deviceSecretKey] = deviceSecret;
    }
    
    if(deviceGroup){
        NSString * deviceGroupKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserDeviceGroup];
        self.pool.keychain[deviceGroupKey] = deviceGroup;
    }
}

- (void) forgetDeviceInternal {
    NSString * keyChainNamespace = [self keyChainNamespacePoolId];
    NSString * deviceIdKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserDeviceId];
    self.pool.keychain[deviceIdKey] = nil;
    NSString * deviceSecretKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserDeviceSecret];
    self.pool.keychain[deviceSecretKey] = nil;
    NSString * deviceGroupKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserDeviceGroup];
    self.pool.keychain[deviceGroupKey] = nil;
}

- (AWSCognitoIdentityUserDeviceCredentials *) getDeviceCredentials {
    AWSCognitoIdentityUserDeviceCredentials *deviceCredentials = [[AWSCognitoIdentityUserDeviceCredentials alloc] initWithUser:self];
    if(deviceCredentials.deviceId && deviceCredentials.deviceSecret){
        return deviceCredentials;
    }else {
        return nil;
    }
}

- (NSString *) keyChainNamespaceClientId {
    return [NSString stringWithFormat:@"%@.%@", self.pool.userPoolConfiguration.clientId, self.username];
}

- (NSString *) keyChainNamespacePoolId {
    return [NSString stringWithFormat:@"%@.%@", self.pool.userPoolConfiguration.poolId, self.username];
}

- (NSString *) asfDeviceId {
    NSString *asfDeviceId = [self getDeviceCredentials].deviceId;
    if(asfDeviceId == nil){
        NSString * keyChainNamespace = [self keyChainNamespacePoolId];
        NSString * asfDeviceIdKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserAsfDeviceId];
        asfDeviceId = self.pool.keychain[asfDeviceIdKey];
        if(asfDeviceId == nil){
            asfDeviceId = [[[NSUUID UUID] UUIDString] lowercaseString];
            self.pool.keychain[asfDeviceIdKey] = asfDeviceId;
        }
    }
    return asfDeviceId;
}

/**
 * Get a namespaced keychain key given a namespace and key
 */
- (NSString *) keyChainKey: (NSString *) namespace key:(const NSString *) key {
    return [NSString stringWithFormat:@"%@.%@", namespace, key];
}

- (NSString*) strippedPoolName {
    return [self.pool.userPoolConfiguration.poolId substringFromIndex:[self.pool.userPoolConfiguration.poolId rangeOfString:@"_" ].location+1];
}

- (NSString*) deviceId {
    AWSCognitoIdentityUserDeviceCredentials *deviceCredentials = [self getDeviceCredentials];
    return deviceCredentials ? deviceCredentials.deviceId : nil;
}

- (NSString*) deviceIdentifier {
    AWSCognitoIdentityUserDeviceCredentials *deviceCredentials = [self getDeviceCredentials];
    return deviceCredentials ? deviceCredentials.deviceId : nil;
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

-(NSDictionary<NSString *, NSString*> *) claims {
    return [self tokenClaims];
}

-(NSDictionary<NSString *, id> *) tokenClaims {
    NSDictionary * result = @{};
    NSArray *pieces = [self.tokenString componentsSeparatedByString:@"."];
    if(pieces.count > 2){
        NSString * claims = pieces[1];
        //JWT is not padded with =, pad it if necessary
        NSUInteger paddedLength = claims.length + (4 - (claims.length % 4)) % 4;;
        claims = [claims stringByPaddingToLength:paddedLength withString:@"=" startingAtIndex:0];
        
        NSData * claimsData = [[NSData alloc] initWithBase64EncodedString:claims options:NSDataBase64DecodingIgnoreUnknownCharacters];
        NSError *error = nil;
        if(claimsData != nil){
            result = [NSJSONSerialization JSONObjectWithData:claimsData options:kNilOptions error:&error];
            if(error) {
                AWSDDLogError(@"Unable to deserialize token claims: %@", error);
            }
        } else {
            AWSDDLogError(@"Token is not valid base64");
        }
    }
    return result;
}

@end

@implementation AWSCognitoIdentityUserSettings

@end


@implementation AWSCognitoIdentityUserMfaPreferences

@end

@implementation AWSCognitoIdentityUserMfaType
- (instancetype) initWithEnabled:(BOOL) enabled preferred:(BOOL) preferred {
    if(self = [super init]){
        self.enabled = enabled;
        self.preferred = preferred;
    }
    return self;
}
@end

@implementation AWSCognitoIdentityUserMFAOption

- (AWSCognitoIdentityProviderMFAOptionType *) mfaOptionTypeValue{
    AWSCognitoIdentityProviderMFAOptionType *result = [AWSCognitoIdentityProviderMFAOptionType new];
    [result aws_copyPropertiesFromObject:self];
    return result;
}
@end

@implementation AWSCognitoIdentityUserAttributeType
- (instancetype) initWithName: (NSString *) name value: (NSString *) value{
    if(self = [super init]){
        self.name = name;
        self.value = value;
    }
    return self;
}
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

@implementation AWSCognitoIdentityUserListDevicesResponse

@end

@implementation AWSCognitoIdentityUserUpdateDeviceStatusResponse

@end

@implementation AWSCognitoIdentityUserGlobalSignOutResponse

@end

@implementation AWSCognitoIdentityUserGetDeviceResponse

@end

@implementation AWSCognitoIdentityUserAssociateSoftwareTokenResponse

@end

@implementation AWSCognitoIdentityUserVerifySoftwareTokenResponse

@end

@implementation AWSCognitoIdentityUserSetUserMfaPreferenceResponse

@end

@implementation AWSCognitoIdentityUserDeviceCredentials
- (instancetype) initWithUser:(AWSCognitoIdentityUser *) user {
    if(self = [super init]){
        _user = user;
    }
    return self;
}

- (NSString *) deviceId {
    NSString * keyChainNamespace = [self.user keyChainNamespacePoolId];
    NSString * deviceIdKey = [self.user keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserDeviceId];
    return self.user.pool.keychain[deviceIdKey];
}

- (NSString *) deviceSecret {
    NSString * keyChainNamespace = [self.user keyChainNamespacePoolId];
    NSString * deviceSecretKey = [self.user keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserDeviceSecret];
    return self.user.pool.keychain[deviceSecretKey];
}

- (NSString *) deviceGroup {
    NSString * keyChainNamespace = [self.user keyChainNamespacePoolId];
    NSString * deviceGroupKey = [self.user keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserDeviceGroup];
    return self.user.pool.keychain[deviceGroupKey];
}
@end
