//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSIoTManager.h"
#import "AWSIoTKeychain.h"
#import "AWSIoTCSR.h"
#import <AWSCore/AWSSynchronizedMutableDictionary.h>

@interface AWSIoT()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@interface AWSIoTManager()

@property (nonatomic, strong) AWSIoT *IoT;

@end

@implementation AWSIoTCreateCertificateResponse

@end

@implementation AWSIoTManager

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultIoTManager {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    static AWSIoTManager *_defaultIoTManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultIoTManager = [[AWSIoTManager alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
    });

    return _defaultIoTManager;
}

+ (void)registerIoTManagerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSIoTManager alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)IoTManagerForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeIoTManagerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultIoTManager` or `+ IoTManagerForKey:` instead."
                                 userInfo:nil];
    return nil;
}
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
        _IoT = [[AWSIoT alloc] initWithConfiguration:_configuration];
    }
    
    return self;
}

- (void)createKeysAndCertificateFromCsr:(NSDictionary *)csrDictionary callback:(void (^)(AWSIoTCreateCertificateResponse *mainResponse))callback {

    NSString *commonName = [csrDictionary objectForKey:@"commonName"];
    NSString *countryName = [csrDictionary objectForKey:@"countryName"];
    NSString *organizationName = [csrDictionary objectForKey:@"organizationName"];
    NSString *organizationalUnitName = [csrDictionary objectForKey:@"organizationalUnitName"];
    
    if ((commonName == nil) || (countryName == nil) || (organizationName == nil) || (organizationalUnitName == nil))
    {
        NSLog(@"all CSR dictionary fields must be specified");
        callback(nil);
    }
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *publicTag = [AWSIoTKeychain.publicKeyTag stringByAppendingString:uuid];
    NSString *privateTag = [AWSIoTKeychain.privateKeyTag stringByAppendingString:uuid];
    [AWSIoTKeychain generateKeyPairWithPublicTag:publicTag privateTag:privateTag];

    AWSIoTCSR *csr = [[AWSIoTCSR alloc] initWithCommonName: commonName countryName:countryName organizationName: organizationName organizationalUnitName: organizationalUnitName ];
    
    NSData* csrData = [csr generateCSRForCertificate:uuid];

    // Create certificate from CSR
    AWSIoTCreateCertificateFromCsrRequest *request = [[AWSIoTCreateCertificateFromCsrRequest alloc] init];
    request.setAsActive = @YES;

    request.certificateSigningRequest = [AWSIoTKeychain base64Encode:csrData];

    [[self.IoT createCertificateFromCsr:request] continueWithBlock:^id(AWSTask *task) {
        NSError *error = task.error;
        NSLog(@"error: %@", error);
        if (error != nil) {
            callback(nil);
            return nil;
        }
        NSException *exception = task.exception;
        NSLog(@"exception: %@", exception);
        if (exception != nil) {
            callback(nil);
            return nil;
        }

        NSLog(@"result: %@", task.result);

        if ([task.result isKindOfClass:[AWSIoTCreateCertificateFromCsrResponse class]]) {

            AWSIoTCreateCertificateFromCsrResponse *response = task.result;

            NSString* certificateArn = response.certificateArn;
            NSLog(@"certificateArn: %@", certificateArn);

            NSString* certificateId = response.certificateId;
            NSLog(@"certificateId: %@", certificateId);

            NSString* certificatePem = response.certificatePem;
            NSLog(@"certificatePem: %@", certificatePem);

            if (certificatePem != nil && certificateArn != nil && certificateId != nil) {
                NSString *newPublicTag = [AWSIoTKeychain.publicKeyTag stringByAppendingString:certificateId];
                NSString *newPrivateTag = [AWSIoTKeychain.privateKeyTag stringByAppendingString:certificateId];

                SecKeyRef publicKeyRef = [AWSIoTKeychain getPublicKeyRef:publicTag];
                SecKeyRef privateKeyRef = [AWSIoTKeychain getPrivateKeyRef:privateTag];

                if ([AWSIoTKeychain deleteAsymmetricKeysWithPublicTag:publicTag privateTag:privateTag]) {
                    if ([AWSIoTKeychain addPrivateKeyRef:privateKeyRef tag:newPrivateTag]) {
                        if ([AWSIoTKeychain addPublicKeyRef:publicKeyRef tag:newPublicTag]) {
                            if ([AWSIoTKeychain addCertificateToKeychain:certificatePem]) {
                                SecIdentityRef secIdentityRef = [AWSIoTKeychain getIdentityRef:newPrivateTag];
                                if (secIdentityRef != nil) {
                                    AWSIoTCreateCertificateResponse* resp = [[AWSIoTCreateCertificateResponse alloc] init];
                                    resp.certificateId = certificateId;
                                    resp.certificatePem = certificatePem;
                                    resp.certificateArn = certificateArn;

                                    callback(resp);
                                } else {
                                    callback(nil);
                                }
                            } else {
                                callback(nil);
                            }
                        } else {
                            callback(nil);
                        }
                    } else {
                        callback(nil);
                    }
                } else {
                    callback(nil);
                }
            } else {
                callback(nil);
            }
        } else {
            callback(nil);
        }

        return nil;
    }];
}

+ (BOOL)deleteCertificate {
    return [AWSIoTKeychain removeCertificate];
}

+ (BOOL)isValidCertificate:(NSString *)certificateId {
    return [AWSIoTKeychain isValidCertificate:[NSString stringWithFormat:@"%@%@",[AWSIoTKeychain privateKeyTag], certificateId ]];
}

@end
