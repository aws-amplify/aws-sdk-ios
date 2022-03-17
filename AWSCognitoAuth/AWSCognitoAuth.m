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

#import "AWSCognitoAuth_Internal.h"
#import <AWSCognitoIdentityProviderASF/AWSCognitoIdentityProviderASF.h>
#import <SafariServices/SafariServices.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <AWSCore/AWSCore.h>

NSString *const AWSCognitoAuthErrorDomain = @"com.amazon.cognito.AWSCognitoAuthErrorDomain";

@interface AWSCognitoAuth()<SFSafariViewControllerDelegate, NSURLConnectionDelegate>

@property (atomic, readwrite) AWSCognitoAuthGetSessionBlock getSessionBlock;
@property (atomic, readwrite) AWSCognitoAuthSignOutBlock signOutBlock;
@property (atomic, readwrite) NSError * getSessionError;
@property (atomic, readwrite) NSError * signOutError;

@property (atomic, readwrite) SFSafariViewController *svc;
@property (atomic, readwrite) UIViewController * pvc;
@property (atomic, readwrite) NSString * state;
@property (atomic, readwrite) NSString * proofKey;
@property (atomic, readwrite) NSString * proofKeyHash;
@property (atomic, readwrite) NSMutableData * responseData;

@property (nonatomic, strong) NSOperationQueue * getSessionQueue;
@property (nonatomic, strong) NSOperationQueue * signOutQueue;

@property (nonatomic) BOOL useSFAuthenticationSession;
@property (nonatomic) BOOL sfAuthenticationSessionAvailable;
@property (nonatomic) BOOL isHandlingRedirection;
@property (nonatomic) BOOL isAuthProviderExternal;
@property (nonatomic) BOOL isProcessingSignOut;
@property (nonatomic) BOOL isProcessingSignIn;

@end

API_AVAILABLE(ios(11.0))
@interface AWSCognitoAuth()

@property (nonatomic, strong) SFAuthenticationSession *sfAuthSession;

@end

API_AVAILABLE(ios(13.0))
@interface AWSCognitoAuth()<ASWebAuthenticationPresentationContextProviding>

@property (nonatomic, strong) ASWebAuthenticationSession *asAuthSession;
@property (nonatomic, weak) ASPresentationAnchor presentationAnchor;


@end

@interface AWSCognitoAuthConfiguration()

@property (nonatomic, readwrite) NSString * signInUri;
@property (nonatomic, readwrite) NSString * tokensUri;
@property (nonatomic, readwrite) NSString * signOutUri;
@property (nonatomic, readwrite) NSDictionary<NSString *, NSString *> * signInUriQueryParameters;
@property (nonatomic, readwrite) NSDictionary<NSString *, NSString *> * tokensUriQueryParameters;
@property (nonatomic, readwrite) NSDictionary<NSString *, NSString *> * signOutUriQueryParameters;
@property (nonatomic) BOOL isAuthProviderExternal;
@property (nonatomic) BOOL isSignInPrivateSession;
@property (nonatomic) AWSServiceConfiguration * userPoolConfig;

@end

@implementation AWSCognitoAuth

NSString *const AWSCognitoAuthSDKVersion = @"2.27.4";


static NSMutableDictionary *_instanceDictionary = nil;
static dispatch_queue_t _dispatchQueue = nil;

static NSString *const AWSInfoCognitoAuth = @"CognitoUserPool";  //Consistent with AWSCognitoIdentityUserPool name
NSString *const AWSCognitoAuthUserAccessToken = @"accessToken";  //Consistent with AWSCognitoIdentityUserPool name
static const NSString * AWSCognitoAuthUserIdToken = @"idToken";  //Consistent with AWSCognitoIdentityUserPool name
static const NSString * AWSCognitoAuthUserRefreshToken = @"refreshToken";  //Consistent with AWSCognitoIdentityUserPool name
static const NSString * AWSCognitoAuthUserScopes = @"scopes";
static const NSString * AWSCognitoAuthUserTokenExpiration = @"tokenExpiration";  //Consistent with AWSCognitoIdentityUserPool name
static NSString * AWSCognitoAuthUserPoolCurrentUser = @"currentUser";  //Consistent with AWSCognitoIdentityUserPool name
static NSString *const AWSCognitoAuthAppClientIdLegacy = @"CognitoUserPoolAppClientId";  //Consistent with AWSCognitoIdentityUserPool name
static NSString *const AWSCognitoAuthAppClientSecretLegacy = @"CognitoUserPoolAppClientSecret";  //Consistent with AWSCognitoIdentityUserPool name
static NSString *const AWSCognitoAuthAppClientId = @"AppClientId";  //Consistent with AWSCognitoIdentityUserPool name
static NSString *const AWSCognitoAuthAppClientSecret = @"AppClientSecret";  //Consistent with AWSCognitoIdentityUserPool name
static NSString *const AWSCognitoAuthWebDomainLegacy = @"CognitoAuthWebDomain";
static NSString *const AWSCognitoAuthScopesLegacy = @"CognitoAuthScopes";
static NSString *const AWSCognitoAuthSignInRedirectUriLegacy = @"CognitoAuthSignInRedirectUri";
static NSString *const AWSCognitoAuthSignOutRedirectUriLegacy = @"CognitoAuthSignOutRedirectUri";
static NSString *const AWSCognitoAuthWebDomain = @"WebDomain";
static NSString *const AWSCognitoAuthScopes = @"Scopes";
static NSString *const AWSCognitoAuthSignInRedirectUri = @"SignInRedirectUri";
static NSString *const AWSCognitoAuthSignOutRedirectUri = @"SignOutRedirectUri";
static NSString *const AWSCognitoAuthIdpIdentifier = @"IdpIdentifier";
static NSString *const AWSCognitoAuthIdentityProvider = @"IdentityProvider";
static NSString *const AWSCognitoAuthPoolId = @"PoolIdForEnablingASF";
static NSString *const AWSCognitoAuthUseSFAuthSession = @"EnableSFAuthenticationSesssion";
static NSString *const AWSCognitoAuthUnknown = @"Unknown";
static NSString * AWSCognitoAuthAsfDeviceId = @"asf.device.id";


#pragma mark init and configuration

