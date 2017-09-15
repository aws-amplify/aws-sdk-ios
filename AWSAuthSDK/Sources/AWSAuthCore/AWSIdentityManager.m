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

#import "AWSIdentityManager.h"
#import "AWSSignInProvider.h"
#import "AWSSignInManager.h"

@interface AWSIdentityManager()

@property (nonatomic, readwrite, strong) AWSCognitoCredentialsProvider *credentialsProvider;

@end

@interface AWSSignInManager()

@property (nonatomic, strong) id<AWSSignInProvider> currentSignInProvider;
@property (nonatomic, strong) id<AWSSignInProvider> potentialSignInProvider;

@end

@implementation AWSIdentityManager

static NSString *const AWSInfoIdentityManager = @"IdentityManager";
static NSString *const AWSInfoRoot = @"AWS";

+ (instancetype)defaultIdentityManager {
    static AWSIdentityManager *_defaultIdentityManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoIdentityManager];
        if (!serviceInfo) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `awsconfiguration.json` or `Info.plist` before using this method."
                                         userInfo:nil];
        }
        _defaultIdentityManager = [[AWSIdentityManager alloc] initWithCredentialProvider:serviceInfo];
    });
    
    return _defaultIdentityManager;
}

- (instancetype)initWithCredentialProvider:(AWSServiceInfo *)serviceInfo {
    if (self = [super init]) {
        
        self.credentialsProvider = serviceInfo.cognitoCredentialsProvider;
        [self.credentialsProvider setIdentityProviderManagerOnce:self];
    }
    return self;
}

-(AWSIdentityManagerAuthState)authState {
    if (self.identityId && AWSSignInManager.sharedInstance.currentSignInProvider) {
        return AWSIdentityManagerAuthStateAuthenticated;
    } else if (self.identityId) {
        return AWSIdentityManagerAuthStateUnauthenticated;
    }
    return AWSIdentityManagerAuthStateUnknown;
}

#pragma mark - AWSIdentityProviderManager

- (AWSTask<NSDictionary<NSString *, NSString *> *> *)logins {
    if (![AWSSignInManager sharedInstance].currentSignInProvider) {
        return [AWSTask taskWithResult:nil];
    }
    return [[[AWSSignInManager sharedInstance].currentSignInProvider token] continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
        NSString *token = task.result;
        return [AWSTask taskWithResult:@{[AWSSignInManager sharedInstance].currentSignInProvider.identityProviderName : token}];
    }];
}

#pragma mark -

- (NSString *)identityId {
    return self.credentialsProvider.identityId;
}

@end
