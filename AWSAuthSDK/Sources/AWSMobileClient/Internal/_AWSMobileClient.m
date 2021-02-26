//
// Copyright 2017-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "_AWSMobileClient.h"
#import <AWSCognitoIdentityProvider/AWSCognitoIdentityProvider.h>
#ifdef USE_XCF
    #import "AWSMobileClientXCF-Mixed-Swift.h"
#else
    #import "AWSMobileClient-Mixed-Swift.h"
#endif
#import "AWSCognitoAuth.h"

@interface AWSCognitoCredentialsProvider()

@property (nonatomic, strong) NSString *customRoleArnOverride;

@end

@interface AWSInfo()

+ (void)overrideCredentialsProvider:(AWSCognitoCredentialsProvider *)creds;

@end

@implementation AWSSignInProviderConfig

@end

@interface _AWSMobileClient ()

@property (nonatomic, strong) AWSCognitoCredentialsProvider *credentialsProvider;

@property (nonatomic) BOOL isInitialized;

@property NSArray<AWSSignInProviderConfig *> *signInProviderConfig;

@end

@implementation _AWSMobileClient

static NSString *const AWSInfoCognitoUserPoolIdentifier = @"CognitoUserPool";
static NSString *const AWSInfoFacebookIdentifier = @"FacebookSignIn";
static NSString *const AWSInfoFacebookPermissionsIdentifier = @"Permissions";
static NSString *const AWSInfoGoogleIdentifier = @"GoogleSignIn";
static NSString *const AWSInfoAppleIdentifier = @"AppleSignIn";
static NSString *const AWSInfoGooglePermissionsIdentifier = @"Permissions";

Class AWSAppleSignInProviderClass;
Class AWSFacebookSignInProviderClass;
Class AWSGoogleSignInProviderClass;
Class AWSCognitoUserPoolsSignInProviderClass;

#pragma mark Singleton Methods

+ (instancetype)sharedInstance {
    AWSDDLogDebug(@"AWSMobileClient -> sharedInstance...");
    static _AWSMobileClient *_sharedMobileClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedMobileClient = [[_AWSMobileClient alloc] init];
    });
    
    return _sharedMobileClient;
}

#pragma initializers

- (instancetype)init {
    self = [super init];
    if (self) {
        _isInitialized = NO;
        _signInProviderConfig = nil;
        AWSAppleSignInProviderClass = NSClassFromString(@"AWSAppleSignInProvider");
        AWSFacebookSignInProviderClass = NSClassFromString(@"AWSFacebookSignInProvider");
        AWSGoogleSignInProviderClass = NSClassFromString(@"AWSGoogleSignInProvider");
        AWSCognitoUserPoolsSignInProviderClass = NSClassFromString(@"AWSCognitoUserPoolsSignInProvider");
    }
    return self;
}

- (instancetype)initWithConfiguration:(NSDictionary<NSString *,id> *)config {
    AWSDDLogDebug(@"AWSMobileClient initialized with custom configuration object...");
    [AWSInfo configureDefaultAWSInfo:config];
    return [self init];
}

#pragma mark AppDelegate Methods

- (BOOL)interceptApplication:(UIApplication *)application
                     openURL:(NSURL *)url
           sourceApplication:(nullable NSString *)sourceApplication
                  annotation:(id)annotation {
    
    AWSDDLogDebug(@"withApplication:withURL:...");
    
    return [[AWSSignInManager sharedInstance] interceptApplication:application
                                                           openURL:url
                                                 sourceApplication:sourceApplication
                                                        annotation:annotation];
}

- (BOOL)interceptApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
resumeSessionWithCompletionHandler:(void (^)(id result, NSError *error))completionHandler {
    
    AWSDDLogInfo(@"didFinishLaunching:withOptions:resumeSessionWithCompletionHandler:");
    
    if (self.signInProviderConfig == nil) {
        [self registerConfigSignInProviders];
    } else {
        [self registerUserSignInProviders:self.signInProviderConfig];
    }
    
    BOOL didFinishLaunching = [[AWSSignInManager sharedInstance]
                               interceptApplication:application
                               didFinishLaunchingWithOptions:launchOptions];;
    
    if (!_isInitialized) {
        AWSDDLogInfo(@"Resuming any previously signed-in session");
        [[AWSSignInManager sharedInstance] resumeSessionWithCompletionHandler:completionHandler];
        _isInitialized = YES;
    }
    
    return didFinishLaunching;
}

