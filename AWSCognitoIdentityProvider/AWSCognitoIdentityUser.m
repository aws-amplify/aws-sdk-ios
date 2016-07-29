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
#import "NSData+AWSCognitoIdentityProvider.h"
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
static const NSString * AWSCognitoIdentityUserDeviceId = @"device.id";
static const NSString * AWSCognitoIdentityUserDeviceSecret = @"device.secret";
static const NSString * AWSCognitoIdentityUserDeviceGroup = @"device.group";

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
    return [self confirmSignUp:confirmationCode forceAliasCreation:NO];
}

-(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *) confirmSignUp:(NSString *) confirmationCode forceAliasCreation:(BOOL)forceAliasCreation {
    AWSCognitoIdentityProviderConfirmSignUpRequest *request = [AWSCognitoIdentityProviderConfirmSignUpRequest new];
    request.clientId = self.pool.userPoolConfiguration.clientId;
    request.username = self.username;
    request.secretHash = [self.pool calculateSecretHash:self.username];
    request.confirmationCode = confirmationCode;
    request.forceAliasCreation = (forceAliasCreation?@(YES):@(NO));
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
        [response aws_copyPropertiesFromObject:task.result];
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
 Get a session
 */
-(AWSTask<AWSCognitoIdentityUserSession*> *) getSession {
    
    //check to see if we have valid tokens
    __block NSString * keyChainNamespace = [self keyChainNamespaceClientId];
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
            return [AWSTask taskWithResult:session];
        }
        //else refresh it using the refresh token
        else if(refreshToken){
            AWSCognitoIdentityProviderInitiateAuthRequest * request = [AWSCognitoIdentityProviderInitiateAuthRequest new];
            request.authFlow = AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth;
            request.clientId = self.pool.userPoolConfiguration.clientId;
            NSMutableDictionary * authParameters = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                                     @"REFRESH_TOKEN" : refreshToken,
                                                                                                     @"SECRET_HASH" : self.pool.userPoolConfiguration.clientSecret}];
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
                AWSCognitoIdentityUserSession * session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken: authResult.idToken accessToken:authResult.accessToken refreshToken:authResult.refreshToken expiresIn:authResult.expiresIn];
                [self updateUsernameAndPersistTokens:session];
                return [AWSTask taskWithResult:session];
            }];
        }
    }
    return [self interactiveAuth];
}


/**
 * Get session with scopes.  Scopes are deprecated and have no effect.
 */
- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession:(nullable NSSet<NSString *> *)scopes {
    return [self getSession];
}


/**
 * Explicitly get a session without using any cached tokens/refresh tokens.  Scopes are deprecated and have no effect.
 */
- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession:(NSString *)username
                                                password:(NSString *)password
                                          validationData:(nullable NSArray<AWSCognitoIdentityUserAttributeType *> *)validationData
                                                  scopes:(nullable NSSet<NSString *> *)scopes {
    return [self getSession:username password:password validationData:validationData];
}

/**
 * Explicitly get a session without using any cached tokens/refresh tokens.
 */
- (AWSTask<AWSCognitoIdentityUserSession*>*) getSession:(NSString *)username password:(NSString *)password validationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*)validationData {
    
    return [[self srpAuthInternal:username password:password validationData:validationData] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
        return [self getSessionInternal:username task:task];
    }];
}


- (AWSTask<AWSCognitoIdentityUserSession*>*) getSessionInternal:(NSString *) username task: (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *>*) task{
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
        
        //if no mfa required return session
        if(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa == nextChallenge){
            if ([self.pool.delegate respondsToSelector:@selector(startMultiFactorAuthentication)]) {
                id<AWSCognitoIdentityMultiFactorAuthentication> authenticationDelegate = [self.pool.delegate startMultiFactorAuthentication];
                NSString *deliveryMedium = authenticateResult.challengeParameters[@"CODE_DELIVERY_DELIVERY_MEDIUM"];
                NSString *destination = authenticateResult.challengeParameters[@"CODE_DELIVERY_DESTINATION"];
                return [self mfaAuthInternal:deliveryMedium destination:destination authState:authenticateResult.session authenticationDelegate:authenticationDelegate];
                
            }else {
                return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"startMultiFactorAuthentication not implemented by authentication delegate"}]];
            }
        }else if (session) {
            [self updateUsernameAndPersistTokens:session];
            return [AWSTask taskWithResult:session];
        }else {
            //TODO unknown challenge type
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorCustomAuthenticationNotSupported userInfo:@{NSLocalizedDescriptionKey: @"Custom authentication not yet supported by this client"}]];
        }
    }];
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
 * Generates a devices password, calls service to exchange the password verifier and prompts user to remember the device as required.
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
                        AWSLogWarn(@"startRememberDevice is not implemented by authentication delegate, defaulting to not remembered.");
                    }
                }
                return task;
            }];
        }
    }
    return [AWSTask taskWithResult:nil];
}

/**
 * Kick off interactive auth to prompt developer for username/password and optionally mfa code
 */