+ (instancetype)defaultCognitoAuth {
    static AWSCognitoAuth *_defaultAuth = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //get config from Info.plist
        NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary][@"AWS"][AWSInfoCognitoAuth][@"Default"];
        NSString *appClientId = infoDictionary[AWSCognitoAuthAppClientId] ?: infoDictionary[AWSCognitoAuthAppClientIdLegacy];
        NSString *appClientSecret = infoDictionary[AWSCognitoAuthAppClientSecret] ?: infoDictionary[AWSCognitoAuthAppClientSecretLegacy];
        NSString *webDomain = infoDictionary[AWSCognitoAuthWebDomain] ?: infoDictionary[AWSCognitoAuthWebDomainLegacy];
        NSSet<NSString *> *scopesSet;
        scopesSet = infoDictionary[AWSCognitoAuthScopes]!=nil?[NSSet setWithArray:infoDictionary[AWSCognitoAuthScopes]]:nil;
        if (!scopesSet) {
            scopesSet = infoDictionary[AWSCognitoAuthScopesLegacy]!=nil?[NSSet setWithArray:infoDictionary[AWSCognitoAuthScopesLegacy]]:nil;
        }
        NSSet<NSString *> *scopes = scopesSet;
        NSString *signInRedirectUri = infoDictionary[AWSCognitoAuthSignInRedirectUri] ?: infoDictionary[AWSCognitoAuthSignInRedirectUriLegacy];
        NSString *signOutRedirectUri = infoDictionary[AWSCognitoAuthSignOutRedirectUri] ?: infoDictionary[AWSCognitoAuthSignOutRedirectUriLegacy];
        NSString *idpIdentifier = infoDictionary[AWSCognitoAuthIdpIdentifier];
        NSString *identityProvider = infoDictionary[AWSCognitoAuthIdentityProvider];
        NSString *userPoolId = infoDictionary[AWSCognitoAuthPoolId];
        BOOL useSFAuthSession = infoDictionary[AWSCognitoAuthUseSFAuthSession];

        if (appClientId && webDomain && scopes && signOutRedirectUri && signInRedirectUri) {
            AWSCognitoAuthConfiguration *authConfiguration = [[AWSCognitoAuthConfiguration alloc] initWithAppClientId:appClientId
                                                                                                      appClientSecret:appClientSecret
                                                                                                               scopes:scopes
                                                                                                    signInRedirectUri:signInRedirectUri
                                                                                                   signOutRedirectUri:signOutRedirectUri
                                                                                                            webDomain:webDomain
                                                                                                     identityProvider:identityProvider
                                                                                                        idpIdentifier:idpIdentifier
                                                                                             userPoolIdForEnablingASF:userPoolId
                                                                                       enableSFAuthSessionIfAvailable:useSFAuthSession];
            _defaultAuth = [[AWSCognitoAuth alloc] initWithConfiguration:authConfiguration];
        } else {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` before using this method."
                                         userInfo:nil];
        }
    });

    return _defaultAuth;
}

+ (void)registerCognitoAuthWithAuthConfiguration:(AWSCognitoAuthConfiguration *) authConfiguration
                                          forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instanceDictionary = [NSMutableDictionary new];
        _dispatchQueue = dispatch_queue_create("com.amazonaws.AWSCognitoAuthDictionary", DISPATCH_QUEUE_SERIAL);
    });
    AWSCognitoAuth *cognitoAuth = [[AWSCognitoAuth alloc] initWithConfiguration:authConfiguration];
    [self setObject:cognitoAuth
             forKey:key];
}

+ (instancetype)CognitoAuthForKey:(NSString *)key {
    return [self objectForKey:key];
}

+ (void)removeCognitoAuthForKey:(NSString *)key {
    [self removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCognitoAuth` or `+ CognitoAuthForKey:` instead."
                                 userInfo:nil];
    return nil;
}

// Internal init method
- (instancetype)initWithConfiguration:(AWSCognitoAuthConfiguration *)authConfiguration; {
    if (self = [super init]) {
        _signOutQueue = [NSOperationQueue new];
        _signOutQueue.maxConcurrentOperationCount = 1;

        _getSessionQueue = [NSOperationQueue new];
        _getSessionQueue.maxConcurrentOperationCount = 1;

        _authConfiguration = [authConfiguration copy];

        _useSFAuthenticationSession = authConfiguration.isSFAuthenticationSessionEnabled;
        _sfAuthenticationSessionAvailable = NO;
        _keychain = [AWSCognitoAuthUICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@", [NSBundle mainBundle].bundleIdentifier, @"AWSCognitoIdentityUserPool"]];  //Consistent with AWSCognitoIdentityUserPool
    }
    return self;
}

- (NSString *) refreshTokenFromKeyChain: (NSString *) keyChainNamespace {
    NSString * refreshTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserRefreshToken];
    NSString * refreshToken = self.keychain[refreshTokenKey];
    return refreshToken;
}

- (BOOL) isSignedIn {
    NSString * keyChainNamespace = [self keyChainNamespaceClientId: [self currentUsername]];
    NSString * refreshToken = [self refreshTokenFromKeyChain:keyChainNamespace];
    return refreshToken!=nil;
}

- (void)launchSignInWithViewController:(UIViewController *) vc
                            completion:(nullable AWSCognitoAuthGetSessionBlock) completion {
    [self launchUsing:nil uiViewController:vc completion:completion];
}

- (void)launchSignInWithWebUI:(nonnull ASPresentationAnchor) anchor
                   completion:(nullable AWSCognitoAuthGetSessionBlock) completion {
    [self launchUsing:anchor uiViewController:nil completion:completion];
}

- (void)launchUsing:(nullable ASPresentationAnchor) anchor
   uiViewController:(nullable UIViewController *) vc
         completion:(nullable AWSCognitoAuthGetSessionBlock) completion {
    __block __weak NSOperation *weakGetSessionOperation;
    NSOperation *getSessionOperation = [NSBlockOperation blockOperationWithBlock:^{
        self.presentationAnchor = anchor;
        [self prepareForSignIn:vc completion:completion];
        if(weakGetSessionOperation.isCancelled){
            [self dismissSafariViewControllerAndCompleteGetSession:nil error:self.getSessionError];
        }
        [self launchSignInVC:vc];
    }];
    weakGetSessionOperation = getSessionOperation;
    [self.getSessionQueue addOperation:getSessionOperation];
}

#pragma mark get session

- (void)getSession:(AWSCognitoAuthGetSessionBlock) completion {
    self.presentationAnchor = nil;
    [self enqueueGetSession:nil completion:completion];
}

- (void)getSession:(UIViewController *) vc completion: (AWSCognitoAuthGetSessionBlock) completion {
    self.presentationAnchor = nil;
    [self enqueueGetSession:vc completion:completion];
}

- (void)getSessionWithWebUI: (ASPresentationAnchor) anchor
                 completion: (nullable AWSCognitoAuthGetSessionBlock) completion {
    self.presentationAnchor = anchor;
    [self enqueueGetSession:nil completion:completion];
}

/**
 Adds another getSession operation to the serialized queue of getSession requests
 */
- (void)enqueueGetSession:(nullable UIViewController *) vc completion: (AWSCognitoAuthGetSessionBlock) completion {
    __block __weak NSOperation *weakGetSessionOperation;
    NSOperation *getSessionOperation =  [NSBlockOperation blockOperationWithBlock:^{
        [self getSessionInternal:vc completion:completion];
        if(weakGetSessionOperation.isCancelled){
            [self dismissSafariViewControllerAndCompleteGetSession:nil error:self.getSessionError];
        }
    }];
    weakGetSessionOperation = getSessionOperation;
    [self.getSessionQueue addOperation:getSessionOperation];
}

/**
 Cleanup resources from the sign in attempt
 */
- (void) cleanupSignIn {
    self.getSessionBlock = nil;
    self.proofKey = nil;
    self.state = nil;
    self.proofKeyHash = nil;
    self.pvc = nil;
    self.responseData = nil;
}

- (void)prepareForSignIn:(UIViewController *) vc
              completion:(AWSCognitoAuthGetSessionBlock) completion {
    self.getSessionBlock = completion;
    self.state = [[[NSUUID UUID] UUIDString] lowercaseString];
    self.proofKey = [self generateRandom:32];
    self.proofKeyHash = [self calculateSHA256Hash:self.proofKey];
    self.pvc = vc;
}

/**
 Launch the sign in ui on the provided viewcontroller
 */