-(void)showSignInScreen:(UINavigationController *)navController
signInUIConfiguration:(SignInUIOptions *)signInUIConfiguration
      completionHandler:(void (^)(NSString * _Nullable signInProviderKey, NSString * _Nullable signInProviderToken, NSError * _Nullable error))completionHandler {
    
    Class AuthUIClass = NSClassFromString(@"AWSAuthUIViewController");
    if (AuthUIClass == nil) {
        completionHandler(nil, nil, [[NSError alloc] initWithDomain:@"AWSMobileClientError" code:-1 userInfo:@{@"message": @"AWSAuthUI import is not available. Please import before using this API."}]);
        return;
    }
    
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([AuthUIClass respondsToSelector:@selector(presentViewControllerWithConfig:completionHandler:)]) {
        NSMutableDictionary<NSString *, id> *parameters = [NSMutableDictionary new];
        parameters[@"logoImage"] = signInUIConfiguration.logoImage;
        parameters[@"backgroundColor"] = signInUIConfiguration.backgroundColor;
        parameters[@"secondaryBackgroundColor"] = signInUIConfiguration.secondaryBackgroundColor;
        parameters[@"primaryColor"] = signInUIConfiguration.primaryColor;
        parameters[@"navigationController"] = navController;
        parameters[@"canCancel"] = signInUIConfiguration.canCancel ? @"YES" : @"NO";
        parameters[@"disableSignUpButton"] = signInUIConfiguration.disableSignUpButton ? @"YES" : @"NO";
        
        [NSClassFromString(@"AWSAuthUIViewController") performSelector:@selector(presentViewControllerWithConfig:completionHandler:)
                                                            withObject:(id)parameters
                                                            withObject:(id)completionHandler];
    }
    #pragma clang diagnostic pop
}

- (void)updateCognitoCredentialsProvider:(AWSCognitoCredentialsProvider *)cognitoCreds {
    [AWSInfo overrideCredentialsProvider:cognitoCreds];
}

- (void)setCustomRoleArnInternal:(NSString * _Nullable)customRoleArnInternal
                             for:(AWSCognitoCredentialsProvider *)credsProvider {
    credsProvider.customRoleArnOverride = customRoleArnInternal;
}

#pragma mark Configuration Methods

- (void)registerConfigSignInProviders {
    // Register the SignIn Providers automatically based on the awsconfiguration.json
    [self registerSignInProvider:AWSCognitoUserPoolsSignInProviderClass
        providerConfigurationKey:AWSInfoCognitoUserPoolIdentifier];

    [self registerSignInProvider:AWSFacebookSignInProviderClass
        providerConfigurationKey:AWSInfoFacebookIdentifier];
    
    [self registerSignInProvider:AWSGoogleSignInProviderClass
        providerConfigurationKey:AWSInfoGoogleIdentifier];
    
    [self registerSignInProvider:AWSAppleSignInProviderClass
        providerConfigurationKey:AWSInfoAppleIdentifier];
}

- (id)registerSignInProvider:(Class)providerClass
    providerConfigurationKey:(NSString *)providerConfigurationKey {
    
    id providerObject = nil;

    if ([self isConfigurationKeyPresent:providerConfigurationKey]) {
        if (providerClass == nil) {
            return nil;
        }

        AWSDDLogInfo(@"Registering SignInProvider %@ from awsconfiguration.json.", providerClass);
        
        Class provider = [providerClass class];
        if (provider != nil && [provider respondsToSelector:NSSelectorFromString(@"sharedInstance")]) {
            providerObject = [provider sharedInstance];
            [[AWSSignInManager sharedInstance] registerAWSSignInProvider:providerObject];
        } else {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:[NSString stringWithFormat:@"Cannot find `%@`. Please import the required dependencies", NSStringFromClass(provider)]
                                         userInfo:nil];
        }
    }
    return providerObject;
}

