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
@property (nonatomic, strong) AWSUICKeyChainStore *keychain;

- (NSString *) calculateSecretHash: (NSString*) userName;
- (void) setCurrentUser:(NSString *) username;
- (NSDictionary<NSString *, NSString*>*)getValidationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*)devProvidedValidationData;
- (NSString*) currentUsername;
- (NSString*) strippedPoolId;
@end

@interface AWSCognitoIdentityUserPoolSignUpResponse()
@property (nonatomic, strong) AWSCognitoIdentityUser* user;
@end


@interface AWSCognitoIdentityPasswordAuthenticationInput()
@property(nonatomic,strong) NSString * lastKnownUsername;
- (instancetype) initWithLastKnownUsername:(NSString *)lastKnownUsername;
@end

@interface AWSCognitoIdentityMultifactorAuthenticationInput()
@property(nonatomic, strong) NSString *destination;
@property(nonatomic, assign) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;
-(instancetype) initWithDeliveryMedium: (NSString *) deliveryMedium destination:(NSString *) destination;
@end