- (void) launchSignInVC: (UIViewController *) vc {
    NSString *suffix = @"";
    if(self.authConfiguration.idpIdentifier || self.authConfiguration.identityProvider){
        if(self.authConfiguration.idpIdentifier){
            suffix = [NSString stringWithFormat:@"&idp_identifier=%@", self.authConfiguration.idpIdentifier];
        } else {
            suffix = [NSString stringWithFormat:@"&identity_provider=%@", self.authConfiguration.identityProvider];
        }
    }
    if(self.authConfiguration.asfEnabled){
        NSString *userContextEncoded = [AWSCognitoIdentityProviderASF userContextData:self.authConfiguration.userPoolId
                                                                             username:@"unknown"
                                                                             deviceId:[self asfDeviceId]
                                                                     userPoolClientId:self.authConfiguration.appClientId];
        NSString * userContext = [NSString stringWithFormat:@"&userContextData=%@",[self urlEncode:userContextEncoded]];
        suffix = [suffix stringByAppendingString:userContext];
    }

    NSString *urlString = [NSString stringWithFormat:@"%@?response_type=code&client_id=%@&state=%@&redirect_uri=%@&scope=%@&code_challenge=%@&code_challenge_method=S256%@&%@",
                     self.authConfiguration.signInUri,
                     self.authConfiguration.appClientId,
                     self.state,
                     [self urlEncode:self.authConfiguration.signInRedirectUri],
                     [self urlEncode:[self normalizeScopes]],
                     self.proofKeyHash,
                     suffix,
                     [self getQueryStringSuffixForParameters: self.authConfiguration.signInUriQueryParameters]];

    NSURL *url = [NSURL URLWithString:urlString];
    if(@available(iOS 13.0, *)) {
        if (self.presentationAnchor) {
            [self launchASWebAuthenticationSession: url];
        } else {
            [self launchLegacySession:url withPresentingViewController:vc];
        }
    } else {
        [self launchLegacySession:url withPresentingViewController:vc];
    }
}

- (void)launchLegacySession:(NSURL *)url
withPresentingViewController:(UIViewController *)presentingViewController {
    if (self.useSFAuthenticationSession) {
        if (@available(iOS 11.0, *)) {
            [self launchSFWebAuthenticationSession: url];
        } else {
            // Fallback on earlier versions
            [self showSFSafariViewControllerForURL:url withPresentingViewController:presentingViewController];
        }
    } else {
        [self showSFSafariViewControllerForURL:url withPresentingViewController:presentingViewController];
    }
}

- (void)launchSFWebAuthenticationSession:(NSURL *)hostedUIURL API_AVAILABLE(ios(11.0)) {
    self.sfAuthenticationSessionAvailable = YES;
    NSString *callbackURLScheme = [[self urlEncode:self.authConfiguration.signInRedirectUri] copy];
    __weak AWSCognitoAuth *weakSelf = self;
    self.sfAuthSession = [[SFAuthenticationSession alloc] initWithURL:hostedUIURL
                                                    callbackURLScheme:callbackURLScheme
                                                    completionHandler:^(NSURL * _Nullable url,
                                                                        NSError * _Nullable error) {
        __strong AWSCognitoAuth *strongSelf = weakSelf;
        [strongSelf handleSignInCallbackWithURL:url error:error];
    }];
    [self.sfAuthSession start];
}

- (void)launchASWebAuthenticationSession:(NSURL *)hostedUIURL API_AVAILABLE(ios(13.0)) {
    NSString *callbackURLString = [[self urlEncode:self.authConfiguration.signInRedirectUri] copy];
    NSURL *callbackURL = [[NSURL alloc] initWithString:callbackURLString];
    NSString *callbackURLScheme = callbackURL.scheme;
    __weak AWSCognitoAuth *weakSelf = self;
    self.asAuthSession = [[ASWebAuthenticationSession alloc] initWithURL:hostedUIURL
                                                       callbackURLScheme:callbackURLScheme
                                                       completionHandler:^(NSURL * _Nullable url,
                                                                           NSError * _Nullable error) {
        __strong AWSCognitoAuth *strongSelf = weakSelf;
        [strongSelf handleSignInCallbackWithURL:url error:error];
    }];
    
    if (@available(iOS 13.0, *)) {
        self.asAuthSession.prefersEphemeralWebBrowserSession = self.authConfiguration.isSignInPrivateSession;
        self.asAuthSession.presentationContextProvider = self;
    }
    [self.asAuthSession start];
}

- (nonnull ASPresentationAnchor)presentationAnchorForWebAuthenticationSession:(nonnull ASWebAuthenticationSession *)session  API_AVAILABLE(ios(13.0)) {
    return self.presentationAnchor;
}

- (void)handleSignInCallbackWithURL:(NSURL * _Nullable) url
                              error:(NSError * _Nullable) error {
    if (url) {
        [self processURL:url forRedirection:NO];
    } else {
        [self dismissSafariViewControllerAndCompleteGetSession:nil error:error];
    }
}

-(void)showSFSafariViewControllerForURL:(NSURL *)url
           withPresentingViewController:(UIViewController *)presentingViewController{
    self.svc = [[SFSafariViewController alloc] initWithURL:url entersReaderIfAvailable:NO];
    self.svc.delegate = self;
    self.svc.modalPresentationStyle = UIModalPresentationPopover;
    self.isProcessingSignIn = YES;
    dispatch_async(dispatch_get_main_queue(), ^{
        __block UIViewController * sourceVC = presentingViewController;
        if(!sourceVC){
            if(!self.delegate){
                [self dismissSafariViewControllerAndCompleteGetSession:nil error:[self getError:@"delegate must be set to a valid AWSCognitoAuthDelegate" code:AWSCognitoAuthClientInvalidAuthenticationDelegate]];
                return;
            } else {
                sourceVC = [self.delegate getViewController];
            }
        }
        [self setPopoverSource:self.svc source:sourceVC];
        [sourceVC presentViewController:self.svc animated:NO completion:nil];
    });
}

/**
 * Configure source view for a modal popup view controller
 */
-(UIViewController *) setPopoverSource: (UIViewController *) popover source: (UIViewController *) source {
    popover.popoverPresentationController.sourceView = source.view;
    popover.popoverPresentationController.sourceRect = source.view.bounds;
    [popover setPreferredContentSize:CGSizeMake(source.view.bounds.size.width/1.5,source.view.bounds.size.height/1.5)];
    [popover.popoverPresentationController setPermittedArrowDirections:0];
    return popover;
}

/**
 Check keychain for valid session, if expired or not available, prompt end user via ui
 */
- (void)getSessionInternal: (nullable UIViewController *) vc completion: (AWSCognitoAuthGetSessionBlock) completion {

    [self prepareForSignIn:vc completion:completion];
    //check to see if we have valid tokens
    NSString * username = [self currentUsername];
    if(username){
        __block NSString * keyChainNamespace = [self keyChainNamespaceClientId: [self currentUsername]];
        NSString * expirationDateKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserTokenExpiration];
        NSString * expirationDate = self.keychain[expirationDateKey];
        NSString * scopesKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserScopes];
        NSString * scopes = self.keychain[scopesKey];

        if(expirationDate && scopes != nil && [scopes isEqualToString:[self normalizeScopes]]){
            NSDate *expiration = [self dateFromString:expirationDate];
            NSString * refreshToken = [self refreshTokenFromKeyChain:keyChainNamespace];
            NSString * accessTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserAccessToken];
            NSString * accessToken = self.keychain[accessTokenKey];

            //if the session expires > 5 minutes return it.
            if(expiration && [expiration compare:[NSDate dateWithTimeIntervalSinceNow:5 * 60]] == NSOrderedDescending && accessToken){
                NSString * idTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserIdToken];
                AWSCognitoAuthUserSession * session = [[AWSCognitoAuthUserSession alloc] initWithIdToken:self.keychain[idTokenKey]
                                                                                             accessToken:accessToken
                                                                                            refreshToken:refreshToken
                                                                                          expirationTime:expiration];
                [self dismissSafariViewControllerAndCompleteGetSession:session error:nil];
                return;
            }
            //else refresh it using the refresh token
            else if(refreshToken){
                NSString *url = [NSString stringWithFormat:@"%@",self.authConfiguration.tokensUri];
                NSString *queryParameters = [self getQueryStringSuffixForParameters:self.authConfiguration.tokensUriQueryParameters];
                NSString *body = [NSString stringWithFormat:@"grant_type=refresh_token&client_id=%@&refresh_token=%@",self.authConfiguration.appClientId, refreshToken];
                if(queryParameters) {
                    body = [NSString stringWithFormat:@"%@&%@", body, queryParameters];
                }
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
                [self addHeaders:request];
                request.HTTPMethod = @"POST";
                request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
                NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
                [connection scheduleInRunLoop:[NSRunLoop mainRunLoop]
                                      forMode:NSDefaultRunLoopMode];
                [connection start];
                return;
            }
        }
    }
    //if we made it this far, we need the end user to authenticate
    [self launchSignInVC: vc];
}

