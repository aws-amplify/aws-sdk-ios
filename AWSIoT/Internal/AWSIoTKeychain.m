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

#import "AWSIoTKeychain.h"

NSString *const AWSIoTKeychainStartPrivateKeyTag = @"-----BEGIN RSA PRIVATE KEY-----\n";
NSString *const AWSIoTKeychainEndPrivateKeyTag = @"\n-----END RSA PRIVATE KEY-----";

NSString *const AWSIoTKeychainStartCertKeyTag = @"-----BEGIN CERTIFICATE-----\n";
NSString *const AWSIoTKeychainEndCertKeyTag = @"\n-----END CERTIFICATE-----";

@implementation AWSIoTKeychain

+ (NSString*)publicKeyTag {
    return [NSString stringWithFormat:@"%@.RSAPublicTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString*)privateKeyTag {
    return [NSString stringWithFormat:@"%@.RSAPrivateTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
}

+ (NSString*)certTag {
    return [NSString stringWithFormat:@"%@.RSACertTag.",[[NSBundle bundleForClass:[self class]] bundleIdentifier]];
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
        NSLog(@"generateKeyPair finished with error: %d", (int)sanityCheck);
        return NO;
    }
    
    if (publicKeyRef == NULL) {
        NSLog(@"generateKeyPair missed public key");
        return NO;
    }
    
    if (privateKeyRef == NULL) {
        NSLog(@"generateKeyPair missed private key");
        return NO;
    }
    
    NSLog(@"generateKeyPair successfully generated");
    
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
            NSLog(@"Error removing private key errSecItemNotFound");
        } else {
            NSLog(@"Error removing private key, OSStatus == %d.", (int)sanityCheck);
            status = NO;
        }
    }
    
    sanityCheck = SecItemDelete((CFDictionaryRef)queryPublicKey);
    if (sanityCheck != noErr) {
        if (sanityCheck == errSecItemNotFound) {
            NSLog(@"Error removing public key errSecItemNotFound");
        } else {
            NSLog(@"Error removing public key, OSStatus == %d.", (int)sanityCheck);
            status = NO;
        }
    }

    return status;
}

+ (BOOL)isValidCertificate:(NSString*)tag {
    
    SecIdentityRef identityRef = [AWSIoTKeychain getIdentityRef:tag];
    if (identityRef) {
        SecCertificateRef cert = NULL;
        OSStatus status = SecIdentityCopyCertificate(identityRef, &cert);
        if (status == noErr) {
            return YES;
        } else {
            NSLog(@"SecIdentityCopyCertificate failed [%d]", (int)status);
        }
    }
    
    return NO;
}