- (AWSTask<AWSCognitoIdentityUserSession*>*) interactiveAuth {
    if(self.pool.delegate != nil){
        id<AWSCognitoIdentityPasswordAuthentication> authenticationDelegate = [self.pool.delegate startPasswordAuthentication];
        return [self passwordAuthInternal:authenticationDelegate];
    } else {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain code:AWSCognitoIdentityProviderClientErrorInvalidAuthenticationDelegate userInfo:@{NSLocalizedDescriptionKey: @"Authentication delegate not set"}]];
    };
}

/**
 * Prompt developer to obtain username/password and do SRP auth
 */
- (AWSTask<AWSCognitoIdentityUserSession*>*) passwordAuthInternal: (id<AWSCognitoIdentityPasswordAuthentication>) authenticationDelegate {
    AWSCognitoIdentityPasswordAuthenticationInput * input = [[AWSCognitoIdentityPasswordAuthenticationInput alloc] initWithLastKnownUsername:[self.pool currentUsername]];
    AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails*>*passwordAuthenticationDetails = [AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails*> new];
    [authenticationDelegate getPasswordAuthenticationDetails:input passwordAuthenticationCompletionSource:passwordAuthenticationDetails];
    return [passwordAuthenticationDetails.task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityPasswordAuthenticationDetails *> * _Nonnull task) {
        AWSCognitoIdentityPasswordAuthenticationDetails * authDetails = task.result;
        return [[self srpAuthInternal:authDetails.username password:authDetails.password validationData:authDetails.validationData] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
            [authenticationDelegate didCompletePasswordAuthenticationStepWithError:task.error];
            if(task.isCancelled){
                return task;
            }
            if(task.error){
                //retry password auth on error
                return [self passwordAuthInternal:authenticationDelegate];
            }else {
                return [self getSessionInternal:authDetails.username task:task];
            }
        }];
    }];
}

/**
 * Perform SRP based authentication (initiateAuth(SRP_AUTH) and respondToAuthChallenge) given a username and password
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) srpAuthInternal:(NSString *)username password:(NSString *)password validationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*)validationData {
    self.username = username;
    AWSCognitoIdentityProviderInitiateAuthRequest *input = [AWSCognitoIdentityProviderInitiateAuthRequest new];
    input.clientId = self.pool.userPoolConfiguration.clientId;
    input.clientMetadata = [self.pool getValidationData:validationData];
    AWSCognitoIdentityProviderSrpHelper *srpHelper = [AWSCognitoIdentityProviderSrpHelper beginUserAuthentication:self.username password:password];
    NSMutableDictionary * authParameters = [[NSMutableDictionary alloc] initWithDictionary:@{@"USERNAME":self.username,
                                                                                             @"SRP_A" : [srpHelper.clientState.publicA stringValueWithRadix:16],
                                                                                             @"SECRET_HASH" : [self.pool calculateSecretHash:self.username]}];
    [self addDeviceKey:authParameters];
    
    input.authFlow = AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth;
    input.authParameters = authParameters;
    
    return [[self.pool.client initiateAuth:input] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderInitiateAuthResponse *> * _Nonnull task) {
        
        AWSCognitoIdentityProviderInitiateAuthResponse *authDetails = task.result;
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
        NSMutableDictionary * authParameters = [[NSMutableDictionary alloc] initWithDictionary:@{@"USERNAME":self.username,
                                                                                                 @"TIMESTAMP": [AWSCognitoIdentityProviderSrpHelper generateDateString:srpHelper.clientState.timestamp],
                                                                                                 @"SECRET_HASH" : [self.pool calculateSecretHash:self.username],
                                                                                                 @"PASSWORD_CLAIM_SECRET_BLOCK" :  authDetails.challengeParameters[@"SECRET_BLOCK"],
                                                                                                 @"PASSWORD_CLAIM_SIGNATURE" : [[srpHelper completeAuthentication:serverState] base64EncodedStringWithOptions:0]
                                                                                                 }];
        [self addDeviceKey:authParameters];
        
        authInput.challengeResponses = authParameters;
        authInput.clientId = self.pool.userPoolConfiguration.clientId;
        return [self.pool.client respondToAuthChallenge:authInput];
        
    }];
}

/**
 * Perform SRP based authentication (initiateAuth(SRP_AUTH) and respondToAuthChallenge) given a username and password
 */