- (void)registerUserSignInProviders:(NSArray<AWSSignInProviderConfig *> *)signInProviderConfig {
    
    for (AWSSignInProviderConfig *providerConfig in signInProviderConfig) {
        
        id provider;
        
        if (providerConfig.signInProviderClass == AWSCognitoUserPoolsSignInProviderClass) {
            provider = [self registerSignInProvider:AWSCognitoUserPoolsSignInProviderClass
                           providerConfigurationKey:AWSInfoCognitoUserPoolIdentifier];
        } else if (providerConfig.signInProviderClass == AWSFacebookSignInProviderClass) {
            provider = [self registerSignInProvider:AWSFacebookSignInProviderClass
                           providerConfigurationKey:AWSInfoFacebookIdentifier];
            [self registerUserSignInProviderPermissions:provider
                                         selectorString:@"setPermissions:"
                                         providerConfig:providerConfig
                                     providerIdentifier:AWSInfoFacebookIdentifier];
        } else if (providerConfig.signInProviderClass == AWSGoogleSignInProviderClass) {
            provider = [self registerSignInProvider:AWSGoogleSignInProviderClass
                           providerConfigurationKey:AWSInfoGoogleIdentifier];
            [self registerUserSignInProviderPermissions:provider
                                         selectorString:@"setScopes:"
                                         providerConfig:providerConfig
                                     providerIdentifier:AWSInfoGoogleIdentifier];
        } else {
            AWSDDLogError(@"SignInProvider `%@` cannot be recognized.", providerConfig.signInProviderClass);
        }
    }
}

- (BOOL)isConfigurationKeyPresent:(NSString *)configurationKey {
    
    AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo].rootInfoDictionary objectForKey:configurationKey];
    
    NSString *googleclientId;
    if (configurationKey == AWSInfoGoogleIdentifier) {
        NSDictionary *dict = [[AWSInfo defaultAWSInfo] rootInfoDictionary];
        NSDictionary *providerDict = dict[configurationKey];
        googleclientId = providerDict[@"ClientId-iOS"];
        if (!googleclientId) {
            return false;
        }
    }
    
    if (serviceInfo) {
        AWSDDLogDebug(@"Configuring SignInProvider : %@.", configurationKey);
        return true;
    } else {
        return false;
    }
}

- (void)registerUserSignInProviderPermissions:(id)provider
                               selectorString:(NSString *)selectorString
                               providerConfig:(AWSSignInProviderConfig *)config
                           providerIdentifier:(NSString *)providerId {
    if ([self isConfigurationKeyPresent:providerId]) {
        if ([provider respondsToSelector:NSSelectorFromString(selectorString)]) {
            SEL selector = NSSelectorFromString(selectorString);
            IMP imp = [provider methodForSelector:selector];
            id (*func)(id, SEL, id) = (void *)imp;
            func(provider, selector, config.permissions);
        } else {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:[NSString stringWithFormat:(@"Cannot find permissions for %@. Please check `awsconfiguration.json"), providerId]
                                         userInfo:nil];
        }
    } else {
        AWSDDLogDebug(@"Configuration for %@ is not present in awsconfiguration.json", providerId);
    }
}

#pragma mark CredentialsProvider methods

- (BOOL)isLoggedIn {
    return [[AWSSignInManager sharedInstance] isLoggedIn];
}

- (AWSCognitoCredentialsProvider *)getCredentialsProvider {
    return [[AWSIdentityManager defaultIdentityManager] credentialsProvider];
}

- (void)setSignInProviders:(nullable NSArray<AWSSignInProviderConfig *> *)signInProviderConfig {
    self.signInProviderConfig = signInProviderConfig;
}

- (BOOL)interceptApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    
    return [self interceptApplication:application
        didFinishLaunchingWithOptions:launchOptions
   resumeSessionWithCompletionHandler:^(id result, NSError *error) {
       AWSDDLogInfo(@"Welcome to AWS! You are connected successfully.");
       AWSDDLogInfo(@"result = %@,error = %@", result, error);
   }];
}

@end


