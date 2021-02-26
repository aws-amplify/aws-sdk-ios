//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#ifdef USE_XCF
    #import "AWSMobileClientXCF-Mixed-Swift.h"
#else
    #import "AWSMobileClient-Mixed-Swift.h"
#endif
#import <AWSCore/AWSCore.h>

@interface AWSCognitoAuthConfiguration()

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
                       signInPrivateSession:(BOOL)isSignInPrivateSession;

@end

@implementation AWSCognitoAuthConfiguration(Extension)

- (instancetype)initWithAppClientId:(NSString *) appClientId
                    appClientSecret:(nullable NSString *)appClientSecret
                             scopes:(NSSet<NSString *> *) scopes
                  signInRedirectUri:(NSString *) signInRedirectUri
                 signOutRedirectUri:(NSString *) signOutRedirectUri
                          webDomain:(NSString *) webDomain
                   identityProvider:(nullable NSString *)identityProvider
                      idpIdentifier:(nullable NSString *)idpIdentifier
                          signInUri:(nullable NSString *) signInUri
                         signOutUri:(nullable NSString *) signOutUri
                          tokensUri:(nullable NSString *) tokensUri
           signInUriQueryParameters:(nullable NSDictionary<NSString *, NSString *> *) signInUriQueryParameters
          signOutUriQueryParameters:(nullable NSDictionary<NSString *, NSString *> *) signOutUriQueryParameters
            tokenUriQueryParameters:(nullable NSDictionary<NSString *, NSString *> *) tokenUriQueryParameters
       userPoolServiceConfiguration:(nullable AWSServiceConfiguration *)serviceConfiguration
               signInPrivateSession:(BOOL)signInPrivateSession {
    BOOL isProviderExternal = YES;
    if (signInUri == nil && signOutUri == nil && tokensUri == nil) {
        isProviderExternal = NO;
    }
    
    return [self initWithAppClientIdInternal:appClientId
                             appClientSecret:appClientSecret
                                      scopes:scopes
                           signInRedirectUri:signInRedirectUri
                          signOutRedirectUri:signOutRedirectUri
                                   webDomain:webDomain
                            identityProvider:identityProvider
                               idpIdentifier:idpIdentifier
                    userPoolIdForEnablingASF:nil
              enableSFAuthSessionIfAvailable:YES
                                   signInUri:signInUri
                                  signOutUri:signOutUri
                                   tokensUri:tokensUri
                    signInUriQueryParameters:signInUriQueryParameters
                   signOutUriQueryParameters:signOutUriQueryParameters
                     tokenUriQueryParameters:tokenUriQueryParameters
                          isProviderExternal:isProviderExternal
                cognitoUserPoolServiceConfig:serviceConfiguration
                        signInPrivateSession:signInPrivateSession];
}

@end