- (AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse*>*) deviceAuthInternal:(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *>*) deviceChallengeResponse {
    AWSCognitoIdentityProviderRespondToAuthChallengeRequest *input = [AWSCognitoIdentityProviderRespondToAuthChallengeRequest new];
    input.clientId = self.pool.userPoolConfiguration.clientId;
    AWSCognitoIdentityUserDeviceCredentials *deviceCredentials;
    AWSCognitoIdentityProviderRespondToAuthChallengeResponse * deviceChallenge =  deviceChallengeResponse.result;
    
    deviceCredentials = [self getDeviceCredentials];
    
    
    AWSCognitoIdentityProviderSrpHelper *srpHelper = [AWSCognitoIdentityProviderSrpHelper beginUserAuthentication:deviceCredentials.deviceId password:deviceCredentials.deviceSecret];
    NSMutableDictionary * challengeResponses = [[NSMutableDictionary alloc] initWithDictionary:@{@"USERNAME":self.username,
                                                                                             @"DEVICE_KEY" : deviceCredentials.deviceId,
                                                                                             @"SRP_A" : [srpHelper.clientState.publicA stringValueWithRadix:16],
                                                                                             @"SECRET_HASH" : [self.pool calculateSecretHash:self.username]}];
    
    input.challengeName = deviceChallenge.challengeName;
    input.session = deviceChallenge.session;
    input.challengeResponses = challengeResponses;
    
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
        NSMutableDictionary * authParameters = [[NSMutableDictionary alloc] initWithDictionary:@{@"USERNAME":self.username,
                                                                                                 @"DEVICE_KEY": deviceCredentials.deviceId,
                                                                                                 @"TIMESTAMP": [AWSCognitoIdentityProviderSrpHelper generateDateString:srpHelper.clientState.timestamp],
                                                                                                 @"SECRET_HASH" : [self.pool calculateSecretHash:self.username],
                                                                                                 @"PASSWORD_CLAIM_SECRET_BLOCK" :  authDetails.challengeParameters[@"SECRET_BLOCK"],
                                                                                                 @"PASSWORD_CLAIM_SIGNATURE" : [[srpHelper completeAuthentication:serverState] base64EncodedStringWithOptions:0]
                                                                                                 }];
        
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
 * Invoke developer's ui to prompt user for mfa code and call enhanceAuth
 */
-(AWSTask<AWSCognitoIdentityUserSession *>*) mfaAuthInternal: (NSString *) deliveryMedium destination:(NSString *) destination  authState:(NSString *) authState authenticationDelegate:(id<AWSCognitoIdentityMultiFactorAuthentication>)authenticationDelegate{
    AWSTaskCompletionSource<NSString *> *mfaCode = [[AWSTaskCompletionSource<NSString *> alloc] init];
    AWSCognitoIdentityMultifactorAuthenticationInput* authenticationInput = [[AWSCognitoIdentityMultifactorAuthenticationInput alloc] initWithDeliveryMedium:deliveryMedium destination:destination];
    [authenticationDelegate getMultiFactorAuthenticationCode:authenticationInput mfaCodeCompletionSource:mfaCode];
    return [mfaCode.task
            continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
                AWSCognitoIdentityProviderRespondToAuthChallengeRequest *enhance = [AWSCognitoIdentityProviderRespondToAuthChallengeRequest new];
                enhance.session = authState;
                enhance.challengeName = AWSCognitoIdentityProviderChallengeNameTypeSmsMfa;
                enhance.clientId = self.pool.userPoolConfiguration.clientId;
                
                NSMutableDictionary * challengeResponses = [[NSMutableDictionary alloc] initWithDictionary:@{@"USERNAME": self.username,
                                                                                                         @"SECRET_HASH" :[self.pool calculateSecretHash:self.username],
                                                                                                         @"SMS_MFA_CODE" : mfaCode.task.result
                                                                                                         }];
                enhance.challengeResponses = challengeResponses;
                
                [self addDeviceKey:challengeResponses];

                return [[[self.pool.client respondToAuthChallenge:enhance] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderRespondToAuthChallengeResponse *> * _Nonnull task) {
                    AWSCognitoIdentityProviderRespondToAuthChallengeResponse *response = task.result;
                    AWSCognitoIdentityProviderAuthenticationResultType * authResult = response.authenticationResult;
                    AWSCognitoIdentityUserSession * session = [[AWSCognitoIdentityUserSession alloc] initWithIdToken:authResult.idToken accessToken:authResult.accessToken refreshToken:authResult.refreshToken expiresIn:authResult.expiresIn];
                    //last step is to perform device auth if device key is supplied or we are being challenged with device auth
                    if(authResult.latestDeviceMetadata != nil || response.challengeName == AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth){
                        return [self performDeviceAuth: task session:session];
                    }else{
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
                        return [self mfaAuthInternal:deliveryMedium destination:destination authState:authState authenticationDelegate:authenticationDelegate];
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

-(BOOL) isSignedIn {
    if(self.username == nil){
        return NO;
    }
    
    NSString * keyChainNamespace = [self keyChainNamespaceClientId];
    NSString * refreshTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserRefreshToken];
    return self.pool.keychain[refreshTokenKey] != nil;
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
    
    if(deviceSecret){
        NSString * deviceGroupKey = [self keyChainKey:keyChainNamespace key:AWSCognitoIdentityUserDeviceGroup];
        self.pool.keychain[deviceGroupKey] = deviceGroup;
    }
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
    return deviceCredentials?deviceCredentials.deviceId:nil;
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

@implementation AWSCognitoIdentityUserListDevicesResponse

@end

@implementation AWSCognitoIdentityUserUpdateDeviceStatusResponse

@end

@implementation AWSCognitoIdentityUserGlobalSignOutResponse

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
