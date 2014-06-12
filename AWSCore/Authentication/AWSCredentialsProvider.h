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

@class BFTask;

@protocol AWSCredentialsProvider <NSObject>

@optional
@property (nonatomic, readonly) NSString *accessKey;
@property (nonatomic, readonly) NSString *secretKey;
@property (nonatomic, readonly) NSString *sessionKey;

- (BFTask *)refresh;

@end

@interface AWSStaticCredentialsProvider : NSObject <AWSCredentialsProvider>

+ (instancetype)credentialsWithAccessKey:(NSString *)accessKey
                               secretKey:(NSString *)secretKey;
+ (instancetype)credentialsWithCredentialsFilename:(NSString *)credentialsFilename;

- (instancetype)initWithAccessKey:(NSString *)accessKey
                        secretKey:(NSString *)secretKey;

@end

@interface AWSAnonymousCreentialsProvider : NSObject <AWSCredentialsProvider>

@end

@interface AWSWebIdentityCredentialsProvider : NSObject <AWSCredentialsProvider>

@property (nonatomic, strong) NSString *webIdentityToken;
@property (nonatomic, strong) NSString *roleArn;
@property (nonatomic, strong) NSString *provider;

@property (nonatomic, strong, readonly) NSError *error;

+ (instancetype)credentialsWithProvider:(NSString *)provider
                       webIdentityToken:(NSString *)webIdentityToken
                                roleArn:(NSString *)roleArn;

- (instancetype)initWithProvider:(NSString *)provider
                webIdentityToken:(NSString *)webIdentityToken
                         roleArn:(NSString *)roleArn;

- (BFTask *)refresh;

@end
