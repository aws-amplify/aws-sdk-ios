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
#import <SafariServices/SafariServices.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

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

@end

@implementation AWSCognitoAuth

static NSString *const AWSCognitoAuthSDKVersion = @"2.5.10";


static NSMutableDictionary *_instanceDictionary = nil;
static dispatch_queue_t _dispatchQueue = nil;

static NSString *const AWSInfoCognitoAuth = @"CognitoUserPool";  //Consistent with AWSCognitoIdentityUserPool name
NSString *const AWSCognitoAuthUserAccessToken = @"accessToken";  //Consistent with AWSCognitoIdentityUserPool name
static const NSString * AWSCognitoAuthUserIdToken = @"idToken";  //Consistent with AWSCognitoIdentityUserPool name
static const NSString * AWSCognitoAuthUserRefreshToken = @"refreshToken";  //Consistent with AWSCognitoIdentityUserPool name
static const NSString * AWSCognitoAuthUserScopes = @"scopes";
static const NSString * AWSCognitoAuthUserTokenExpiration = @"tokenExpiration";  //Consistent with AWSCognitoIdentityUserPool name
static NSString * AWSCognitoAuthUserPoolCurrentUser = @"currentUser";  //Consistent with AWSCognitoIdentityUserPool name
static NSString *const AWSCognitoAuthAppClientId = @"CognitoUserPoolAppClientId";  //Consistent with AWSCognitoIdentityUserPool name
static NSString *const AWSCognitoAuthAppClientSecret = @"CognitoUserPoolAppClientSecret";  //Consistent with AWSCognitoIdentityUserPool name
static NSString *const AWSCognitoAuthWebDomain = @"CognitoAuthWebDomain";
static NSString *const AWSCognitoAuthScopes = @"CognitoAuthScopes";
static NSString *const AWSCognitoAuthSignInRedirectUri = @"CognitoAuthSignInRedirectUri";
static NSString *const AWSCognitoAuthSignOutRedirectUri = @"CognitoAuthSignOutRedirectUri";
static NSString *const AWSCognitoAuthUnknown = @"Unknown";


#pragma mark init and configuration

+ (instancetype)defaultCognitoAuth {
    static AWSCognitoAuth *_defaultAuth = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //get config from Info.plist
        NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary][@"AWS"][AWSInfoCognitoAuth][@"Default"];
        NSString *appClientId = infoDictionary[AWSCognitoAuthAppClientId];
        NSString *appClientSecret = infoDictionary[AWSCognitoAuthAppClientSecret];
        NSString *webDomain = infoDictionary[AWSCognitoAuthWebDomain];
        NSSet<NSString *> *scopes = infoDictionary[AWSCognitoAuthScopes]!=nil?[NSSet setWithArray:infoDictionary[AWSCognitoAuthScopes]]:nil;
        NSString *signInRedirectUri = infoDictionary[AWSCognitoAuthSignInRedirectUri];
        NSString *signOutRedirectUri = infoDictionary[AWSCognitoAuthSignOutRedirectUri];
        
        if (appClientId && webDomain && scopes && signOutRedirectUri && signInRedirectUri) {
            AWSCognitoAuthConfiguration *authConfiguration = [[AWSCognitoAuthConfiguration alloc] initWithAppClientId:appClientId
                                                                                                      appClientSecret:appClientSecret
                                                                                                               scopes:scopes
                                                                                                    signInRedirectUri:signInRedirectUri
                                                                                                   signOutRedirectUri:signOutRedirectUri
                                                                                                            webDomain:webDomain];
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
        _getSessionQueue = [NSOperationQueue new];
        _authConfiguration = [authConfiguration copy];
        _keychain = [AWSCognitoAuthUICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@", [NSBundle mainBundle].bundleIdentifier, @"AWSCognitoIdentityUserPool"]];  //Consistent with AWSCognitoIdentityUserPool
    }
    return self;
}

- (BOOL) isSignedIn {
    NSString * keyChainNamespace = [self keyChainNamespaceClientId: [self currentUsername]];
    NSString * refreshTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserRefreshToken];
    NSString * refreshToken = self.keychain[refreshTokenKey];
    return refreshToken!=nil;
}

#pragma mark sign in

- (void)getSession:(AWSCognitoAuthGetSessionBlock) completion {
    [self enqueueGetSession:nil completion:completion];
}

- (void)getSession:(UIViewController *) vc completion: (AWSCognitoAuthGetSessionBlock) completion {
    [self enqueueGetSession:vc completion:completion];
}

/**
 Adds another getSession operation to the serialized queue of getSession requests
 */
