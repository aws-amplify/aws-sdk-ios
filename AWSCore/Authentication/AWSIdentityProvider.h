/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const AWSCognitoIdentityIdChangedNotification;
FOUNDATION_EXPORT NSString *const AWSCognitoNotificationPreviousId;
FOUNDATION_EXPORT NSString *const AWSCognitoNotificationNewId;

typedef NS_ENUM(NSInteger, AWSCognitoLoginProviderKey) {
    AWSCognitoLoginProviderKeyUnknown,
    AWSCognitoLoginProviderKeyFacebook,
    AWSCognitoLoginProviderKeyGoogle,
    AWSCognitoLoginProviderKeyLoginWithAmazon,
};

FOUNDATION_EXPORT NSString *const AWSCognitoIdentityProviderErrorDomain;
typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderErrorType) {
    AWSCognitoIdentityProviderErrorIdentityIsNil,
};

@class BFTask;

@protocol AWSIdentityProvider <NSObject>

@property (nonatomic, strong, readonly) NSString *token;

- (BFTask *)refresh;

@end

@protocol AWSCognitoIdentityProvider <AWSIdentityProvider>

@property (nonatomic, strong, readonly) NSString *identityPoolId;
@property (nonatomic, strong, readonly) NSString *identityId;
@property (nonatomic, strong) NSDictionary *logins;

- (BFTask *)getIdentityId;
- (BOOL)isAuthenticated;
- (void)clear;

@optional
@property (nonatomic, strong, readonly) NSString *accountId;

@end

@interface AWSAbstractIdentityProvider : NSObject <AWSCognitoIdentityProvider>

@end

@interface AWSBasicCognitoIdentityProvider : AWSAbstractIdentityProvider

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        identityId:(NSString *)identityId
                         accountId:(NSString *)accountId
                    identityPoolId:(NSString *)identityPoolId
                            logins:(NSDictionary *)logins;

@end



