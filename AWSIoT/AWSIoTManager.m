/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

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

+ (bool)importPKCS12:(NSData *)pk12Data withPassPharse:(NSString *)passPhrase forCertificateId:(NSString *)certificateId {
    SecKeyRef privateKey = NULL;
    SecKeyRef publicKey = NULL;
    SecCertificateRef certRef = NULL;


    [AWSIoTManager readPk12:pk12Data withPassPhrase:passPhrase certRef:&certRef privateKeyRef:&privateKey publicKeyRef:&publicKey];

    NSString *publicTag = [AWSIoTKeychain.publicKeyTag stringByAppendingString:certificateId];
    NSString *privateTag = [AWSIoTKeychain.privateKeyTag stringByAppendingString:certificateId];

    if (![AWSIoTKeychain addPrivateKeyRef:privateKey tag:privateTag]) {
        NSLog(@"Unable to add private key");
        return NO;
    }

    if (![AWSIoTKeychain addPublicKeyRef:publicKey tag:publicTag]) {
        [AWSIoTKeychain deleteAsymmetricKeysWithPublicTag:publicTag privateTag:privateTag];

        NSLog(@"Unable to add public key");
        return NO;
    }

    if(![AWSIoTKeychain addCertificateRef:certRef]) {
        [AWSIoTKeychain deleteAsymmetricKeysWithPublicTag:publicTag privateTag:privateTag];

        NSLog(@"Unable to add certificate");
        return NO;
    }

    return YES;
}

// Helper method to get cert, public key, and private key reference to import into the keychain.
+ (BOOL)readPk12:(NSData *)pk12Data withPassPhrase:(NSString *)passPhrase certRef:(SecCertificateRef *)certRef privateKeyRef:(SecKeyRef *)privateKeyRef publicKeyRef:(SecKeyRef *)publicKeyRef {
    SecPolicyRef policy = NULL;
    SecTrustRef trust = NULL;

    // cleanup stuff in a block so we don't need to do this over and over again.
    static BOOL (^cleanup)();
    static BOOL (^errorCleanup)();
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        cleanup = ^BOOL {
            if(policy) {
                CFRelease(policy);
            }

            if(trust) {
                CFRelease(trust);
            }

            return YES;
        };

        errorCleanup = ^BOOL {
            *privateKeyRef = NULL;
            *publicKeyRef = NULL;
            *certRef = NULL;

            cleanup();

            return NO;
        };
    });

    CFDictionaryRef secImportOptions = (__bridge CFDictionaryRef) @{(__bridge id) kSecImportExportPassphrase : passPhrase};
    CFArrayRef secImportItems = NULL;

    OSStatus status = SecPKCS12Import((__bridge CFDataRef) pk12Data, (CFDictionaryRef) secImportOptions, &secImportItems);

    if (status == errSecSuccess && CFArrayGetCount(secImportItems) > 0) {
        CFDictionaryRef identityDict = CFArrayGetValueAtIndex(secImportItems, 0);
        SecIdentityRef identityApp = (SecIdentityRef) CFDictionaryGetValue(identityDict, kSecImportItemIdentity);

        if (SecIdentityCopyPrivateKey(identityApp, privateKeyRef) != errSecSuccess) {
            NSLog(@"Unable to copy private key");
            return errorCleanup();
        }

        if (SecIdentityCopyCertificate(identityApp, certRef) != errSecSuccess) {
            NSLog(@"Unable to copy certificate");
            return errorCleanup();
        }

        // it would be as easy as calling SecCertificateCopyPublicKey(*certRef, publicKeyRef)... however iOS doesn't let you use this so we have to go around and get it in a different way.
        policy = SecPolicyCreateBasicX509();
        status = SecTrustCreateWithCertificates((__bridge CFArrayRef) @[(__bridge id) *certRef], policy, &trust);
        if (status != errSecSuccess) {
            NSLog(@"Unable to create trust");
            return errorCleanup();
        }

        SecTrustResultType result;
        if (SecTrustEvaluate(trust, &result) != errSecSuccess) {
            NSLog(@"Unable to evaluate trust");
            return errorCleanup();
        }

        *publicKeyRef = SecTrustCopyPublicKey(trust);
        if(*publicKeyRef == NULL) {
            NSLog(@"Unable to copy public key");
            return errorCleanup();
        }

        return cleanup();
    }


    NSLog(@"No item in PKCS12");
    return errorCleanup();
}

+ (BOOL)deleteCertificate {
    return [AWSIoTKeychain removeCertificate];
}

+ (BOOL)isValidCertificate:(NSString *)certificateId {
    return [AWSIoTKeychain isValidCertificate:[NSString stringWithFormat:@"%@%@",[AWSIoTKeychain privateKeyTag], certificateId ]];
}

@end