- (void)enqueueGetSession:(nullable UIViewController *) vc completion: (AWSCognitoAuthGetSessionBlock) completion {
    __block NSOperation *getSessionOperation =  [NSBlockOperation blockOperationWithBlock:^{
        [self getSessionInternal:vc completion:completion];
        if(getSessionOperation.isCancelled){
            [self completeGetSession:nil error:self.getSessionError];
        }
    }];
    
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

/**
 Launch the sign in ui on the provided viewcontroller
 */
- (void) launchSignInVC: (UIViewController *) vc {
    NSString *url = [NSString stringWithFormat:@"%@/oauth2/authorize?response_type=code&client_id=%@&state=%@&redirect_uri=%@&scope=%@&code_challenge=%@&code_challenge_method=S256",self.authConfiguration.webDomain, self.authConfiguration.appClientId, self.state,[self urlEncode:self.authConfiguration.signInRedirectUri], [self urlEncode:[self normalizeScopes]], self.proofKeyHash];
    self.svc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:url] entersReaderIfAvailable:NO];
    self.svc.delegate = self;
    self.svc.modalPresentationStyle = UIModalPresentationPopover;
    dispatch_async(dispatch_get_main_queue(), ^{
        if(!vc){
            if(!self.delegate){
                [self completeGetSession:nil error:[self getError:@"delegate must be set to a valid AWSCognitoAuthDelegate" code:AWSCognitoAuthClientInvalidAuthenticationDelegate]];
                return;
            }
            [[self.delegate getViewController] presentViewController:self.svc animated:NO completion:nil];
        }else {
            [vc presentViewController:self.svc animated:NO completion:nil];
        }
    });
}
    
/**
 Check keychain for valid session, if expired or not available, prompt end user via ui
 */
- (void)getSessionInternal: (nullable UIViewController *) vc completion: (AWSCognitoAuthGetSessionBlock) completion {
    self.getSessionBlock = completion;
    self.state = [[[NSUUID UUID] UUIDString] lowercaseString];
    self.proofKey = [self generateRandom:32];
    self.proofKeyHash = [self calculateSHA256Hash:self.proofKey];
    self.pvc = vc;
    
    
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
            NSString * refreshTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserRefreshToken];
            NSString * refreshToken = self.keychain[refreshTokenKey];
            
            //if the session expires > 5 minutes return it.
            if(expiration && [expiration compare:[NSDate dateWithTimeIntervalSinceNow:5 * 60]] == NSOrderedDescending){
                NSString * idTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserIdToken];
                NSString * accessTokenKey = [self keyChainKey:keyChainNamespace key:AWSCognitoAuthUserAccessToken];
                AWSCognitoAuthUserSession * session = [[AWSCognitoAuthUserSession alloc] initWithIdToken:self.keychain[idTokenKey] accessToken:self.keychain[accessTokenKey] refreshToken:refreshToken expirationTime:expiration];
                [self completeGetSession:session error:nil];
                return;
            }
            //else refresh it using the refresh token
            else if(refreshToken){
                NSString *url = [NSString stringWithFormat:@"%@/oauth2/token",self.authConfiguration.webDomain];
                NSString *body = [NSString stringWithFormat:@"grant_type=refresh_token&client_id=%@&refresh_token=%@",self.authConfiguration.appClientId, refreshToken];
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
- (void) completeGetSession: (nullable AWSCognitoAuthUserSession *) userSession  error:(nullable NSError *) error {
    [self dismissSafariVC];
    if(error){
        self.getSessionError = error;
        [self.getSessionQueue cancelAllOperations];
    }
    if(self.getSessionBlock){
        self.getSessionBlock(userSession, error);
    }
    
    [self cleanupSignIn];
}

#pragma mark sign out

/**
 Dismiss ui, invoke completion and cleanup a signOut call.
 */
- (void) completeSignOut:(nullable NSError *) error {
    [self dismissSafariVC];
    if(error){
        self.signOutError = error;
        [self.signOutQueue cancelAllOperations];
    }
    if(self.signOutBlock){
        self.signOutBlock(error);
        self.signOutBlock = nil;
    }
}

- (void) signOut: (AWSCognitoAuthSignOutBlock) completion {
    if(!self.delegate){
        completion([self getError:@"delegate must be set to a valid AWSCognitoAuthDelegate" code:AWSCognitoAuthClientInvalidAuthenticationDelegate]);
    }else {
        [self signOut: [self.delegate getViewController] completion:completion];
    }
}

- (void) signOut: (UIViewController *) vc completion: (AWSCognitoAuthSignOutBlock) completion {
    __block NSOperation *signOutOperation =  [NSBlockOperation blockOperationWithBlock:^{
        if(signOutOperation.isCancelled){
            completion(self.signOutError);
        }
        [self signOutInternal:vc completion:completion];
    }];
    [self.signOutQueue addOperation:signOutOperation];
    
}


/**
 Display ui for signout
 */
- (void) signOutInternal: (UIViewController *) vc completion: (AWSCognitoAuthSignOutBlock) completion {
    self.signOutBlock = completion;
    NSString *url = [NSString stringWithFormat:@"%@/logout?client_id=%@&logout_uri=%@",self.authConfiguration.webDomain, self.authConfiguration.appClientId, [self urlEncode:self.authConfiguration.signOutRedirectUri]];
    self.svc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:url] entersReaderIfAvailable:NO];
    self.svc.delegate = self;
    self.svc.modalPresentationStyle = UIModalPresentationPopover;
    dispatch_async(dispatch_get_main_queue(), ^{
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
        [self completeGetSession:nil error:error];
    }else {
        [self completeSignOut:error];
    }
}

