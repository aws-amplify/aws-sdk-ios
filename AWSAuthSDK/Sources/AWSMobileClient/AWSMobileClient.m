//
// Copyright 2017-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSMobileClient.h"

@implementation AWSSignInProviderConfig

@end

@interface AWSMobileClient ()

@property (nonatomic, strong) AWSCognitoCredentialsProvider *credentialsProvider;

@property (nonatomic) BOOL isInitialized;

@property NSArray<AWSSignInProviderConfig *> *signInProviderConfig;

@end

@implementation AWSMobileClient

static NSString *const AWSInfoCognitoUserPoolIdentifier = @"CognitoUserPool";
static NSString *const AWSInfoFacebookIdentifier = @"FacebookSignIn";
static NSString *const AWSInfoFacebookPermissionsIdentifier = @"Permissions";
static NSString *const AWSInfoGoogleIdentifier = @"GoogleSignIn";
static NSString *const AWSInfoGooglePermissionsIdentifier = @"Permissions";

Class AWSFacebookSignInProviderClass;
Class AWSGoogleSignInProviderClass;
Class AWSCognitoUserPoolsSignInProviderClass;

#pragma mark Singleton Methods

+ (instancetype)sharedInstance {
    AWSDDLogDebug(@"AWSMobileClient -> sharedInstance...");
    static AWSMobileClient *_sharedMobileClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedMobileClient = [[AWSMobileClient alloc] init];
        _sharedMobileClient.isInitialized = NO;
        _sharedMobileClient.signInProviderConfig = nil;
        AWSFacebookSignInProviderClass = NSClassFromString(@"AWSFacebookSignInProvider");
        AWSGoogleSignInProviderClass = NSClassFromString(@"AWSGoogleSignInProvider");
        AWSCognitoUserPoolsSignInProviderClass = NSClassFromString(@"AWSCognitoUserPoolsSignInProvider");
    });
    
    return _sharedMobileClient;
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
didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    
    return [self interceptApplication:application
        didFinishLaunchingWithOptions:launchOptions
   resumeSessionWithCompletionHandler:^(id result, NSError *error) {
       AWSDDLogInfo(@"Welcome to AWS! You are connected successfully.");
       AWSDDLogInfo(@"result = %@,error = %@", result, error);
   }];
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

- (void)setSignInProviders:(nullable NSArray<AWSSignInProviderConfig *> *)signInProviderConfig {
    self.signInProviderConfig = signInProviderConfig;
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
}

- (id)registerSignInProvider:(Class)providerClass
    providerConfigurationKey:(NSString *)providerConfigurationKey {
    
    id providerObject = nil;

    if ([self isConfigurationKeyPresent:providerConfigurationKey]) {
        if (providerClass == nil) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:[NSString stringWithFormat:@"You have enabled `%@` in awsconfiguration.json "
                                                   "but the dependencies are not imported in your application.", providerConfigurationKey]
                                         userInfo:nil];
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

- (AWSCognitoCredentialsProvider *)getCredentialsProvider {
    if (self.credentialsProvider != nil) {
        return self.credentialsProvider;
    } else {
        return [[AWSIdentityManager defaultIdentityManager] credentialsProvider];
    }
}

- (void)setCredentialsProvider:(AWSCognitoCredentialsProvider *)credentialsProvider {
    self.credentialsProvider = credentialsProvider;
}

@end


