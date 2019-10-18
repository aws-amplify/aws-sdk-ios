//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import <Foundation/Foundation.h>
#import "AWSCognitoIdentityUserPool.h"

@class AWSUICKeyChainStore;

@interface AWSCognitoIdentityUserPool()
@property (nonatomic, strong) AWSUICKeyChainStore * _Nonnull keychain;
@property (nonatomic, readonly) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

- (NSString * _Nullable) calculateSecretHash: (NSString* _Nonnull) userName;
- (void) setCurrentUser:(NSString * _Nullable) username;
- (NSDictionary<NSString *, NSString*>* _Nonnull)getValidationData:(NSArray<AWSCognitoIdentityUserAttributeType*>* _Nullable)devProvidedValidationData;
- (AWSCognitoIdentityProviderUserContextDataType * _Nonnull) userContextData: (NSString * _Nonnull)  username deviceId:(NSString * _Nullable) deviceId;
- (NSString* _Nullable) currentUsername;
- (NSString* _Nonnull) strippedPoolId;
@end

@interface AWSCognitoIdentityUserPoolSignUpResponse()
@property (nonatomic, strong) AWSCognitoIdentityUser* _Nonnull user;
@end


@interface AWSCognitoIdentityPasswordAuthenticationInput()
@property(nonatomic,strong) NSString * _Nullable lastKnownUsername;
- (instancetype _Nonnull ) initWithLastKnownUsername:(NSString *_Nullable)lastKnownUsername;
@end

@interface AWSCognitoIdentityMultifactorAuthenticationInput()
@property(nonatomic, strong) NSString * _Nullable destination;
@property(nonatomic, assign) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;
-(instancetype _Nonnull ) initWithDeliveryMedium: (NSString *_Nonnull) deliveryMedium destination:(NSString *_Nullable) destination;
@end

