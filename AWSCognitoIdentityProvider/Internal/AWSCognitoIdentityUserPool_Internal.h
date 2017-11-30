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