+ (BOOL)addCertificateToKeychain:(NSString*)cert {
 
    if ([cert rangeOfString:AWSIoTKeychainStartCertKeyTag].location != NSNotFound) {
        cert = [cert substringFromIndex:AWSIoTKeychainStartCertKeyTag.length];
    }
    if ([cert rangeOfString:AWSIoTKeychainEndCertKeyTag].location != NSNotFound) {
        cert = [cert substringToIndex:(cert.length - AWSIoTKeychainEndCertKeyTag.length)];
    }
    
    NSData *certData = [AWSIoTKeychain base64DecodeWithIgnoreUnknownSymbols:cert];
    return [AWSIoTKeychain addCertificate:certData];
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

+ (BOOL)addCertificate:(NSData*)cert {
    SecCertificateRef certRef = SecCertificateCreateWithData(kCFAllocatorDefault, (__bridge CFDataRef)cert);
    if (certRef == NULL) {
        NSLog(@"Error create Sec Certificate from data");
        return NO;
    }
    
    NSMutableDictionary * queryCertificate = [[NSMutableDictionary alloc] init];
    
    [queryCertificate setObject:(id)kSecClassCertificate forKey:(id)kSecClass];
    [queryCertificate setObject:[AWSIoTKeychain certTag] forKey:(id)kSecAttrLabel];
    [queryCertificate setObject:(__bridge id)certRef forKey:(id)kSecValueRef];

    OSStatus sanityCheck = SecItemAdd((CFDictionaryRef)queryCertificate, nil);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)) {
        NSLog(@"add certificate to keychain with error: %d", (int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)addCertificate:(NSData*)cert withTag:(NSString*)tag {
    SecCertificateRef certRef = SecCertificateCreateWithData(kCFAllocatorDefault, (__bridge CFDataRef)cert);
    if (certRef == NULL) {
        NSLog(@"Error create Sec Certificate from data");
        return NO;
    }
    
    NSMutableDictionary * queryCertificate = [[NSMutableDictionary alloc] init];
    
    [queryCertificate setObject:(id)kSecClassCertificate forKey:(id)kSecClass];
    [queryCertificate setObject:tag forKey:(id)kSecAttrLabel];
    [queryCertificate setObject:(__bridge id)certRef forKey:(id)kSecValueRef];
    
    OSStatus sanityCheck = SecItemAdd((CFDictionaryRef)queryCertificate, nil);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)) {
        NSLog(@"add certificate to keychain with error: %d", (int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)removeCertificate {
    
    NSMutableDictionary * queryCertificate = [[NSMutableDictionary alloc] init];
    
    [queryCertificate setObject:(id)kSecClassCertificate forKey:(id)kSecClass];
    [queryCertificate setObject:[AWSIoTKeychain certTag] forKey:(id)kSecAttrLabel];
    
    OSStatus sanityCheck = SecItemDelete((CFDictionaryRef)queryCertificate);
    if (sanityCheck != noErr) {
        if (sanityCheck == errSecItemNotFound) {
            NSLog(@"Error removing certificate key errSecItemNotFound");
        } else {
            NSLog(@"Error removing certificate key, OSStatus == %d.", (int)sanityCheck);
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
            NSLog(@"Error removing certificate key errSecItemNotFound");
        } else {
            NSLog(@"Error removing certificate key, OSStatus == %d.", (int)sanityCheck);
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
        NSLog(@"getPublicKeyRef error: %d",(int)sanityCheck);
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
        NSLog(@"getPublicKeyBits error: %d",(int)sanityCheck);
        publicKeyRef = NULL;
    }
    
    return (__bridge NSData *)publicKeyRef;
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
        NSLog(@"getPrivateKeyRef error: %d",(int)sanityCheck);
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
        NSLog(@"getPrivateKeyBits error: %d",(int)sanityCheck);
        privateKeyBits = NULL;
    }
    
    return (__bridge NSData *)privateKeyBits;
}

+ (SecIdentityRef)getIdentityRef:(NSString*)tag {
    OSStatus sanityCheck = noErr;
    SecIdentityRef identityRef = NULL;
    
    NSMutableDictionary * queryIdentityRef = [[NSMutableDictionary alloc] init];
    
    [queryIdentityRef setObject:(id)kSecClassIdentity forKey:(id)kSecClass];
    [queryIdentityRef setObject:tag forKey:(id)kSecAttrApplicationTag]; 
    [queryIdentityRef setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [queryIdentityRef setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnRef];
    
    sanityCheck = SecItemCopyMatching((CFDictionaryRef)queryIdentityRef, (CFTypeRef *)&identityRef);
    
    if (sanityCheck != noErr){
        NSLog(@"getIdentityRef error: %d",(int)sanityCheck);
        identityRef = NULL;
    }
    
    return identityRef;
}

+ (BOOL)addPublicKeyRef:(SecKeyRef)pubkeyRef tag:(NSString*)tag {
    
    OSStatus sanityCheck = noErr;
    CFTypeRef persistPeer = NULL;
    
    NSMutableDictionary * publicKeyAttr = [[NSMutableDictionary alloc] init];
    
    [publicKeyAttr setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [publicKeyAttr setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [publicKeyAttr setObject:tag forKey:(id)kSecAttrApplicationTag];
    [publicKeyAttr setObject:(__bridge id _Nonnull)(pubkeyRef) forKey:(id)kSecValueRef];
    [publicKeyAttr setObject:(id)kSecAttrKeyClassPublic forKey:(id)kSecAttrKeyClass];
    [publicKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnPersistentRef];
    
    sanityCheck = SecItemAdd((CFDictionaryRef) publicKeyAttr, (CFTypeRef *)&persistPeer);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        NSLog(@"addPublicKeyRef error: %d",(int)sanityCheck);
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
    
    sanityCheck = SecItemAdd((CFDictionaryRef) publicKeyAttr, (CFTypeRef *)&persistPeer);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        NSLog(@"addPublicKey error: %d",(int)sanityCheck);
        return NO;
    }
    
    return YES;
}

+ (BOOL)addPrivateKeyRef:(SecKeyRef)privkeyRef tag:(NSString*)tag {
    
    OSStatus sanityCheck = noErr;
    CFTypeRef persistPeer = NULL;
    
    NSMutableDictionary * privateKeyAttr = [[NSMutableDictionary alloc] init];
    
    [privateKeyAttr setObject:(id)kSecClassKey forKey:(id)kSecClass];
    [privateKeyAttr setObject:(id)kSecAttrKeyTypeRSA forKey:(id)kSecAttrKeyType];
    [privateKeyAttr setObject:tag forKey:(id)kSecAttrApplicationTag];
    [privateKeyAttr setObject:(__bridge id _Nonnull)(privkeyRef) forKey:(id)kSecValueRef];
    [privateKeyAttr setObject:(id)kSecAttrKeyClassPrivate forKey:(id)kSecAttrKeyClass];
    [privateKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(id)kSecReturnPersistentRef];
    
    sanityCheck = SecItemAdd((CFDictionaryRef) privateKeyAttr, (CFTypeRef *)&persistPeer);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        NSLog(@"addPrivateKeyRef error: %d",(int)sanityCheck);
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
    
    sanityCheck = SecItemAdd((CFDictionaryRef) privateKeyAttr, (CFTypeRef *)&persistPeer);
    if ((sanityCheck != noErr) && (sanityCheck != errSecDuplicateItem)){
        NSLog(@"addPrivateKey error: %d",(int)sanityCheck);
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
            NSLog(@"Error removing private key errSecItemNotFound");
        } else {
            NSLog(@"Error removing private key, OSStatus == %d.", (int)sanityCheck);
            return NO;
        }
    }
    
    return YES;
}

+ (SecIdentityRef)certificateFromP12:(NSString*)path password:(NSString *)password {
    
    if (!path) {
        NSLog(@"path to p12 cert is nil");
        return nil;
    }
    
    if (!password) {
        NSLog(@"no password given");
        return nil;
    }
    
    NSData *pkcs12data = [[NSData alloc] initWithContentsOfFile:path];
    if (!pkcs12data) {
        NSLog(@"can't load p12 cert");
        return nil;
    }
    
    CFArrayRef keyref = NULL;
    OSStatus sanityCheck = SecPKCS12Import((__bridge CFDataRef)pkcs12data,
                                           (__bridge CFDictionaryRef)[NSDictionary dictionaryWithObject:password forKey:(__bridge id)kSecImportExportPassphrase],
                                           &keyref);
    if (sanityCheck != noErr) {
        NSLog(@"Error while importing pkcs12 [%d]", (int)sanityCheck);
        return nil;
    }
    
    CFDictionaryRef identityDict = CFArrayGetValueAtIndex(keyref, 0);
    if (!identityDict) {
        NSLog(@"could not get CFArrayGetValueAtIndex");
        return nil;
    }
    
    SecIdentityRef identityRef = (SecIdentityRef)CFDictionaryGetValue(identityDict, kSecImportItemIdentity);
    if (!identityRef) {
        NSLog(@"could not get CFDictionaryGetValue");
        return nil;
    };
    
    SecCertificateRef cert = NULL;
    OSStatus status = SecIdentityCopyCertificate(identityRef, &cert);
    if (status != noErr) {
        NSLog(@"SecIdentityCopyCertificate failed [%d]", (int)status);
        return nil;
    }
    
    return identityRef;
}

@end