/**
 Dismiss ui, invoke completion and cleanup a getSession call.
 */
- (void) dismissSafariViewControllerAndCompleteGetSession: (nullable AWSCognitoAuthUserSession *) userSession  error:(nullable NSError *) error {
    if(error){
        [self setInternalGetSessionErrorAndCancelSignInOperations:error];
    }
    self.isProcessingSignIn = NO;

    if (self.sfAuthenticationSessionAvailable) {
        [self cleanUpAndCallGetSessionBlock:userSession error:error];
    } else {
        [self dismissSafariVC: ^{
            [self cleanUpAndCallGetSessionBlock:userSession error:error];
        }];
    }
}

- (void) cleanUpAndCallGetSessionBlock: (nullable AWSCognitoAuthUserSession *) userSession  error:(nullable NSError *) error {
    AWSCognitoAuthGetSessionBlock getSessionBlock = self.getSessionBlock;
    [self cleanupSignIn];
    if(getSessionBlock){
        getSessionBlock(userSession, error);
    }
}

#pragma mark sign out

/**
 Dismiss ui, invoke completion and cleanup a signOut call.
 */
- (void) dismissSafariViewControllerAndCompleteSignOut:(nullable NSError *) error {
    if(error){
        [self setInternalSignOutErrorAndCancelSignOutOperations:error];
    }
    self.isProcessingSignOut = NO;

    if (self.sfAuthenticationSessionAvailable) {
        [self cleanUpAndCallSignOutBlock:error];
    } else {
        [self dismissSafariVC: ^{
            [self cleanUpAndCallSignOutBlock:error];
        }];
    }
}

- (void) cleanUpAndCallSignOutBlock:(nullable NSError *) error {
    AWSCognitoAuthSignOutBlock signOutBlock = self.signOutBlock;
    self.signOutBlock = nil;
    if(signOutBlock){
        signOutBlock(error);
    }
}

- (void) signOut: (AWSCognitoAuthSignOutBlock) completion {
    self.presentationAnchor = nil;
    if(!self.delegate){
        completion([self getError:@"delegate must be set to a valid AWSCognitoAuthDelegate" code:AWSCognitoAuthClientInvalidAuthenticationDelegate]);
    }else {
        [self signOut: [self.delegate getViewController] completion:completion];
    }
}

- (void) signOut: (UIViewController *) vc completion: (AWSCognitoAuthSignOutBlock) completion {
    self.presentationAnchor = nil;
    [self enqueueSignOut:vc completion:completion];
}

- (void) signOutWithWebUI:(ASPresentationAnchor) anchor completion:(AWSCognitoAuthSignOutBlock) completion {
    self.presentationAnchor = anchor;
    [self enqueueSignOut:nil completion:completion];
}

- (void)enqueueSignOut:(nullable UIViewController *) vc
            completion: (AWSCognitoAuthSignOutBlock) completion {
    __block __weak NSOperation *weakSignOutOperation;
    NSOperation *signOutOperation =  [NSBlockOperation blockOperationWithBlock:^{
        if(weakSignOutOperation.isCancelled){
            completion(self.signOutError);
        }
        [self signOutInternal:vc completion:completion];
    }];
    weakSignOutOperation = signOutOperation;
    [self.signOutQueue addOperation:signOutOperation];
}

- (NSString *)getQueryStringSuffixForParameters:(NSDictionary<NSString *, NSString *> *)queryParameters {
    if (queryParameters.count > 0) {
        NSString *queryString = @"";
        for(NSString *key in queryParameters) {
            NSString *value = [queryParameters objectForKey:key];
            if(value) {
                queryString = [NSString stringWithFormat:@"%@%@=%@&",queryString, key, value];
            } else {
                queryString = [NSString stringWithFormat:@"%@&", key];
            }
        }
        return [queryString substringToIndex:[queryString length] - 1];
    } else {
        return @"";
    }
}


/**
 Display ui for signout
 */
- (void) signOutInternal:(UIViewController *) vc completion:(AWSCognitoAuthSignOutBlock) completion {
    self.signOutBlock = completion;
    NSString *urlString = [NSString stringWithFormat:@"%@?%@",
                     self.authConfiguration.signOutUri,
                     [self getQueryStringSuffixForParameters:self.authConfiguration.signOutUriQueryParameters]];
    NSURL *url = [NSURL URLWithString:urlString];
    if(@available(iOS 13.0, *)) {
        if (self.presentationAnchor) {
            [self launchASWebAuthenticationSessionForSignOut:url];
        } else {
            [self launchLegacySessionForSignOut:url withPresentingViewController:vc];
        }
    } else {
        [self launchLegacySessionForSignOut:url withPresentingViewController:vc];
    }
}

- (void)launchASWebAuthenticationSessionForSignOut:(NSURL *) url API_AVAILABLE(ios(13.0)) {
    NSString *callbackURLString = [[self urlEncode:self.authConfiguration.signInRedirectUri] copy];
    NSURL *callbackURL = [[NSURL alloc] initWithString:callbackURLString];
    NSString *callbackURLScheme = callbackURL.scheme;
    __weak AWSCognitoAuth *weakSelf = self;
    self.asAuthSession = [[ASWebAuthenticationSession alloc] initWithURL:url
                                                       callbackURLScheme:callbackURLScheme
                                                       completionHandler:^(NSURL * _Nullable url,
                                                                           NSError * _Nullable error) {
        __strong AWSCognitoAuth *strongSelf = weakSelf;
        if (url) {
            [strongSelf processURL:url forRedirection:NO];
        } else {
            if (error.code != ASWebAuthenticationSessionErrorCodeCanceledLogin) {
                [strongSelf signOutLocallyAndClearLastKnownUser];
            }
            [strongSelf dismissSafariViewControllerAndCompleteSignOut:error];
        }
    }];
    if (@available(iOS 13.0, *)) {
        self.asAuthSession.presentationContextProvider = self;
    }
    [self.asAuthSession start];
}

- (void)launchLegacySessionForSignOut:(NSURL *) url
         withPresentingViewController:(UIViewController *) presentingViewController {
    if (self.useSFAuthenticationSession) {
        if (@available(iOS 11.0, *)) {
            [self launchSFAuthenticationSessionForSignOut:url];
        } else {
            [self signOutSFSafariVC:presentingViewController url:url];
        }
    } else {
        [self signOutSFSafariVC:presentingViewController url:url];
    }
}

- (void)launchSFAuthenticationSessionForSignOut:(NSURL *) url API_AVAILABLE(ios(11.0)) {
    self.sfAuthenticationSessionAvailable = YES;
    NSString *callbackURLScheme = [[self urlEncode:self.authConfiguration.signOutRedirectUri] copy];
    __weak AWSCognitoAuth *weakSelf = self;
    self.sfAuthSession = [[SFAuthenticationSession alloc] initWithURL:url
                                                    callbackURLScheme:callbackURLScheme
                                                    completionHandler:^(NSURL * _Nullable url,
                                                                        NSError * _Nullable error) {
        __strong AWSCognitoAuth *strongSelf = weakSelf;
        if (url) {
            [strongSelf processURL:url forRedirection:NO];
        } else {
            if (error.code != SFAuthenticationErrorCanceledLogin) {
                [strongSelf signOutLocallyAndClearLastKnownUser];
            }
            [strongSelf dismissSafariViewControllerAndCompleteSignOut:error];
        }
    }];
    [self.sfAuthSession start];
}

