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

#import "AWSCredentialsProvider.h"
#import "STS.h"
#import "UICKeyChainStore.h"

@interface AWSStaticCredentialsProvider()

@property (nonatomic, strong) NSString *accessKey;
@property (nonatomic, strong) NSString *secretKey;

@end

@implementation AWSStaticCredentialsProvider

+ (instancetype)credentialsWithAccessKey:(NSString *)accessKey secretKey:(NSString *)secretKey {
    AWSStaticCredentialsProvider *credentials = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:accessKey
                                                                                              secretKey:secretKey];
    return credentials;
}

+ (instancetype)credentialsWithCredentialsFilename:(NSString *)credentialsFilename {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:credentialsFilename ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSStaticCredentialsProvider *credentials = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:[credentialsJson objectForKey:@"accessKey"]
                                                                                              secretKey:[credentialsJson objectForKey:@"secretKey"]];
    return credentials;
}

- (instancetype)initWithAccessKey:(NSString *)accessKey
                        secretKey:(NSString *)secretKey {
    if (self = [super init]) {
        _accessKey = accessKey;
        _secretKey = secretKey;
    }
    return self;
}

@end

@interface AWSAnonymousCreentialsProvider()

@end

@implementation AWSAnonymousCreentialsProvider

@end

@interface AWSWebIdentityCredentialsProvider()

@property (nonatomic, strong) NSString *accessKey;
@property (nonatomic, strong) NSString *secretKey;
@property (nonatomic, strong) NSString *sessionKey;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) AWSSTS *sts;

@end

@implementation AWSWebIdentityCredentialsProvider

+ (instancetype)credentialsWithProvider:(NSString *)provider
                       webIdentityToken:(NSString *)webIdentityToken
                                roleArn:(NSString *)roleArn {
    AWSWebIdentityCredentialsProvider *credentials = [[AWSWebIdentityCredentialsProvider alloc] initWithProvider:provider
                                                                                                webIdentityToken:webIdentityToken
                                                                                                         roleArn:roleArn];
    return credentials;
}

- (instancetype)initWithProvider:(NSString *)provider
                webIdentityToken:(NSString *)webIdentityToken
                         roleArn:(NSString *)roleArn {
    if (self = [super init]) {
        _provider = provider;
        _webIdentityToken = webIdentityToken;
        _roleArn = roleArn;

        AWSAnonymousCreentialsProvider *credentialsProvider = [AWSAnonymousCreentialsProvider new];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];

        _sts = [[AWSSTS new] initWithConfiguration:configuration];
    }

    return self;
}

- (BFTask *)refresh {
    // reset the values for the credenails
    self.accessKey = nil;
    self.secretKey = nil;
    self.sessionKey = nil;

    // request new credentials
    AWSSTSAssumeRoleWithWebIdentityRequest *wifRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
    wifRequest.roleArn = self.roleArn;
    wifRequest.webIdentityToken = self.webIdentityToken;
    wifRequest.roleSessionName = @"iOS-Provider";
    return [[self.sts assumeRoleWithWebIdentity:wifRequest] continueWithBlock:^id(BFTask *task) {
        self.error = task.error;
        if (task.error) {
            return nil;
        }

        AWSSTSAssumeRoleWithWebIdentityResponse *wifResponse = task.result;
        self.accessKey = wifResponse.credentials.accessKeyId;
        self.secretKey = wifResponse.credentials.secretAccessKey;
        self.sessionKey = wifResponse.credentials.sessionToken;

        return nil;
    }];
}

@end
