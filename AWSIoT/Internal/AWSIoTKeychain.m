//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSCocoaLumberjack.h"
#import "AWSIoTKeychain.h"

NSString *const AWSIoTKeychainStartPrivateKeyTag = @"-----BEGIN RSA PRIVATE KEY-----\n";
NSString *const AWSIoTKeychainEndPrivateKeyTag = @"\n-----END RSA PRIVATE KEY-----";

NSString *const AWSIoTKeychainStartCertKeyTag = @"-----BEGIN CERTIFICATE-----\n";
NSString *const AWSIoTKeychainEndCertKeyTag = @"\n-----END CERTIFICATE-----";

static AWSIoTKeyChainAccessibility _accessibility = AWSIoTKeyChainAccessibilityAfterFirstUnlockThisDeviceOnly;

@implementation AWSIoTKeychain

+ (NSString*)rsaPublicKeyTag {
    return [NSString stringWithFormat:@"%@.RSAPublicTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString *)ecPublicKeyTag {
    return [NSString stringWithFormat:@"%@.ECPublicTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString *)ecPrimeRandomPublicKeyTag {
    return [NSString stringWithFormat:@"%@.ECPrimeRandomPublicTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString*)rsaPrivateKeyTag {
    return [NSString stringWithFormat:@"%@.RSAPrivateTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString*)ecPrivateKeyTag {
    return [NSString stringWithFormat:@"%@.ECPrivateTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString*)ecPrimeRandomPrivateKeyTag {
    return [NSString stringWithFormat:@"%@.ECPrimeRandomPrivateTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString*)rsaCertTag {
    return [NSString stringWithFormat:@"%@.RSACertTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString*)ecCertTag {
    return [NSString stringWithFormat:@"%@.ECCertTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString *)ecPrimeRandomCertTag {
    return [NSString stringWithFormat:@"%@.ECPrimeRandomCertTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString*)base64Encode:(NSData*)data {
    return [data base64EncodedStringWithOptions:kNilOptions];
}

+ (NSData*)base64Decode:(NSString*)str {
    return [[NSData alloc] initWithBase64EncodedString:str options:kNilOptions];
}

+ (NSData*)base64DecodeWithIgnoreUnknownSymbols:(NSString*)str {
    return [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
}

+ (BOOL)generateKeyPairWithPublicTag:(NSString*)publicTag privateTag:(NSString*)privateTag {
    OSStatus sanityCheck = noErr;
    SecKeyRef publicKeyRef = NULL;
    SecKeyRef privateKeyRef = NULL;
    
    NSMutableDictionary * privateKeyAttr = [[NSMutableDictionary alloc] init];
    NSMutableDictionary * publicKeyAttr = [[NSMutableDictionary alloc] init];
    NSMutableDictionary * keyPairAttr = [[NSMutableDictionary alloc] init];
    
    [privateKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecAttrIsPermanent];
    [privateKeyAttr setObject:privateTag forKey:(id)kSecAttrApplicationTag];
    
    [publicKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecAttrIsPermanent];
    [publicKeyAttr setObject:publicTag forKey:(id)kSecAttrApplicationTag];
    
    [keyPairAttr setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [keyPairAttr setObject:[NSNumber numberWithUnsignedInteger:2048] forKey:(id)kSecAttrKeySizeInBits];
    
    [keyPairAttr setObject:privateKeyAttr forKey:(id)kSecPrivateKeyAttrs];
    [keyPairAttr setObject:publicKeyAttr forKey:(id)kSecPublicKeyAttrs];
    
    sanityCheck = SecKeyGeneratePair((CFDictionaryRef)keyPairAttr, &publicKeyRef, &privateKeyRef);
    if (sanityCheck != noErr) {
        AWSDDLogError(@"generateKeyPair finished with error: %d", (int)sanityCheck);
        return NO;
    }
    
    if (publicKeyRef == NULL) {
        AWSDDLogError(@"generateKeyPair missed public key");
        return NO;
    }
    
    if (privateKeyRef == NULL) {
        AWSDDLogError(@"generateKeyPair missed private key");
        return NO;
    }
    
    AWSDDLogInfo(@"generateKeyPair successfully generated");
    
    return YES;
}

+ (BOOL)deleteAsymmetricKeysWithPublicTag:(NSString*)publicTag privateTag:(NSString*)privateTag {
    
    BOOL status = YES;
    
    OSStatus sanityCheck = noErr;
    NSMutableDictionary * queryPublicKey = [[NSMutableDictionary alloc] init];
    NSMutableDictionary * queryPrivateKey = [[NSMutableDictionary alloc] init];
    
    [queryPublicKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPublicKey setObject:publicTag forKey:(id)kSecAttrApplicationTag];
    [queryPublicKey setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    
    [queryPrivateKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPrivateKey setObject:privateTag forKey:(id)kSecAttrApplicationTag];
    [queryPrivateKey setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    
    sanityCheck = SecItemDelete((CFDictionaryRef)queryPrivateKey);
    if (sanityCheck != noErr) {
        if (sanityCheck == errSecItemNotFound) {
            AWSDDLogError(@"Error removing private key errSecItemNotFound");
        } else {
            AWSDDLogError(@"Error removing private key, OSStatus == %d.", (int)sanityCheck);
            status = NO;
        }
    }
    
    sanityCheck = SecItemDelete((CFDictionaryRef)queryPublicKey);
    if (sanityCheck != noErr) {
        if (sanityCheck == errSecItemNotFound) {
            AWSDDLogError(@"Error removing public key: errSecItemNotFound");
        } else {
            AWSDDLogError(@"Error removing public key, OSStatus == %d.", (int)sanityCheck);
            status = NO;
        }
    }

    return status;
}

+ (BOOL)deleteAsymmetricKeysWithPublicTag:(NSString*)publicTag privateTag:(NSString*)privateTag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    
    BOOL status = YES;
    
    if (keyAlgorithmType == KeyAlgorithmTypeUnknown) {
        AWSDDLogError(@"Cannot not delete keys of unknown algorithm type");
        return NO;
    }
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NO;
    }
        
    OSStatus sanityCheck = noErr;
    NSMutableDictionary * queryPublicKey = [[NSMutableDictionary alloc] init];
    NSMutableDictionary * queryPrivateKey = [[NSMutableDictionary alloc] init];
    
    [queryPublicKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPublicKey setObject:publicTag forKey:(id)kSecAttrApplicationTag];
    [queryPublicKey setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [queryPublicKey setObject:(id)kSecAttrKeyClassPublic forKey:(id)kSecAttrKeyClass];
    
    [queryPrivateKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPrivateKey setObject:privateTag forKey:(id)kSecAttrApplicationTag];
    [queryPrivateKey setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [queryPrivateKey setObject:(id)kSecAttrKeyClassPrivate forKey:(id)kSecAttrKeyClass];
    
    sanityCheck = SecItemDelete((CFDictionaryRef)queryPrivateKey);
    if (sanityCheck != noErr) {
        if (sanityCheck == errSecItemNotFound) {
            AWSDDLogError(@"Error removing private key errSecItemNotFound");
        } else {
            AWSDDLogError(@"Error removing private key, OSStatus == %d.", (int)sanityCheck);
            status = NO;
        }
    }
    
    sanityCheck = SecItemDelete((CFDictionaryRef)queryPublicKey);
    if (sanityCheck != noErr) {
        if (sanityCheck == errSecItemNotFound) {
            AWSDDLogError(@"Error removing public key: errSecItemNotFound");
        } else {
            AWSDDLogError(@"Error removing public key, OSStatus == %d.", (int)sanityCheck);
            status = NO;
        }
    }

    return status;
}

+ (BOOL)isValidCertificate:(NSString*)privateKeyTag certificateLabel:(NSString*)certificateLabel {
    
    SecIdentityRef identityRef = [AWSIoTKeychain getIdentityRef:privateKeyTag certificateLabel:certificateLabel];
    if (identityRef) {
        SecCertificateRef cert = NULL;
        OSStatus status = SecIdentityCopyCertificate(identityRef, &cert);
        CFRelease(identityRef);
        if (status == noErr) {
            return YES;
        } else {
            AWSDDLogError(@"SecIdentityCopyCertificate failed [%d]", (int)status);
        }
    }
    return NO;
}

+ (BOOL)isValidCertificate:(NSString*)privateKeyTag certificateLabel:(NSString*)certificateLabel keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    
    SecIdentityRef identityRef = [AWSIoTKeychain getIdentityRef:privateKeyTag certificateLabel:certificateLabel keyAlgorithmType:keyAlgorithmType];
    if (identityRef) {
        SecCertificateRef cert = NULL;
        OSStatus status = SecIdentityCopyCertificate(identityRef, &cert);
        CFRelease(identityRef);
        if (status == noErr) {
            if (cert) {
                CFRelease(cert);
            }
            return YES;
        } else {
            AWSDDLogError(@"SecIdentityCopyCertificate failed [%d]", (int)status);
        }
    }
    return NO;
}

+ (NSData *)certToDer:(NSString *)cert {
 
    if ([cert rangeOfString:AWSIoTKeychainStartCertKeyTag].location != NSNotFound) {
        cert = [cert substringFromIndex:AWSIoTKeychainStartCertKeyTag.length];
    }
    if ([cert rangeOfString:AWSIoTKeychainEndCertKeyTag].location != NSNotFound) {
        cert = [cert substringToIndex:(cert.length - AWSIoTKeychainEndCertKeyTag.length)];
    }
    
    return [AWSIoTKeychain base64DecodeWithIgnoreUnknownSymbols:cert];
}

+ (BOOL)addCertificateToKeychain:(NSString*)cert {
    return [AWSIoTKeychain addCertificateToKeychain:cert tag:[AWSIoTKeychain rsaCertTag]];
}

+ (BOOL)addCertificateToKeychain:(NSString*)cert tag:(NSString*)tag {
    return [AWSIoTKeychain addCertificate:[AWSIoTKeychain certToDer:cert] withTag:tag];
}

+ (BOOL)addCertificateFromPemFile:(NSString*)fileName withTag:(NSString*)tag {
    
    if ([fileName hasSuffix:@".pem"]) {
        fileName = [fileName substringToIndex:(fileName.length - @".pem".length)];
    }
    
    NSBundle *bundle       = [NSBundle bundleForClass:[self class]];
    NSString *bundleString = [bundle pathForResource:fileName ofType:@"pem"];
    NSString *cert         = [NSString stringWithContentsOfFile:bundleString encoding:NSUTF8StringEncoding error:nil];
    
    if (!cert) {
        return NO;
    }
    
    if ([cert rangeOfString:AWSIoTKeychainStartCertKeyTag].location != NSNotFound) {
        cert = [cert substringFromIndex:AWSIoTKeychainStartCertKeyTag.length];
    }
    if ([cert rangeOfString:AWSIoTKeychainEndCertKeyTag].location != NSNotFound) {
        cert = [cert substringToIndex:(cert.length - AWSIoTKeychainEndCertKeyTag.length)];
    }
    
    NSData *certData = [AWSIoTKeychain base64DecodeWithIgnoreUnknownSymbols:cert];
    if (!certData) {
        return NO;
    }
    return [AWSIoTKeychain addCertificate:certData withTag:tag];
}

+ (BOOL)addCertificate:(NSData *)cert {
    return [AWSIoTKeychain addCertificate:cert withTag:[AWSIoTKeychain rsaCertTag]];
}

+ (BOOL)addCertificate:(NSData*)cert withTag:(NSString*)tag {
    SecCertificateRef certRef = SecCertificateCreateWithData(kCFAllocatorDefault, (__bridge CFDataRef)cert);
    if (certRef == NULL) {
        AWSDDLogError(@"Error create Sec Certificate from data");
        return NO;
    }
    
    BOOL result = [AWSIoTKeychain addCertificateRef:certRef tag:tag];
    CFRelease(certRef);
    return result;
}

+ (BOOL)addCertificateRef:(SecCertificateRef)certRef {
    return [AWSIoTKeychain addCertificateRef:certRef tag:[AWSIoTKeychain rsaCertTag]];
}

+ (BOOL)addCertificateRef:(SecCertificateRef)certRef tag:(NSString*)tag {
    NSMutableDictionary * queryCertificate = [[NSMutableDictionary alloc] init];
    
    [queryCertificate setObject:(id)kSecClassCertificate forKey:(id)kSecClass];
    [queryCertificate setObject:tag forKey:(id)kSecAttrLabel];
    [queryCertificate setObject:(__bridge id)certRef forKey:(id)kSecValueRef];
    [queryCertificate setObject:(__bridge id)[AWSIoTKeychain accessibilityType] forKey:(id)kSecAttrAccessible];

    OSStatus sanityCheck = SecItemAdd((CFDictionaryRef)queryCertificate, nil);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)) {
        AWSDDLogError(@"add certificate to keychain with error: %d", (int)sanityCheck);
        return NO;
    }
    return YES;
}

+ (BOOL)removeCertificate {
    NSMutableDictionary * queryCertificate = [[NSMutableDictionary alloc] init];
    
    [queryCertificate setObject:(id)kSecClassCertificate forKey:(id)kSecClass];
    [queryCertificate setObject:[AWSIoTKeychain rsaCertTag] forKey:(id)kSecAttrLabel];
    
    OSStatus sanityCheck = SecItemDelete((CFDictionaryRef)queryCertificate);
    if (sanityCheck != noErr) {
        if (sanityCheck == errSecItemNotFound) {
            AWSDDLogError(@"Error removing certificate key errSecItemNotFound");
        } else {
            AWSDDLogError(@"Error removing certificate key, OSStatus == %d.", (int)sanityCheck);
            return NO;
        }
    }
    
    return YES;
}

+ (BOOL)removeCertificateWithTag:(NSString*)tag {
    
    NSMutableDictionary * queryCertificate = [[NSMutableDictionary alloc] init];
    
    [queryCertificate setObject:(id)kSecClassCertificate forKey:(id)kSecClass];
    [queryCertificate setObject:tag forKey:(id)kSecAttrLabel];
    
    OSStatus sanityCheck = SecItemDelete((CFDictionaryRef)queryCertificate);
    if (sanityCheck != noErr) {
        if (sanityCheck == errSecItemNotFound) {
            AWSDDLogError(@"Error removing certificate key errSecItemNotFound");
        } else {
            AWSDDLogError(@"Error removing certificate key, OSStatus == %d.", (int)sanityCheck);
            return NO;
        }
    }
    
    return YES;
}

+ (SecKeyRef)getPublicKeyRef:(NSString*)tag {
    OSStatus sanityCheck = noErr;
    SecKeyRef publicKeyReference = NULL;
    
    NSMutableDictionary * queryPublicKey = [[NSMutableDictionary alloc] init];
    
    [queryPublicKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPublicKey setObject:tag forKey:(id)kSecAttrApplicationTag];
    [queryPublicKey setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [queryPublicKey setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnRef];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryPublicKey, (CFTypeRef *)&publicKeyReference);
    
    if (sanityCheck != noErr) {
        AWSDDLogError(@"getPublicKeyRef error: %d",(int)sanityCheck);
    }
    
    return publicKeyReference;
}

+ (SecKeyRef)getPublicKeyRef:(NSString*)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    OSStatus sanityCheck = noErr;
    SecKeyRef publicKeyReference = NULL;
    
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NULL;
    }
    
    NSMutableDictionary * queryPublicKey = [[NSMutableDictionary alloc] init];
    
    [queryPublicKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPublicKey setObject:(id)kSecAttrKeyClassPublic forKey:(id)kSecAttrKeyClass];
    [queryPublicKey setObject:tag forKey:(id)kSecAttrApplicationTag];
    [queryPublicKey setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [queryPublicKey setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnRef];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryPublicKey, (CFTypeRef *)&publicKeyReference);
    
    if (sanityCheck != noErr) {
        AWSDDLogError(@"getPublicKeyRef error: %d",(int)sanityCheck);
    }
    
    return publicKeyReference;
}

+ (NSData *)getPublicKeyBits:(NSString*)tag {
    OSStatus sanityCheck = noErr;
    CFTypeRef publicKeyRef = NULL;
    
    NSMutableDictionary * queryPublicKey = [[NSMutableDictionary alloc] init];
    
    [queryPublicKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPublicKey setObject:tag forKey:(id)kSecAttrApplicationTag];
    [queryPublicKey setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [queryPublicKey setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnData];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryPublicKey, &publicKeyRef);
    
    if (sanityCheck != noErr){
        AWSDDLogError(@"getPublicKeyBits error: %d",(int)sanityCheck);
        publicKeyRef = NULL;
    }
    
    return (__bridge_transfer NSData *)publicKeyRef;
}

/**
 * Retrieves the raw data (bits) of a public key from the keychain.
 *
 * This function finds a public key matching a specific
 * application tag and algorithm type, and returns its raw data representation.
 *
 * @param tag The unique application tag used to store the key.
 * @param keyAlgorithmType The algorithm type of the key.
 *
 * @return An `NSData` object containing the key's data on success, or `NULL` if the key is
 * not found or an error occurs.
 */
+ (NSData *)getPublicKeyBits:(NSString*)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    OSStatus sanityCheck = noErr;
    CFTypeRef publicKeyRef = NULL;
            
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NULL;
    }
    
    NSMutableDictionary * queryPublicKey = [[NSMutableDictionary alloc] init];
    
    [queryPublicKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPublicKey setObject:(id)kSecAttrKeyClassPublic forKey:(id)kSecAttrKeyClass];
    [queryPublicKey setObject:tag forKey:(id)kSecAttrApplicationTag];
    [queryPublicKey setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [queryPublicKey setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnData];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryPublicKey, &publicKeyRef);
    
    if (sanityCheck != noErr){
        AWSDDLogError(@"getPublicKeyBits error: %d",(int)sanityCheck);
        publicKeyRef = NULL;
    }
    
    return (__bridge_transfer NSData *)publicKeyRef;
}

+ (SecKeyRef)getPrivateKeyRef:(NSString*)tag {
    OSStatus sanityCheck = noErr;
    SecKeyRef privateKeyReference = NULL;
    
    NSMutableDictionary * queryPrivateKey = [[NSMutableDictionary alloc] init];
    
    [queryPrivateKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPrivateKey setObject:tag forKey:(id)kSecAttrApplicationTag];
    [queryPrivateKey setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [queryPrivateKey setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnRef];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryPrivateKey, (CFTypeRef *)&privateKeyReference);
    
    if (sanityCheck != noErr) {
        AWSDDLogError(@"getPrivateKeyRef error: %d",(int)sanityCheck);
        privateKeyReference = NULL;
    }
    
    return privateKeyReference;
}

+ (SecKeyRef)getPrivateKeyRef:(NSString*)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    OSStatus sanityCheck = noErr;
    SecKeyRef privateKeyReference = NULL;
    
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NULL;
    }
    
    NSMutableDictionary * queryPrivateKey = [[NSMutableDictionary alloc] init];
    
    [queryPrivateKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPrivateKey setObject:(id)kSecAttrKeyClassPrivate forKey:(id)kSecAttrKeyClass];
    [queryPrivateKey setObject:tag forKey:(id)kSecAttrApplicationTag];
    [queryPrivateKey setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [queryPrivateKey setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnRef];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryPrivateKey, (CFTypeRef *)&privateKeyReference);
    
    if (sanityCheck != noErr) {
        AWSDDLogError(@"getPrivateKeyRef error: %d",(int)sanityCheck);
        privateKeyReference = NULL;
    }
    
    return privateKeyReference;
}

+ (NSData *)getPrivateKeyBits:(NSString*)tag {
    OSStatus sanityCheck = noErr;
    CFTypeRef privateKeyBits = NULL;
    
    NSMutableDictionary * queryPrivateKey = [[NSMutableDictionary alloc] init];
    
    [queryPrivateKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPrivateKey setObject:tag forKey:(id)kSecAttrApplicationTag];
    [queryPrivateKey setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [queryPrivateKey setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnData];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryPrivateKey, &privateKeyBits);
    
    if (sanityCheck != noErr){
        AWSDDLogError(@"getPrivateKeyBits error: %d",(int)sanityCheck);
        privateKeyBits = NULL;
    }
    
    return (__bridge_transfer NSData *)privateKeyBits;
}

+ (NSData *)getPrivateKeyBits:(NSString*)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    OSStatus sanityCheck = noErr;
    CFTypeRef privateKeyBits = NULL;
    
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NULL;
    }
    
    NSMutableDictionary * queryPrivateKey = [[NSMutableDictionary alloc] init];
    
    [queryPrivateKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPrivateKey setObject:(id)kSecAttrKeyClassPrivate forKey:(id)kSecAttrKeyClass];
    [queryPrivateKey setObject:tag forKey:(id)kSecAttrApplicationTag];
    [queryPrivateKey setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [queryPrivateKey setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnData];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryPrivateKey, &privateKeyBits);
    
    if (sanityCheck != noErr){
        AWSDDLogError(@"getPrivateKeyBits error: %d",(int)sanityCheck);
        privateKeyBits = NULL;
    }
    
    return (__bridge_transfer NSData *)privateKeyBits;
}

+ (SecIdentityRef)getIdentityRef:(NSString*)privateKeyTag certificateLabel:(NSString *)certificateLabel {
    OSStatus sanityCheck = noErr;
    SecIdentityRef identityRef = NULL;
    
    NSMutableDictionary * queryIdentityRef = [[NSMutableDictionary alloc] init];
    
    [queryIdentityRef setObject:(id)kSecClassIdentity forKey:(id)kSecClass];
    [queryIdentityRef setObject:privateKeyTag forKey:(id)kSecAttrApplicationTag];
    [queryIdentityRef setObject:certificateLabel forKey:(id)kSecAttrLabel];
    [queryIdentityRef setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [queryIdentityRef setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnRef];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryIdentityRef, (CFTypeRef *)&identityRef);
    if (sanityCheck != noErr){
        AWSDDLogError(@"getIdentityRef error: %d",(int)sanityCheck);
        return nil;
    }
    
    return identityRef;
}

+ (SecIdentityRef)getIdentityRef:(NSString*)privateKeyTag certificateLabel:(NSString *)certificateLabel keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    OSStatus sanityCheck = noErr;
    SecIdentityRef identityRef = NULL;
    
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NULL;
    }
        
    NSMutableDictionary * queryIdentityRef = [[NSMutableDictionary alloc] init];
    
    [queryIdentityRef setObject:(id)kSecClassIdentity forKey:(id)kSecClass];
    [queryIdentityRef setObject:privateKeyTag forKey:(id)kSecAttrApplicationTag];
    [queryIdentityRef setObject:certificateLabel forKey:(id)kSecAttrLabel];
    [queryIdentityRef setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [queryIdentityRef setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnRef];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryIdentityRef, (CFTypeRef *)&identityRef);
    if (sanityCheck != noErr){
        AWSDDLogError(@"getIdentityRef error: %d",(int)sanityCheck);
        return nil;
    }
    
    return identityRef;
}