- (void)signOutSFSafariVC: (UIViewController *) vc
                      url:(NSURL *)url {
    self.svc = [[SFSafariViewController alloc] initWithURL:url entersReaderIfAvailable:NO];
    self.svc.delegate = self;
    self.svc.modalPresentationStyle = UIModalPresentationPopover;
    self.isProcessingSignOut = YES;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setPopoverSource:self.svc source:vc];
        [vc presentViewController:self.svc animated:NO completion:nil];
    });
}

/**
 Remove user session from keychain
 */
-(void) signOutLocally {
    if([self currentUsername]){
        NSArray *keys = self.keychain.allKeys;
        NSString *keyChainPrefix = [[self keyChainNamespaceClientId:[self currentUsername]] stringByAppendingString:@"."];
        for (NSString *key in keys) {
            //clear tokens associated with this user
            if([key hasPrefix:keyChainPrefix]){
                [self.keychain removeItemForKey:key];
            }
        }
    }
}

/**
 Remove user session from keychain and clear last known username.
 */
-(void) signOutLocallyAndClearLastKnownUser{
    [self signOutLocally];
    [self clearLastKnownUser];
}

#pragma mark date conversion

/**
 Obtain a date formatter for this format: yyyy-MM-dd'T'HH:mm:ss'Z'
 */
-(NSDateFormatter *) getDateFormatter {
    static NSDateFormatter *_dateFormatter = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    });
    return _dateFormatter;
}

/**
 Convert a string to date
 */
-(NSDate *) dateFromString:(NSString *)string {
    return [[self getDateFormatter] dateFromString:string];
}

/**
 Convert a string to date
 */
-(NSString *) stringValue: (NSDate*) date {
    return [[self getDateFormatter] stringFromDate:date];
}



#pragma mark SFSafariViewController delegate

/*! @abstract Delegate callback called when the user taps the Done button. Upon this call, the view controller is dismissed modally. */
- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    NSError *error = [self getError:@"User cancelled operation" code:AWSCognitoAuthClientErrorUserCanceledOperation];
    if(self.getSessionBlock){
        [self setInternalGetSessionErrorAndCancelSignInOperations:error];
        [self cleanUpAndCallGetSessionBlock:nil error:error];
    } else {
        [self setInternalSignOutErrorAndCancelSignOutOperations:error];
        [self cleanUpAndCallSignOutBlock:error];
    }
}

- (void)setInternalSignOutErrorAndCancelSignOutOperations:(NSError *)error {
    self.signOutError = error;
    [self.signOutQueue cancelAllOperations];
}

- (void)setInternalGetSessionErrorAndCancelSignInOperations:(NSError *)error {
    self.getSessionError = error;
    [self.getSessionQueue cancelAllOperations];
}

/*! @abstract Invoked when the initial URL load is complete.
 @param didLoadSuccessfully YES if loading completed successfully, NO if loading failed.
 @discussion This method is invoked when SFSafariViewController completes the loading of the URL that you pass
 to its initializer. It is not invoked for any subsequent page loads in the same SFSafariViewController instance.
 */
- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
    if(!didLoadSuccessfully && !self.isHandlingRedirection && !(self.isProcessingSignOut || self.isProcessingSignIn)){
        NSError *error = [self getError:@"Loading page failed" code:AWSCognitoAuthClientErrorLoadingPageFailed];
        if(self.getSessionBlock){
            [self dismissSafariViewControllerAndCompleteGetSession:nil error:error];
        }else if(self.signOutBlock){
            [self dismissSafariViewControllerAndCompleteSignOut:error];
        }
    }
}

#pragma PKCE

/**
 Generate a random number of size bytes and base64 encode it with a url safe encoding.
 */
-(NSString *) generateRandom: (int) size {
    NSMutableData *data = [NSMutableData dataWithLength:size];
    int result = SecRandomCopyBytes(kSecRandomDefault, size, data.mutableBytes);

    if(result){
        return nil;
    }

    return [self urlSafeBase64:[data base64EncodedStringWithOptions:0]];
}

/**
 Calculate a SHA256 Hash of a string and base64 encode it with a url safe encoding.
 */
-(NSString *) calculateSHA256Hash: (NSString *) string {
    NSMutableData *hashOutput = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];
    if(CC_SHA256([[[string dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES] mutableCopy] mutableBytes], (CC_LONG)[string lengthOfBytesUsingEncoding:NSASCIIStringEncoding], hashOutput.mutableBytes)){
        return [self urlSafeBase64:[hashOutput base64EncodedStringWithOptions:0]];
    }
    return nil;
}

/**
 Make a base64 encoded string url safe
 */
-(NSString *) urlSafeBase64: (NSString *) string {
    return [[[string stringByReplacingOccurrencesOfString:@"/" withString:@"_"] stringByReplacingOccurrencesOfString:@"+" withString:@"-"] stringByReplacingOccurrencesOfString:@"=" withString:@""];
}

/**
 Make a string url safe
 **/
- (NSString *) urlEncode: (NSString *) stringToEncode {
    return  [stringToEncode stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    return [self processURL:url forRedirection:YES];
}

- (BOOL)processURL:(NSURL *)url forRedirection:(BOOL)isProcessingRedirection {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:url
                                                resolvingAgainstBaseURL:NO];
    NSArray<NSURLQueryItem *>* queryItems = [urlComponents queryItems];
    NSMutableDictionary *queryItemsDict = nil;
    if(queryItems) {
        queryItemsDict = [NSMutableDictionary new];

        for(NSURLQueryItem * queryItem in queryItems){
            [queryItemsDict setObject:queryItem.value forKey:queryItem.name];
        }
    }
    NSString *urlLowerCaseString = [[url absoluteString] lowercaseString];
    NSString *signInRedirectLowerCaseString = [self.authConfiguration.signInRedirectUri lowercaseString];
    NSString *signOutRedirectLowerCaseString = [self.authConfiguration.signOutRedirectUri lowercaseString];
    if([urlLowerCaseString hasPrefix:signInRedirectLowerCaseString] && queryItemsDict[@"state"]) {
        if(queryItemsDict[@"code"]){
            //if state doesn't match, abort
            if(![self.state isEqualToString:queryItemsDict[@"state"]]){
                [self dismissSafariViewControllerAndCompleteGetSession:nil error:[self getError:@"State code did not match request" code: AWSCognitoAuthClientErrorSecurityFailed]];
                return YES;
            } else {
                //continue with authorization code request
                NSString * code = queryItemsDict[@"code"];
                if(code){
                    // If we are processing this request on behalf of a redirection request from SFSafariViewController, then
                    // set a flag to prevent us from interpreting a "NO" callback to `safariViewController:didCompleteInitialLoad:`
                    // as an error. We will clear this flag in `connectionDidFinishLoading:` after the auth token request has
                    // completed
                    if (isProcessingRedirection) {
                        self.isHandlingRedirection = YES;
                    }
                    
                    NSString *queryParameters = [self getQueryStringSuffixForParameters:self.authConfiguration.tokensUriQueryParameters];
                    NSString *url = [NSString stringWithFormat:@"%@",self.authConfiguration.tokensUri];
                    NSString *body = [NSString stringWithFormat:@"grant_type=authorization_code&client_id=%@&code=%@&redirect_uri=%@&code_verifier=%@",
                                      self.authConfiguration.appClientId, code, self.authConfiguration.signInRedirectUri, self.proofKey];
                    if(queryParameters) {
                        body = [NSString stringWithFormat:@"%@&%@", body, queryParameters];
                    }
                    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
                    request.HTTPMethod = @"POST";
                    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
                    [self addHeaders:request];
                    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
                    [connection scheduleInRunLoop:[NSRunLoop mainRunLoop]
                                          forMode:NSDefaultRunLoopMode];
                    [connection start];
                    return YES;
                }
            }
        }else if(queryItemsDict[@"error"]){
            NSString *error = queryItemsDict[@"error"];
            NSString *errorDescription = queryItemsDict[@"error_description"];
            if(errorDescription){
                error = [NSString stringWithFormat:@"%@: %@", error, errorDescription];
            }
            [self dismissSafariViewControllerAndCompleteGetSession:nil error:[self getError:error code: AWSCognitoAuthClientErrorBadRequest]];
            return YES;
        }
    } else if([urlLowerCaseString hasPrefix:signOutRedirectLowerCaseString]){
        if(queryItemsDict[@"error"]){
            NSString *error = queryItemsDict[@"error"];
            NSString *errorDescription = queryItemsDict[@"error_description"];
            if(errorDescription){
                error = [NSString stringWithFormat:@"%@: %@", error, errorDescription];
            }
            [self signOutLocallyAndClearLastKnownUser];
            [self dismissSafariViewControllerAndCompleteSignOut:[self getError:error code:AWSCognitoAuthClientErrorBadRequest]];
        }else{
            [self signOutLocallyAndClearLastKnownUser];
            [self dismissSafariViewControllerAndCompleteSignOut:nil];
        }
        return YES;
    }
    return NO;
}

