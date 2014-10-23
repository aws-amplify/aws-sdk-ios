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
#import "AWSServiceEnum.h"
#import "AWSIdentityProvider.h"

FOUNDATION_EXPORT NSString *const AWSCognitoCredentialsProviderErrorDomain;
typedef NS_ENUM(NSInteger, AWSCognitoCredentialsProviderErrorType) {
    AWSCognitoCredentialsProviderErrorUnknown,
    AWSCognitoCredentialsProviderIdentityIdIsNil,
};

@class BFTask;

@protocol AWSCredentialsProvider <NSObject>

@optional
@property (nonatomic, strong, readonly) NSString *accessKey;
@property (nonatomic, strong, readonly) NSString *secretKey;
@property (nonatomic, strong, readonly) NSString *sessionKey;
@property (nonatomic, strong, readonly) NSDate *expiration;

- (BFTask *)refresh;

@end

@interface AWSStaticCredentialsProvider : NSObject <AWSCredentialsProvider>

@property (nonatomic, readonly) NSString *accessKey;
@property (nonatomic, readonly) NSString *secretKey;

+ (instancetype)credentialsWithAccessKey:(NSString *)accessKey
                               secretKey:(NSString *)secretKey;
+ (instancetype)credentialsWithCredentialsFilename:(NSString *)credentialsFilename;

- (instancetype)initWithAccessKey:(NSString *)accessKey
                        secretKey:(NSString *)secretKey;

@end

@interface AWSAnonymousCredentialsProvider : NSObject <AWSCredentialsProvider>

@end

@interface AWSWebIdentityCredentialsProvider : NSObject <AWSCredentialsProvider>

@property (nonatomic, strong, readonly) NSString *accessKey;
@property (nonatomic, strong, readonly) NSString *secretKey;
@property (nonatomic, strong, readonly) NSString *sessionKey;
@property (nonatomic, strong, readonly) NSDate *expiration;

@property (nonatomic, strong) NSString *webIdentityToken;
@property (nonatomic, strong) NSString *roleArn;
@property (nonatomic, strong) NSString *roleSessionName;

@property (nonatomic, strong) NSString *providerId;

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                               providerId:(NSString *)providerId
                                  roleArn:(NSString *)roleArn
                          roleSessionName:(NSString *)roleSessionName
                         webIdentityToken:(NSString *)webIdentityToken;

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        providerId:(NSString *)providerId
                           roleArn:(NSString *)roleArn
                   roleSessionName:(NSString *)roleSessionName
                  webIdentityToken:(NSString *)webIdentityToken;

- (BFTask *)refresh;

@end


@interface AWSCognitoCredentialsProvider : NSObject <AWSCredentialsProvider>

@property (nonatomic, strong, readonly) NSString *accessKey;
@property (nonatomic, strong, readonly) NSString *secretKey;
@property (nonatomic, strong, readonly) NSString *sessionKey;
@property (nonatomic, strong, readonly) NSDate *expiration;
@property (nonatomic, strong, readonly) id<AWSCognitoIdentityProvider> identityProvider;

@property (nonatomic, strong, readonly) NSString *identityId;
@property (nonatomic, strong, readonly) NSString *identityPoolId;

@property (nonatomic, strong) NSDictionary *logins;

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                                accountId:(NSString *)accountId
                           identityPoolId:(NSString *)identityPoolId
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn;

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                                accountId:(NSString *)accountId
                           identityPoolId:(NSString *)identityPoolId
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn
                                   logins:(NSDictionary *)logins;

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                               identityId:(NSString *)identityId
                                accountId:(NSString *)accountId
                           identityPoolId:(NSString *)identityPoolId
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn
                                   logins:(NSDictionary *)logins;

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                         identityProvider:(id<AWSCognitoIdentityProvider>)identityProvider
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn;

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        identityId:(NSString *)identityId
                         accountId:(NSString *)accountId
                    identityPoolId:(NSString *)identityPoolId
                     unauthRoleArn:(NSString *)unauthRoleArn
                       authRoleArn:(NSString *)authRoleArn
                            logins:(NSDictionary *)logins;

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                 identityProvider:(id<AWSCognitoIdentityProvider>) identityProvider
                     unauthRoleArn:(NSString *)unauthRoleArn
                       authRoleArn:(NSString *)authRoleArn;

/**
 *  Refreshes the locally stored credentials. The SDK automatically calls this method when necessary, and you do not need to call this method manually.
 *
 *  @return BFTask
 */
- (BFTask *)refresh;

- (BFTask *)getIdentityId;

- (void)clearKeychain;

- (void)clearCredentials;

@end