/*! @abstract Invoked when the initial URL load is complete.
 @param didLoadSuccessfully YES if loading completed successfully, NO if loading failed.
 @discussion This method is invoked when SFSafariViewController completes the loading of the URL that you pass
 to its initializer. It is not invoked for any subsequent page loads in the same SFSafariViewController instance.
 */
- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
    if(!didLoadSuccessfully){
        NSError *error = [self getError:@"Loading page failed" code:AWSCognitoAuthClientErrorLoadingPageFailed];
        if(self.getSessionBlock){
            [self completeGetSession:nil error:error];
        }else if(self.signOutBlock){
            [self completeSignOut:error];
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
    if([[url absoluteString] hasPrefix:self.authConfiguration.signInRedirectUri] && queryItemsDict[@"state"]) {
        if(queryItemsDict[@"code"]){
            //if state doesn't match, abort
            if(![self.state isEqualToString:queryItemsDict[@"state"]]){
                [self completeGetSession:nil error:[self getError:@"State code did not match request" code: AWSCognitoAuthClientErrorSecurityFailed]];
                return YES;
            } else {
                //continue with authorization code request
                NSString * code = queryItemsDict[@"code"];
                if(code){
                    NSString *url = [NSString stringWithFormat:@"%@/oauth2/token",self.authConfiguration.webDomain];
                    NSString *body = [NSString stringWithFormat:@"grant_type=authorization_code&client_id=%@&code=%@&redirect_uri=%@&code_verifier=%@",
                                      self.authConfiguration.appClientId, code, self.authConfiguration.signInRedirectUri, self.proofKey];
                    
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
            [self completeGetSession:nil error:[self getError:error code: AWSCognitoAuthClientErrorBadRequest]];
            return YES;
        }
    } else if([[url absoluteString] hasPrefix:self.authConfiguration.signOutRedirectUri]){
        if(queryItemsDict[@"error"]){
            NSString *error = queryItemsDict[@"error"];
            NSString *errorDescription = queryItemsDict[@"error_description"];
            if(errorDescription){
                error = [NSString stringWithFormat:@"%@: %@", error, errorDescription];
            }
            [self signOutLocallyAndClearLastKnownUser];
            [self completeSignOut:[self getError:error code:AWSCognitoAuthClientErrorBadRequest]];
        }else{
            [self signOutLocallyAndClearLastKnownUser];
            [self completeSignOut:nil];
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
    [request setValue: [AWSCognitoAuth userAgent] forHTTPHeaderField:@"User-Agent"];
}

/**
 Dismiss and reap the safari view controller
 */
-(void) dismissSafariVC {
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.svc){
            [self.svc dismissViewControllerAnimated:NO completion:^{
                //clean up vc
                self.svc = nil;
            }];
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
    NSError * error;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&error];
    if(error){
        [self completeGetSession:nil error:[self getError:[error description] code:AWSCognitoAuthClientErrorUnknown]];
        return;
    }
    else if(result[@"error"]){
        //refresh token has expired, switch to interactive auth
        if([@"invalid_grant" isEqualToString:result[@"error"]]){
            [self launchSignInVC:self.pvc];
            return;
        }
        
        [self completeGetSession:nil error:[self getError:result[@"error"] code:AWSCognitoAuthClientErrorUnknown]];
    }else {
        AWSCognitoAuthUserSession *userSession = [[AWSCognitoAuthUserSession alloc] initWithIdToken:[result valueForKey:@"id_token"]  accessToken:[result valueForKey:@"access_token"] refreshToken:[result valueForKey:@"refresh_token"] expiresIn:[result valueForKey:@"expires_in"]];
        if(!userSession.accessToken){
            [self completeGetSession:nil error: [self getError:@"Tokens not received" code:AWSCognitoAuthClientErrorUnknown]];
        }else{
            [self updateUsernameAndPersistTokens:userSession];
            [self completeGetSession:userSession error:nil];
        }
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self completeGetSession:nil error:[self getError:error.description code:AWSCognitoAuthClientErrorLoadingPageFailed]];
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
    return self.accessToken.claims[@"username"];
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
    NSDictionary * result = nil;
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
                          webDomain:(NSString *) webDomain
{
    if (self = [super init]) {
        _appClientId = appClientId;
        _appClientSecret = appClientSecret;
        _scopes = scopes;
        _signInRedirectUri = signInRedirectUri;
        _signOutRedirectUri = signOutRedirectUri;
        _webDomain = webDomain;
    }
    
    return self;
}


- (id)copyWithZone:(NSZone *)zone {
    AWSCognitoAuthConfiguration *configuration = [[[self class] allocWithZone:zone] initWithAppClientId:self.appClientId
                                                                                        appClientSecret:self.appClientSecret
                                                                                                 scopes:self.scopes
                                                                                      signInRedirectUri:self.signInRedirectUri
                                                                                     signOutRedirectUri:self.signOutRedirectUri
                                                                                              webDomain:self.webDomain];
    return configuration;
}

@end