#pragma mark HTTP header modification

/**
 Add authorization and User-Agent header as appropriate.
 */
-(void) addHeaders: (NSMutableURLRequest *) request {
    if(self.authConfiguration.appClientSecret){
        NSString* value = [[[NSString stringWithFormat:@"%@:%@", self.authConfiguration.appClientId, self.authConfiguration.appClientSecret] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
        value = [NSString stringWithFormat: @"Basic %@", value];
        [request setValue:value forHTTPHeaderField:@"Authorization"];
    }
    [request setValue: [self fetchBaseUserAgent] forHTTPHeaderField:@"User-Agent"];
}

/**
 Dismiss and reap the safari view controller
 */
-(void) dismissSafariVC: (void (^)(void)) dismissBlock {
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.svc){
            [self.svc dismissViewControllerAnimated:NO completion:^{
                dismissBlock();
                //clean up vc
                self.svc = nil;
            }];
        } else {
            dismissBlock();
        }
    });
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.isHandlingRedirection = NO;
    NSError * error;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&error];
    if(error){
        [self dismissSafariViewControllerAndCompleteGetSession:nil error:[self getError:[error description] code:AWSCognitoAuthClientErrorUnknown]];
        return;
    }
    else if(result[@"error"]){
        //refresh token has expired, switch to interactive auth
        if([@"invalid_grant" isEqualToString:result[@"error"]]){
            if (![self.delegate respondsToSelector:@selector(shouldLaunchSignInVCIfRefreshTokenIsExpired)]) {
                [self launchSignInVC:self.pvc];
            }else {
                BOOL present = [self.delegate shouldLaunchSignInVCIfRefreshTokenIsExpired];
                if (present) {
                    [self launchSignInVC:self.pvc];
                }else {
                    [self dismissSafariViewControllerAndCompleteGetSession:nil error:[self getError:result[@"error"] code:AWSCognitoAuthClientErrorExpiredRefreshToken]];
                }
            }
        }else {
            [self dismissSafariViewControllerAndCompleteGetSession:nil error:[self getError:result[@"error"] code:AWSCognitoAuthClientErrorUnknown]];
        }
    }else {
        /** Check to see if refreshToken is received from the server.
         If not, load it from the keychain.
         */
        NSString * refreshToken = [result valueForKey:@"refresh_token"];
        if (refreshToken == nil){
            NSString * keyChainNamespace = [self keyChainNamespaceClientId: [self currentUsername]];
            refreshToken = [self refreshTokenFromKeyChain:keyChainNamespace];
        }
        AWSCognitoAuthUserSession *userSession = [[AWSCognitoAuthUserSession alloc] initWithIdToken:[result valueForKey:@"id_token"]  accessToken:[result valueForKey:@"access_token"] refreshToken:refreshToken expiresIn:[result valueForKey:@"expires_in"]];
        if(!userSession.accessToken){
            [self dismissSafariViewControllerAndCompleteGetSession:nil error: [self getError:@"Tokens not received" code:AWSCognitoAuthClientErrorUnknown]];
        }else{
            [self updateUsernameAndPersistTokens:userSession];
            [self dismissSafariViewControllerAndCompleteGetSession:userSession error:nil];
        }
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self dismissSafariViewControllerAndCompleteGetSession:nil error:[self getError:error.description code:AWSCognitoAuthClientErrorLoadingPageFailed]];
}


#pragma mark keychain utilities

- (NSString*) currentUsername {
    return self.keychain[[self currentUserKey]];
}

- (NSString *) currentUserKey {
    return [self keyChainNamespaceClientId:AWSCognitoAuthUserPoolCurrentUser];
}

- (void) setCurrentUser:(NSString *) username {
    self.keychain[[self currentUserKey]] = username;
}

- (void) clearLastKnownUser {
    NSString * currentUserKey = [self currentUserKey];
    if(currentUserKey){
        [self.keychain removeItemForKey:[self currentUserKey]];
    }
}

/**
 Removes everything from the keychain under this appClientId
 */
- (void) clearAll {
    NSArray *keys = self.keychain.allKeys;
    NSString *keyChainPrefix = [self keyChainNamespaceClientId:@""];
    for (NSString *key in keys) {
        if([key hasPrefix:keyChainPrefix]){
            [self.keychain removeItemForKey:key];
        }
    }
}

- (NSString *) keyChainNamespaceClientId:(NSString *)username {
    return [NSString stringWithFormat:@"%@.%@", self.authConfiguration.appClientId, username];
}


/**
 * Get a namespaced keychain key given a namespace and key
 */
- (NSString *) keyChainKey: (NSString *) namespace key:(const NSString *) key {
    return [NSString stringWithFormat:@"%@.%@", namespace, key];
}

/**
 Update the username and persist session tokens in the keychain
 */
- (void) updateUsernameAndPersistTokens: (AWSCognitoAuthUserSession *) session {
    NSString * keyChainNamespace = [self keyChainNamespaceClientId:session.username];
    NSString * idTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserIdToken];

    if(session.idToken){
        self.keychain[idTokenKey] = session.idToken.tokenString;
    }
    if(session.accessToken){
        NSString * accessTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserAccessToken];
        self.keychain[accessTokenKey] = session.accessToken.tokenString;
        if(!session.idToken){
            [self.keychain removeItemForKey:idTokenKey];
        }
        NSString * scopesKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserScopes];
        self.keychain[scopesKey] = [self normalizeScopes];
    }
    if(session.refreshToken){
        NSString * refreshTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserRefreshToken];
        self.keychain[refreshTokenKey] = session.refreshToken.tokenString;
    }
    if(session.expirationTime){
        NSString * expirationTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserTokenExpiration];
        self.keychain[expirationTokenKey] = [self stringValue:session.expirationTime];
    }
    [self setCurrentUser:session.username];
}

/**
 Get the device id if Advanced Security Feature is turned on
 */
