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

#import <Foundation/Foundation.h>

#import <Security/Security.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

FOUNDATION_EXPORT NSString *const AWSIoTKeychainStartPrivateKeyTag;
FOUNDATION_EXPORT NSString *const AWSIoTKeychainEndPrivateKeyTag;

FOUNDATION_EXPORT NSString *const AWSIoTKeychainStartCertKeyTag;
FOUNDATION_EXPORT NSString *const AWSIoTKeychainEndCertKeyTag;

@interface AWSIoTKeychain : NSObject

+ (NSString *)publicKeyTag;
+ (NSString *)privateKeyTag;
+ (NSString *)certTag;

+ (NSString *)base64Encode:(NSData *)data;
+ (NSData *)base64Decode:(NSString *)str;
+ (NSData *)base64DecodeWithIgnoreUnknownSymbols:(NSString *)str;

+ (NSData *)certToDer:(NSString *)cert;

+ (BOOL)generateKeyPairWithPublicTag:(NSString *)publicTag privateTag:(NSString *)privateTag;
+ (BOOL)deleteAsymmetricKeysWithPublicTag:(NSString *)publicTag privateTag:(NSString *)privateTag;
+ (BOOL)isValidCertificate:(NSString *)tag;
+ (BOOL)addCertificateToKeychain:(NSString *)cert;
+ (BOOL)addCertificateFromPemFile:(NSString*)fileName withTag:(NSString*)tag;
+ (BOOL)addCertificate:(NSData *)cert;
+ (BOOL)addCertificate:(NSData*)cert withTag:(NSString*)tag;
+ (BOOL)addCertificateRef:(SecCertificateRef)certRef;
+ (BOOL)removeCertificateWithTag:(NSString*)tag;
+ (BOOL)removeCertificate;

+ (SecKeyRef)getPublicKeyRef:(NSString *)tag;
+ (NSData *)getPublicKeyBits:(NSString *)tag;
+ (SecKeyRef)getPrivateKeyRef:(NSString *)tag;
+ (NSData *)getPrivateKeyBits:(NSString *)tag;
+ (SecIdentityRef)getIdentityRef:(NSString *)tag;
+ (BOOL)addPublicKeyRef:(SecKeyRef)pubkeyRef tag:(NSString *)tag;
+ (BOOL)addPublicKey:(NSData *)pubkey tag:(NSString *)tag;
+ (BOOL)addPrivateKeyRef:(SecKeyRef)privkeyRef tag:(NSString *)tag;
+ (BOOL)addPrivateKey:(NSData *)privkey tag:(NSString *)tag;
+ (BOOL)deletePrivateKeyWithTag:(NSString*)tag;

@end