+ (BOOL)addPublicKeyRef:(SecKeyRef)pubkeyRef tag:(NSString*)tag {
    
    OSStatus sanityCheck = noErr;

    NSMutableDictionary * publicKeyAttr = [[NSMutableDictionary alloc] init];
    
    [publicKeyAttr setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [publicKeyAttr setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [publicKeyAttr setObject:tag forKey:(id)kSecAttrApplicationTag];
    [publicKeyAttr setObject:(__bridge id _Nonnull)(pubkeyRef) forKey:(id)kSecValueRef];
    [publicKeyAttr setObject:(id)kSecAttrKeyClassPublic forKey:(id)kSecAttrKeyClass];
    [publicKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnPersistentRef];
    [publicKeyAttr setObject:(__bridge id)[AWSIoTKeychain accessibilityType] forKey:(id)kSecAttrAccessible];

    sanityCheck = SecItemAdd((CFDictionaryRef) publicKeyAttr, nil);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        AWSDDLogError(@"addPublicKeyRef error: %d",(int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)addPublicKeyRef:(SecKeyRef)pubkeyRef tag:(NSString*)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    
    OSStatus sanityCheck = noErr;
    NSMutableDictionary * publicKeyAttr = [[NSMutableDictionary alloc] init];
    
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NO;
    }
    
    [publicKeyAttr setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [publicKeyAttr setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [publicKeyAttr setObject:tag forKey:(id)kSecAttrApplicationTag];
    [publicKeyAttr setObject:(__bridge id _Nonnull)(pubkeyRef) forKey:(id)kSecValueRef];
    [publicKeyAttr setObject:(id)kSecAttrKeyClassPublic forKey:(id)kSecAttrKeyClass];
    [publicKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnPersistentRef];
    [publicKeyAttr setObject:(__bridge id)[AWSIoTKeychain accessibilityType] forKey:(id)kSecAttrAccessible];

    sanityCheck = SecItemAdd((CFDictionaryRef) publicKeyAttr, nil);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        AWSDDLogError(@"addPublicKeyRef error: %d",(int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)addPublicKey:(NSData*)pubkey tag:(NSString*)tag {
    
    OSStatus sanityCheck = noErr;
    CFTypeRef persistPeer = NULL;
    
    NSMutableDictionary * publicKeyAttr = [[NSMutableDictionary alloc] init];
    
    [publicKeyAttr setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [publicKeyAttr setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [publicKeyAttr setObject:tag forKey:(id)kSecAttrApplicationTag];
    [publicKeyAttr setObject:pubkey forKey:(id)kSecValueData];
    [publicKeyAttr setObject:(id)kSecAttrKeyClassPublic forKey:(id)kSecAttrKeyClass];
    [publicKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnPersistentRef];
    [publicKeyAttr setObject:(__bridge id)[AWSIoTKeychain accessibilityType] forKey:(id)kSecAttrAccessible];

    sanityCheck = SecItemAdd((CFDictionaryRef) publicKeyAttr, (CFTypeRef *)&persistPeer);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        AWSDDLogError(@"addPublicKey error: %d",(int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)addPublicKey:(NSData*)pubkey tag:(NSString*)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    
    OSStatus sanityCheck = noErr;
    
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NO;
    }
    
    NSMutableDictionary * publicKeyAttr = [[NSMutableDictionary alloc] init];
    
    [publicKeyAttr setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [publicKeyAttr setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [publicKeyAttr setObject:tag forKey:(id)kSecAttrApplicationTag];
    [publicKeyAttr setObject:pubkey forKey:(id)kSecValueData];
    [publicKeyAttr setObject:(id)kSecAttrKeyClassPublic forKey:(id)kSecAttrKeyClass];
    [publicKeyAttr setObject:(__bridge id)[AWSIoTKeychain accessibilityType] forKey:(id)kSecAttrAccessible];

    sanityCheck = SecItemAdd((CFDictionaryRef) publicKeyAttr, nil);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        AWSDDLogError(@"addPublicKey error: %d",(int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)addPrivateKeyRef:(SecKeyRef)privkeyRef tag:(NSString*)tag {
    
    OSStatus sanityCheck = noErr;
    NSMutableDictionary * privateKeyAttr = [[NSMutableDictionary alloc] init];
    
    [privateKeyAttr setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [privateKeyAttr setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [privateKeyAttr setObject:tag forKey:(id)kSecAttrApplicationTag];
    [privateKeyAttr setObject:(__bridge id _Nonnull)(privkeyRef) forKey:(id)kSecValueRef];
    [privateKeyAttr setObject:(id)kSecAttrKeyClassPrivate forKey:(id)kSecAttrKeyClass];
    [privateKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnPersistentRef];
    [privateKeyAttr setObject:(__bridge id)[AWSIoTKeychain accessibilityType] forKey:(id)kSecAttrAccessible];

    sanityCheck = SecItemAdd((CFDictionaryRef) privateKeyAttr, nil);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        AWSDDLogError(@"addPrivateKeyRef error: %d",(int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)addPrivateKeyRef:(SecKeyRef)privkeyRef tag:(NSString*)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    
    OSStatus sanityCheck = noErr;
    NSMutableDictionary * privateKeyAttr = [[NSMutableDictionary alloc] init];
    
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NO;
    }
    
    [privateKeyAttr setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [privateKeyAttr setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [privateKeyAttr setObject:tag forKey:(id)kSecAttrApplicationTag];
    [privateKeyAttr setObject:(__bridge id _Nonnull)(privkeyRef) forKey:(id)kSecValueRef];
    [privateKeyAttr setObject:(id)kSecAttrKeyClassPrivate forKey:(id)kSecAttrKeyClass];
    [privateKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnPersistentRef];
    [privateKeyAttr setObject:(__bridge id)[AWSIoTKeychain accessibilityType] forKey:(id)kSecAttrAccessible];

    sanityCheck = SecItemAdd((CFDictionaryRef) privateKeyAttr, nil);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        AWSDDLogError(@"addPrivateKeyRef error: %d",(int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)addPrivateKey:(NSData*)privkey tag:(NSString*)tag {
    
    OSStatus sanityCheck = noErr;
    CFTypeRef persistPeer = NULL;
    
    NSMutableDictionary * privateKeyAttr = [[NSMutableDictionary alloc] init];
    
    [privateKeyAttr setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [privateKeyAttr setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [privateKeyAttr setObject:tag forKey:(id)kSecAttrApplicationTag];
    [privateKeyAttr setObject:privkey forKey:(id)kSecValueData];
    [privateKeyAttr setObject:(id)kSecAttrKeyClassPrivate forKey:(id)kSecAttrKeyClass];
    [privateKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnPersistentRef];
    [privateKeyAttr setObject:(__bridge id)[AWSIoTKeychain accessibilityType] forKey:(id)kSecAttrAccessible];

    sanityCheck = SecItemAdd((CFDictionaryRef) privateKeyAttr, (CFTypeRef *)&persistPeer);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        AWSDDLogError(@"addPrivateKey error: %d",(int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)addPrivateKey:(NSData*)privkey tag:(NSString*)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    
    OSStatus sanityCheck = noErr;
    
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NO;
    }
    
    NSMutableDictionary * privateKeyAttr = [[NSMutableDictionary alloc] init];
    
    [privateKeyAttr setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [privateKeyAttr setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    [privateKeyAttr setObject:tag forKey:(id)kSecAttrApplicationTag];
    [privateKeyAttr setObject:privkey forKey:(id)kSecValueData];
    [privateKeyAttr setObject:(id)kSecAttrKeyClassPrivate forKey:(id)kSecAttrKeyClass];
    [privateKeyAttr setObject:(__bridge id)[AWSIoTKeychain accessibilityType] forKey:(id)kSecAttrAccessible];

    sanityCheck = SecItemAdd((CFDictionaryRef) privateKeyAttr, nil);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        AWSDDLogError(@"addPrivateKey error: %d",(int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)addPrivateKeyFromPemFile:(NSString*)fileName withTag:(NSString*)tag {
    
    if ([fileName hasSuffix:@".pem"]) {
        fileName = [fileName substringToIndex:(fileName.length - @".pem".length)];
    }
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *bundleString = [bundle pathForResource:fileName ofType:@"pem"];
    NSString *privKey = [NSString stringWithContentsOfFile:bundleString encoding:NSUTF8StringEncoding error:nil];
    
    if (!privKey) {
        return NO;
    }
    
    if ([privKey rangeOfString:AWSIoTKeychainStartPrivateKeyTag].location != NSNotFound) {
        privKey = [privKey substringFromIndex:AWSIoTKeychainStartPrivateKeyTag.length];
    }
    if ([privKey rangeOfString:AWSIoTKeychainEndPrivateKeyTag].location != NSNotFound) {
        privKey = [privKey substringToIndex:(privKey.length - AWSIoTKeychainEndPrivateKeyTag.length)];
    }
    
    NSData *privKeyData = [AWSIoTKeychain base64DecodeWithIgnoreUnknownSymbols:privKey];
    
    if (!privKeyData) {
        return NO;
    }
    
    return [AWSIoTKeychain addPrivateKey:privKeyData tag:tag];
}

+ (BOOL)deletePrivateKeyWithTag:(NSString*)tag {
    
    NSMutableDictionary * queryPrivateKey = [[NSMutableDictionary alloc] init];
    
    [queryPrivateKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPrivateKey setObject:tag forKey:(id)kSecAttrApplicationTag];
    [queryPrivateKey setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    
    OSStatus sanityCheck = SecItemDelete((CFDictionaryRef)queryPrivateKey);
    if (sanityCheck != noErr) {
        if (sanityCheck == errSecItemNotFound) {
            AWSDDLogError(@"Error removing private key: errSecItemNotFound");
        } else {
            AWSDDLogError(@"Error removing private key, OSStatus == %d.", (int)sanityCheck);
            return NO;
        }
    }
    
    return YES;
}

+ (BOOL)deletePrivateKeyWithTag:(NSString*)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType");
        return NO;
    }
    
    NSMutableDictionary * queryPrivateKey = [[NSMutableDictionary alloc] init];
    
    [queryPrivateKey setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [queryPrivateKey setObject:(id)kSecAttrKeyClassPrivate forKey:(id)kSecAttrKeyClass];
    [queryPrivateKey setObject:tag forKey:(id)kSecAttrApplicationTag];
    [queryPrivateKey setObject:(__bridge id)keyType forKey:(id)kSecAttrKeyType];
    
    OSStatus sanityCheck = SecItemDelete((CFDictionaryRef)queryPrivateKey);
    if (sanityCheck != noErr) {
        if (sanityCheck == errSecItemNotFound) {
            AWSDDLogError(@"Error removing private key: errSecItemNotFound");
        } else {
            AWSDDLogError(@"Error removing private key, OSStatus == %d.", (int)sanityCheck);
            return NO;
        }
    }
    
    return YES;
}

+ (void)setKeyChainAccessibility:(AWSIoTKeyChainAccessibility)accessibility {
    _accessibility = accessibility;
}

+ (KeyAlgorithmType)getKeyAlgorithmTypeFromTag:(NSString *)keyTag {
    if (!keyTag || keyTag.length == 0) {
        return KeyAlgorithmTypeUnknown;
    }
    
    if ([keyTag containsString:[AWSIoTKeychain rsaPublicKeyTag]] || [keyTag containsString:[AWSIoTKeychain rsaPrivateKeyTag]]) {
        return KeyAlgorithmTypeRSA;
    }
    
    else if ([keyTag containsString:[AWSIoTKeychain ecPublicKeyTag]] || [keyTag containsString:[AWSIoTKeychain ecPrivateKeyTag]]) {
        return KeyAlgorithmTypeEC;
    }
    
    else if ([keyTag containsString:[AWSIoTKeychain ecPrimeRandomPublicKeyTag]] || [keyTag containsString:[AWSIoTKeychain ecPrimeRandomPrivateKeyTag]]) {
        return KeyAlgorithmTypeECPrimeRandom;
    }
    
    return KeyAlgorithmTypeUnknown;
}

+ (CFStringRef)getKeyTypeFromKeyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    switch (keyAlgorithmType) {
        case KeyAlgorithmTypeRSA:
            return kSecAttrKeyTypeRSA;
        case KeyAlgorithmTypeEC:
            return kSecAttrKeyTypeEC;
        case KeyAlgorithmTypeECPrimeRandom:
            return kSecAttrKeyTypeECSECPrimeRandom;
        case KeyAlgorithmTypeUnknown:
            return NULL;
        default:
            AWSDDLogError(@"Unhandled KeyAlgorithmType");
            return NULL;
    }
}

/**
 * A convenience method that determines the Security framework key type constant directly from a keychain tag string.
 *
 * This function encapsulates the two-step process of first identifying the high-level
 * algorithm type (e.g., RSA/EC) from the tag's format, and then converting that
 * type into the specific CFStringRef constant (e.g., kSecAttrKeyTypeRSA) required
 * by the Security framework for keychain queries.
 *
 * @param keyTag The keychain tag string to inspect (e.g., from `rsaPublicKeyTag` or `ecPrivateKeyTag`).
 *
 * @return The corresponding kSecAttrKeyType constant (e.g., kSecAttrKeyTypeRSA),
 * or `NULL` if the tag does not match a known algorithm pattern.
 */
+ (CFStringRef)getKeyTypeFromKeyTag:(NSString *)keyTag {
    
    KeyAlgorithmType keyAlgorithmType = [self getKeyAlgorithmTypeFromTag:keyTag];
        
    CFStringRef keyType = [self getKeyTypeFromKeyAlgorithmType:keyAlgorithmType];
    if (keyType == NULL) {
        AWSDDLogError(@"Could not determine a valid kSecAttrKeyType from the key tag: '%@'", keyTag);
        return NULL;
    }
    return keyType;
}

+ (KeyAlgorithmType)getKeyAlgorithmTypeFromKeyRef:(SecKeyRef)keyRef {
    if (keyRef == NULL) {
        return KeyAlgorithmTypeUnknown;
    }
    
    CFDictionaryRef attributes = SecKeyCopyAttributes(keyRef);
    if (attributes == NULL) {
        AWSDDLogError(@"Could not read attributes from the provided SecKeyRef.");
        return KeyAlgorithmTypeUnknown;
    }
    
    KeyAlgorithmType algorithmType = KeyAlgorithmTypeUnknown;

    CFStringRef keyType = CFDictionaryGetValue(attributes, kSecAttrKeyType);
    if (keyType != NULL) {
        if (CFEqual(keyType, kSecAttrKeyTypeRSA)) {
            algorithmType = KeyAlgorithmTypeRSA;
        } else if (CFEqual(keyType, kSecAttrKeyTypeEC)) {
            algorithmType = KeyAlgorithmTypeEC;
        } else if (CFEqual(keyType, kSecAttrKeyTypeECSECPrimeRandom)) {
            algorithmType = KeyAlgorithmTypeECPrimeRandom;
        }
    }
    CFRelease(attributes);
    
    return algorithmType;
}

+ (NSString *)getCertificateTagFromKeyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    switch (keyAlgorithmType) {
        case KeyAlgorithmTypeRSA:
            return [self rsaCertTag];
        case KeyAlgorithmTypeEC:
            return [self ecCertTag];
        case KeyAlgorithmTypeECPrimeRandom:
            return [self ecPrimeRandomCertTag];
        case KeyAlgorithmTypeUnknown:
            return NULL;
        default:
            AWSDDLogError(@"Unhandled KeyAlgorithmType");
            return NULL;
    }
}

+ (NSString *)getPublicKeyTagFromKeyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    switch (keyAlgorithmType) {
        case KeyAlgorithmTypeRSA:
            return [self rsaPublicKeyTag];
        case KeyAlgorithmTypeEC:
            return [self ecPublicKeyTag];
        case KeyAlgorithmTypeECPrimeRandom:
            return [self ecPrimeRandomPublicKeyTag];
        case KeyAlgorithmTypeUnknown:
            return NULL;
        default:
            AWSDDLogError(@"Unhandled KeyAlgorithmType");
            return NULL;
    }
}

+ (NSString *)getPrivateKeyTagFromKeyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType {
    switch (keyAlgorithmType) {
        case KeyAlgorithmTypeRSA:
            return [self rsaPrivateKeyTag];
        case KeyAlgorithmTypeEC:
            return [self ecPrivateKeyTag];
        case KeyAlgorithmTypeECPrimeRandom:
            return [self ecPrimeRandomPrivateKeyTag];
        case KeyAlgorithmTypeUnknown:
            return NULL;
        default:
            AWSDDLogError(@"Unhandled KeyAlgorithmType");
            return NULL;
    }
}

// The following keys are deprecated, but they still need to be supported:
// - AWSIoTKeyChainAccessibilityAlways, kSecAttrAccessibleAlways,
// - AWSIoTKeyChainAccessibilityAlwaysThisDeviceOnly, kSecAttrAccessibleAlwaysThisDeviceOnly
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
+ (CFTypeRef)accessibilityType {
    switch (_accessibility) {
        case AWSIoTKeyChainAccessibilityWhenUnlocked:
            return kSecAttrAccessibleWhenUnlocked;
        case AWSIoTKeyChainAccessibilityAfterFirstUnlock:
            return kSecAttrAccessibleAfterFirstUnlock;
        case AWSIoTKeyChainAccessibilityAlways:
            return kSecAttrAccessibleAlways;
        case AWSIoTKeyChainAccessibilityWhenPasscodeSetThisDeviceOnly:
            return kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly;
        case AWSIoTKeyChainAccessibilityWhenUnlockedThisDeviceOnly:
            return kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
        case AWSIoTKeyChainAccessibilityAfterFirstUnlockThisDeviceOnly:
            return kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
        case AWSIoTKeyChainAccessibilityAlwaysThisDeviceOnly:
            return kSecAttrAccessibleAlwaysThisDeviceOnly;
        default:
            return nil;
    }
}
#pragma clang diagnostic pop

@end