- (NSString *) asfDeviceId {
    NSString * asfDeviceIdKey = [self keyChainKey:self.authConfiguration.appClientId key:AWSCognitoAuthAsfDeviceId];
    NSString * asfDeviceId = self.keychain[asfDeviceIdKey];
    if(asfDeviceId == nil){
        asfDeviceId = [[[NSUUID UUID] UUIDString] lowercaseString];
        self.keychain[asfDeviceIdKey] = asfDeviceId;
    }

    return asfDeviceId;
}

/**
 Helper for getting errors
 */
-(NSError *) getError:(NSString *) error code:(AWSCognitoAuthClientErrorType) code {
    NSMutableDictionary * errors = [NSMutableDictionary new];
    if(error){
        [errors setObject:[error stringByReplacingOccurrencesOfString:@"+" withString:@" "]forKey:@"error"];
    }
    return [NSError errorWithDomain:AWSCognitoAuthErrorDomain code:code userInfo:errors];
}

/**
 Sort scopes in lexigraphical order and join them with a space character.
 */
-(NSString*) normalizeScopes {
    return [[[self.authConfiguration.scopes allObjects] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString * string1 = (NSString *) obj1;
        NSString * string2 = (NSString *) obj2;
        return [string1 compare:string2];
    }] componentsJoinedByString:@" "];
}

#pragma mark instance dictionary

/**
 Get an object from the instanceDictionary
 */
+ (id)objectForKey:(id)aKey {
    __block id returnObject = nil;

    dispatch_sync(_dispatchQueue, ^{
        returnObject = [_instanceDictionary objectForKey:aKey];
    });

    return returnObject;
}

/**
 Remove an object from the instanceDictionary
 */
+ (void)removeObjectForKey:(id)aKey {
    dispatch_sync(_dispatchQueue, ^{
        [_instanceDictionary removeObjectForKey:aKey];
    });
}

/**
 Set an object in the instanceDictionary
 */
+ (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey {
    dispatch_sync(_dispatchQueue, ^{
        [_instanceDictionary setObject:anObject forKey:aKey];
    });
}

- (NSString *)fetchBaseUserAgent {
    if (self.authConfiguration.userPoolConfig == nil) {
        return [AWSCognitoAuth userAgent];
    }
    return [self.authConfiguration.userPoolConfig userAgent];
}
/**
 Generate the user agent string
 */
+ (NSString *) userAgent {
    static NSString *_userAgent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *systemName = [[[UIDevice currentDevice] systemName] stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        if (!systemName) {
            systemName = AWSCognitoAuthUnknown;
        }
        NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
        if (!systemVersion) {
            systemVersion = AWSCognitoAuthUnknown;
        }
        NSString *localeIdentifier = [[NSLocale currentLocale] localeIdentifier];
        if (!localeIdentifier) {
            localeIdentifier = AWSCognitoAuthUnknown;
        }
        _userAgent = [NSString stringWithFormat:@"aws-sdk-iOS/%@ %@/%@ %@/lite", AWSCognitoAuthSDKVersion, systemName, systemVersion, localeIdentifier];
    });

    return _userAgent;
}

@end

@implementation AWSCognitoAuthUserSession

-(instancetype) initWithIdToken:(NSString *)idToken accessToken:(NSString *)accessToken refreshToken:(NSString *)refreshToken expiresIn:(NSNumber *) expiresIn {
    self = [self initWithIdToken:idToken accessToken:accessToken refreshToken:refreshToken expirationTime:[NSDate dateWithTimeIntervalSinceNow:expiresIn.doubleValue]];
    return self;
}

-(instancetype) initWithIdToken:(NSString *)idToken accessToken:(NSString *)accessToken refreshToken:(NSString *)refreshToken expirationTime:(NSDate *) expirationTime {
    self = [super init];
    if(self != nil) {
        self.idToken = [[AWSCognitoAuthUserSessionToken alloc] initWithToken:idToken];
        self.accessToken = [[AWSCognitoAuthUserSessionToken alloc] initWithToken:accessToken];
        self.refreshToken = [[AWSCognitoAuthUserSessionToken alloc] initWithToken:refreshToken];
        self.expirationTime = expirationTime;
    }
    return self;
}


-(NSString *) username {
    return self.accessToken.claims[@"username"] ? self.accessToken.claims[@"username"] : self.accessToken.claims[@"sub"];
}


@end

@implementation AWSCognitoAuthUserSessionToken

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

-(NSDictionary *) claims {
    NSDictionary * result = @{};
    NSArray *pieces = [self.tokenString componentsSeparatedByString:@"."];
    if(pieces.count > 2){
        NSString * claims = pieces[1];
        claims = [claims stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
        claims = [claims stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
        //JWT is not padded with =, pad it if necessary
        NSUInteger paddedLength = claims.length + (4 - (claims.length % 4)) % 4;;
        claims = [claims stringByPaddingToLength:paddedLength withString:@"=" startingAtIndex:0];

        NSData * claimsData = [[NSData alloc] initWithBase64EncodedString:claims options:NSDataBase64DecodingIgnoreUnknownCharacters];
        NSError *error = nil;
        if(claimsData != nil){
            result = [NSJSONSerialization JSONObjectWithData:claimsData options:kNilOptions error:&error];
            if(error) {
                NSLog(@"Unable to deserialize token claims: %@", error);
            }
        } else {
            NSLog(@"Token is not valid base64");
        }
    }
    return result;
}


@end

@implementation AWSCognitoAuthConfiguration

- (instancetype)initWithAppClientId:(NSString *) appClientId
                    appClientSecret:(nullable NSString *)appClientSecret
                             scopes:(NSSet<NSString *> *) scopes
                  signInRedirectUri:(NSString *) signInRedirectUri
                 signOutRedirectUri:(NSString *) signOutRedirectUri
                          webDomain:(NSString *) webDomain {
    return [self initWithAppClientId:appClientId
                     appClientSecret:appClientSecret
                              scopes:scopes
                   signInRedirectUri:signInRedirectUri
                  signOutRedirectUri:signOutRedirectUri
                           webDomain:webDomain
                    identityProvider:nil
                       idpIdentifier:nil
            userPoolIdForEnablingASF:nil];
}

- (instancetype)initWithAppClientId:(NSString *) appClientId
                    appClientSecret:(nullable NSString *) appClientSecret
                             scopes:(NSSet<NSString *> *) scopes
                  signInRedirectUri:(NSString *) signInRedirectUri
                 signOutRedirectUri:(NSString *) signOutRedirectUri
                          webDomain:(NSString *) webDomain
                   identityProvider:(nullable NSString *) identityProvider
                      idpIdentifier:(nullable NSString *) idpIdentifier
           userPoolIdForEnablingASF:(nullable NSString *) userPoolIdForEnablingASF {
    return [self initWithAppClientId:appClientId
                     appClientSecret:appClientSecret
                              scopes:scopes
                   signInRedirectUri:signInRedirectUri
                  signOutRedirectUri:signOutRedirectUri
                           webDomain:webDomain
                    identityProvider:identityProvider
                       idpIdentifier:idpIdentifier
            userPoolIdForEnablingASF:userPoolIdForEnablingASF
      enableSFAuthSessionIfAvailable:NO];
}

- (instancetype)initWithAppClientId:(NSString *) appClientId
                    appClientSecret:(nullable NSString *)appClientSecret
                             scopes:(NSSet<NSString *> *) scopes
                  signInRedirectUri:(NSString *) signInRedirectUri
                 signOutRedirectUri:(NSString *) signOutRedirectUri
                          webDomain:(NSString *) webDomain
                   identityProvider:(nullable NSString *) identityProvider
                      idpIdentifier:(nullable NSString *) idpIdentifier
           userPoolIdForEnablingASF:(nullable NSString *) userPoolIdForEnablingASF
     enableSFAuthSessionIfAvailable:(BOOL) enableSFAuthSession  {
    
    
    return [self initWithAppClientIdInternal:appClientId
                             appClientSecret:appClientSecret
                                      scopes:scopes
                           signInRedirectUri:signInRedirectUri
                          signOutRedirectUri:signOutRedirectUri
                                   webDomain:webDomain
                            identityProvider:identityProvider
                               idpIdentifier:idpIdentifier
                    userPoolIdForEnablingASF:userPoolIdForEnablingASF
              enableSFAuthSessionIfAvailable:enableSFAuthSession
                                   signInUri:[NSString stringWithFormat:@"%@/oauth2/authorize",webDomain]
                                  signOutUri:[NSString stringWithFormat:@"%@/logout",webDomain]
                                   tokensUri:[NSString stringWithFormat:@"%@/oauth2/token",webDomain]
                    signInUriQueryParameters:@{}
                   signOutUriQueryParameters:@{@"client_id": appClientId, @"logout_uri": signOutRedirectUri}
                     tokenUriQueryParameters:@{}
                          isProviderExternal:NO];
}

- (instancetype)initWithAppClientIdInternal:(NSString *) appClientId
                            appClientSecret:(nullable NSString *)appClientSecret
                                     scopes:(NSSet<NSString *> *) scopes
                          signInRedirectUri:(NSString *) signInRedirectUri
                         signOutRedirectUri:(NSString *) signOutRedirectUri
                                  webDomain:(NSString *) webDomain
                           identityProvider:(nullable NSString *) identityProvider
                              idpIdentifier:(nullable NSString *) idpIdentifier
                   userPoolIdForEnablingASF:(nullable NSString *) userPoolIdForEnablingASF
             enableSFAuthSessionIfAvailable:(BOOL) enableSFAuthSession
                                  signInUri:(NSString *) signInUri
                                 signOutUri:(NSString *) signOutUri
                                  tokensUri:(NSString *) tokensUri
                   signInUriQueryParameters:(NSDictionary<NSString *, NSString *> *) signInUriQueryParameters
                  signOutUriQueryParameters:(NSDictionary<NSString *, NSString *> *) signOutUriQueryParameters
                    tokenUriQueryParameters:(NSDictionary<NSString *, NSString *> *) tokenUriQueryParameters
                         isProviderExternal:(BOOL) isProviderExternal {

    return [self initWithAppClientIdInternal:appClientId
                             appClientSecret:appClientSecret
                                      scopes:scopes
                           signInRedirectUri:signInRedirectUri
                          signOutRedirectUri:signOutRedirectUri
                                   webDomain:webDomain
                            identityProvider:identityProvider
                               idpIdentifier:idpIdentifier
                    userPoolIdForEnablingASF:userPoolIdForEnablingASF
              enableSFAuthSessionIfAvailable:enableSFAuthSession
                                   signInUri:signInUri
                                  signOutUri:signOutUri
                                   tokensUri:tokensUri
                    signInUriQueryParameters:signInUriQueryParameters
                   signOutUriQueryParameters:signOutUriQueryParameters
                     tokenUriQueryParameters:tokenUriQueryParameters
                          isProviderExternal:isProviderExternal
                cognitoUserPoolServiceConfig:nil
                        signInPrivateSession:NO];
}

- (instancetype)initWithAppClientIdInternal:(NSString *) appClientId
                            appClientSecret:(nullable NSString *)appClientSecret
                                     scopes:(NSSet<NSString *> *) scopes
                          signInRedirectUri:(NSString *) signInRedirectUri
                         signOutRedirectUri:(NSString *) signOutRedirectUri
                                  webDomain:(NSString *) webDomain
                           identityProvider:(nullable NSString *) identityProvider
                              idpIdentifier:(nullable NSString *) idpIdentifier
                   userPoolIdForEnablingASF:(nullable NSString *) userPoolIdForEnablingASF
             enableSFAuthSessionIfAvailable:(BOOL) enableSFAuthSession
                                  signInUri:(NSString *) signInUri
                                 signOutUri:(NSString *) signOutUri
                                  tokensUri:(NSString *) tokensUri
                   signInUriQueryParameters:(NSDictionary<NSString *, NSString *> *) signInUriQueryParameters
                  signOutUriQueryParameters:(NSDictionary<NSString *, NSString *> *) signOutUriQueryParameters
                    tokenUriQueryParameters:(NSDictionary<NSString *, NSString *> *) tokenUriQueryParameters
                         isProviderExternal:(BOOL) isProviderExternal
               cognitoUserPoolServiceConfig:(nullable AWSServiceConfiguration *) serviceConfig
                       signInPrivateSession:(BOOL)isSignInPrivateSession {
    if (self = [super init]) {
        
        if (!isProviderExternal) {
            _signInUri = [NSString stringWithFormat:@"%@/oauth2/authorize", webDomain];
            _signOutUri = [NSString stringWithFormat:@"%@/logout", webDomain];
            _tokensUri = [NSString stringWithFormat:@"%@/oauth2/token", webDomain];
            _signOutUriQueryParameters = @{@"client_id": appClientId, @"logout_uri": signOutRedirectUri};
        } else {
            _signInUri = signInUri;
            _signOutUri = signOutUri;
            _tokensUri = tokensUri;
            _signOutUriQueryParameters = signOutUriQueryParameters;
        }
        
        _appClientId = appClientId;
        _appClientSecret = appClientSecret;
        _scopes = scopes;
        _signInRedirectUri = signInRedirectUri;
        _signOutRedirectUri = signOutRedirectUri;
        _webDomain = webDomain;
        _identityProvider = identityProvider;
        _idpIdentifier = idpIdentifier;
        _userPoolId = userPoolIdForEnablingASF;
        _isSFAuthenticationSessionEnabled = enableSFAuthSession;
        _signInUriQueryParameters = signInUriQueryParameters;
        _tokensUriQueryParameters = tokenUriQueryParameters;
        _isAuthProviderExternal = isProviderExternal;
        _userPoolConfig = serviceConfig;
        _isSignInPrivateSession = isSignInPrivateSession;
    }
    
    return self;
}


- (id)copyWithZone:(NSZone *)zone {

    AWSCognitoAuthConfiguration *configuration = [[[self class] allocWithZone:zone] initWithAppClientIdInternal:self.appClientId
                                                                                                appClientSecret:self.appClientSecret
                                                                                                         scopes:self.scopes
                                                                                              signInRedirectUri:self.signInRedirectUri
                                                                                             signOutRedirectUri:self.signOutRedirectUri
                                                                                                      webDomain:self.webDomain
                                                                                               identityProvider:self.identityProvider
                                                                                                  idpIdentifier:self.idpIdentifier
                                                                                       userPoolIdForEnablingASF:self.userPoolId
                                                                                 enableSFAuthSessionIfAvailable: self.isSFAuthenticationSessionEnabled
                                                                                                      signInUri: self.signInUri
                                                                                                     signOutUri:self.signOutUri
                                                                                                      tokensUri:self.tokensUri
                                                                                       signInUriQueryParameters:self.signInUriQueryParameters
                                                                                      signOutUriQueryParameters:self.signOutUriQueryParameters
                                                                                        tokenUriQueryParameters:self.tokensUriQueryParameters
                                                                                             isProviderExternal:self.isAuthProviderExternal
                                                                                   cognitoUserPoolServiceConfig:self.userPoolConfig
                                                                                           signInPrivateSession:self.isSignInPrivateSession];
    return configuration;
}

/**
 Determine whether to send user context data during authentication to support advanced security feature
 */
-(BOOL) isASFEnabled {
    return self.userPoolId != nil;
}

@end
