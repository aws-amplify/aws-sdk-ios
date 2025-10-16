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

#import <Foundation/Foundation.h>

#import <Security/Security.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "AWSIoTKeyChainTypes.h"

FOUNDATION_EXPORT NSString *const AWSIoTKeychainStartPrivateKeyTag;
FOUNDATION_EXPORT NSString *const AWSIoTKeychainEndPrivateKeyTag;

FOUNDATION_EXPORT NSString *const AWSIoTKeychainStartCertKeyTag;
FOUNDATION_EXPORT NSString *const AWSIoTKeychainEndCertKeyTag;

/**
 * Represents common cryptographic key algorithms.
 * This enum provides a high-level abstraction for the low-level constants
 * (e.g., kSecAttrKeyTypeRSA) used by the Security framework.
 */
typedef NS_ENUM(NSInteger, KeyAlgorithmType) {
    KeyAlgorithmTypeUnknown,
    KeyAlgorithmTypeRSA,
    KeyAlgorithmTypeEC,
    KeyAlgorithmTypeECPrimeRandom
};

@interface AWSIoTKeychain : NSObject

+ (NSString *)rsaPublicKeyTag;
+ (NSString *)ecPublicKeyTag;
+ (NSString *)ecPrimeRandomPublicKeyTag;
+ (NSString *)rsaPrivateKeyTag;
+ (NSString *)ecPrivateKeyTag;
+ (NSString *)ecPrimeRandomPrivateKeyTag;
+ (NSString *)rsaCertTag;
+ (NSString *)ecCertTag;
+ (NSString *)ecPrimeRandomCertTag;

+ (NSString *)base64Encode:(NSData *)data;
+ (NSData *)base64Decode:(NSString *)str;
+ (NSData *)base64DecodeWithIgnoreUnknownSymbols:(NSString *)str;

+ (NSData *)certToDer:(NSString *)cert;

+ (BOOL)generateKeyPairWithPublicTag:(NSString *)publicTag privateTag:(NSString *)privateTag;
+ (BOOL)deleteAsymmetricKeysWithPublicTag:(NSString *)publicTag privateTag:(NSString *)privateTag;

/**
 * Deletes an asymmetric key pair from the keychain for a specific algorithm.
 * This function explicitly requires the algorithm type to build precise queries for deleting
 * both the public and private keys associated with the provided tags. It attempts to delete
 * both keys even if one is not found.
 *
 * @param publicTag The unique application tag for the public key.
 * @param privateTag The unique application tag for the private key.
 * @param keyAlgorithmType The algorithm of the key pair to be deleted.
 *
 * @return `YES` if both keys were either successfully deleted or were already not present.
 * Returns `NO` if a critical, unexpected error occurred during either deletion operation.
 */
+ (BOOL)deleteAsymmetricKeysWithPublicTag:(NSString *)publicTag privateTag:(NSString *)privateTag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (BOOL)isValidCertificate:(NSString*)privateKeyTag certificateLabel:(NSString*)certificateLabel;

/**
 * Checks if a valid certificate can be extracted from a keychain identity specified by its composite tags.
 * This function performs a validation check by first searching for a cryptographic identity
 * (`SecIdentityRef`) using a specific private key tag, certificate label, and algorithm type.
 * If an identity is found, it then attempts to copy the certificate (`SecCertificateRef`) from that
 * identity to confirm its structural integrity.
 *
 * Note: This function does not validate the certificate's expiration date or trust chain;
 * it only confirms that an identity exists and is well-formed enough for a certificate to be
 * extracted from it.
 *
 * @param privateKeyTag The application tag of the private key associated with the identity.
 * @param certificateLabel The label of the certificate associated with the identity.
 * @param keyAlgorithmType The algorithm type of the key pair.
 *
 * @return `YES` if an identity is found and a certificate can be successfully extracted from it.
 * Returns `NO` if the identity is not found or if the certificate extraction fails.
 */
+ (BOOL)isValidCertificate:(NSString*)privateKeyTag certificateLabel:(NSString*)certificateLabel keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (BOOL)addCertificateToKeychain:(NSString *)cert;
+ (BOOL)addCertificateToKeychain:(NSString*)cert tag:(NSString*)tag;
+ (BOOL)addCertificateFromPemFile:(NSString*)fileName withTag:(NSString*)tag;
+ (BOOL)addCertificate:(NSData *)cert;
+ (BOOL)addCertificate:(NSData*)cert withTag:(NSString*)tag;
+ (BOOL)addCertificateRef:(SecCertificateRef)certRef;
+ (BOOL)addCertificateRef:(SecCertificateRef)certRef tag:(NSString*)tag;
+ (BOOL)removeCertificateWithTag:(NSString*)tag;
+ (BOOL)removeCertificate;

+ (SecKeyRef)getPublicKeyRef:(NSString *)tag;

/**
 * Retrieves a public key reference (SecKeyRef) from the keychain using its tag and algorithm type.
 *
 * This function builds a query to find a `kSecClassKey` item that is a public key
 * and matches a specific application tag and algorithm type.
 * The caller is responsible for releasing the returned `SecKeyRef` object by calling `CFRelease()`
 * to prevent a memory leak.
 *
 * @param tag The unique application tag used to store the key.
 * @param keyAlgorithmType The algorithm type of the key.
 *
 * @return A `SecKeyRef` on success, or `NULL` if the key is not found or an error occurs.
 */
+ (SecKeyRef)getPublicKeyRef:(NSString *)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (NSData *)getPublicKeyBits:(NSString *)tag;

/**
 * Retrieves the raw data (bits) of a public key from the keychain.
 * This function finds a public key matching a specific
 * application tag and algorithm type, and returns its raw data representation.
 *
 * @param tag The unique application tag used to store the key.
 * @param keyAlgorithmType The algorithm type of the key.
 *
 * @return `NSData` object containing the key's data on success, or `NULL` if the key is
 * not found or an error occurs.
 */
+ (NSData *)getPublicKeyBits:(NSString *)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (SecKeyRef)getPrivateKeyRef:(NSString *)tag;

/**
 * Retrieves a private key reference (SecKeyRef) from the keychain using its tag and algorithm type.
 * This function builds a precise query to find a `kSecClassKey` item that is a private key
 * and matches a specific application tag and algorithm type.
 * The caller is responsible for releasing the returned `SecKeyRef` object by calling `CFRelease()`
 * to prevent a memory leak.
 *
 * @param tag The unique application tag used to store the key.
 * @param keyAlgorithmType The algorithm type of the key.
 *
 * @return A `SecKeyRef` on success, or `NULL` if the key is not found or an error occurs.
 */
+ (SecKeyRef)getPrivateKeyRef:(NSString *)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (NSData *)getPrivateKeyBits:(NSString *)tag;

/**
 * Retrieves the raw data (bits) of a private key from the keychain.
 * This function finds a private key matching a specific
 * application tag and algorithm type, and returns its raw data representation.
 *
 * @param tag The unique application tag used to store the key.
 * @param keyAlgorithmType The algorithm type of the key.
 *
 * @return `NSData` object containing the key's data on success, or `NULL` if the key is
 * not found or an error occurs.
 */
+ (NSData *)getPrivateKeyBits:(NSString *)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (SecIdentityRef)getIdentityRef:(NSString*)privateKeyTag certificateLabel:(NSString *)certificateLabel;

/**
 * Retrieves a complete cryptographic identity (SecIdentityRef) from the keychain.
 * This function builds a query to find a `kSecClassIdentity` item that matches a specific
 * private key tag, certificate label, and algorithm type.
 * The caller is responsible for releasing the returned `SecIdentityRef` object by calling `CFRelease()`
 * to prevent a memory leak.
 *
 * @param privateKeyTag The application tag of the private key associated with the identity.
 * @param certificateLabel The label of the certificate associated with the identity.
 * @param keyAlgorithmType The algorithm type of the key pair.
 *
 * @return A `SecIdentityRef` on success, or `NULL` if the identity is not found or an error occurs.
 */
+ (SecIdentityRef)getIdentityRef:(NSString*)privateKeyTag certificateLabel:(NSString *)certificateLabel keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (BOOL)addPublicKeyRef:(SecKeyRef)pubkeyRef tag:(NSString *)tag;

/**
 * Adds a public key reference to the keychain with a specific tag and algorithm type.
 *
 * @param pubkeyRef A reference to the public key object to be stored.
 * @param tag The unique application tag for the key.
 * @param keyAlgorithmType The algorithm type of the key.
 *
 * @return `YES` if the key was successfully stored in the keychain, `NO` otherwise.
 */
+ (BOOL)addPublicKeyRef:(SecKeyRef)pubkeyRef tag:(NSString *)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (BOOL)addPublicKey:(NSData *)pubkey tag:(NSString *)tag;

/**
 * Adds public key data to the keychain with a specific tag and algorithm type.
 *
 * @param pubkey The raw `NSData` of the public key to be stored.
 * @param tag The unique application tag for the key.
 * @param keyAlgorithmType The algorithm type of the key.
 *
 * @return `YES` if the key was successfully stored in the keychain, `NO` otherwise.
 */
+ (BOOL)addPublicKey:(NSData *)pubkey tag:(NSString *)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (BOOL)addPrivateKeyRef:(SecKeyRef)privkeyRef tag:(NSString *)tag;

/**
 * Adds a private key reference to the keychain with a specific tag and algorithm type.
 *
 * @param privkeyRef A reference to the private key object to be stored.
 * @param tag The unique application tag for the key.
 * @param keyAlgorithmType The algorithm type of the key.
 * @return `YES` if the key was successfully stored, `NO` otherwise.
 */
+ (BOOL)addPrivateKeyRef:(SecKeyRef)privkeyRef tag:(NSString *)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (BOOL)addPrivateKey:(NSData *)privkey tag:(NSString *)tag;

/**
 * Adds private key data to the keychain with a specific tag and algorithm type.
 *
 * @param privkey The raw `NSData` of the private key to be stored.
 * @param tag The unique application tag for the key.
 * @param keyAlgorithmType The algorithm type of the key.
 * @return `YES` if the key was successfully stored, `NO` otherwise.
 */
+ (BOOL)addPrivateKey:(NSData *)privkey tag:(NSString *)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (BOOL)deletePrivateKeyWithTag:(NSString*)tag;

/**
 * Deletes a specific private key from the keychain using its tag and algorithm type.
 * This function finds and removes a private key from the keychain
 * that matches the specified application tag and algorithm.
 *
 * @param tag The unique application tag for the private key.
 * @param keyAlgorithmType The algorithm type of the key to be deleted.
 *
 * @return `YES` if the key was successfully deleted or was already not present. Returns `NO`
 * if a critical, unexpected error occurred during the deletion operation.
 */
+ (BOOL)deletePrivateKeyWithTag:(NSString*)tag keyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

+ (void)setKeyChainAccessibility:(AWSIoTKeyChainAccessibility)accessibility;

/**
 * Converts a KeyAlgorithmType enum value to its corresponding Security framework constant.
 *
 * @param keyAlgorithmType The enum value representing the algorithm.
 * @return The corresponding kSecAttrKeyType constant (e.g., kSecAttrKeyTypeRSA) on success,
 * or `NULL` if the type is KeyAlgorithmTypeUnknown or otherwise unhandled.
 */
+ (CFStringRef)getKeyTypeFromKeyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

/**
 * Determines the key algorithm type by inspecting the provided keychain tag string.
 *
 * This utility function parses a tag string to check for the presence of specific,
 * predefined identifiers like ".RSAPublicTag." or ".ECPrivateTag.". It is designed
 * to work with tags that follow the naming convention established by methods like
 * `rsaPublicKeyTag` and `ecPrivateKeyTag`.
 *
 * @param keyTag The keychain tag `NSString` to inspect.
 *
 * @return The corresponding `KeyAlgorithmType` enum value (`KeyAlgorithmTypeRSA` or
 * `KeyAlgorithmTypeEC`). Returns `KeyAlgorithmTypeUnknown` if the tag is `nil`,
 * empty, or does not match a known algorithm pattern.
 */
+ (KeyAlgorithmType)getKeyAlgorithmTypeFromTag:(NSString *)keyTag;

/**
 * Inspects a SecKeyRef and returns its algorithm type as a high-level enum.
 * It interacts with the Security framework to read the key's attributes and maps the low-level
 * keychain constant to the application's high-level `KeyAlgorithmType` enum.
 *
 * @param keyRef A reference to the key object (public or private) to be inspected.
 *
 * @return The corresponding `KeyAlgorithmType` enum value (e.g., `KeyAlgorithmTypeRSA`).
 * Returns `KeyAlgorithmTypeUnknown` if the key reference is NULL or its type cannot be determined.
 */
+ (KeyAlgorithmType)getKeyAlgorithmTypeFromKeyRef:(SecKeyRef)keyRef;

/**
 * A factory method that returns the appropriate certificate tag string for a given algorithm type.
 * This utility function acts as a dispatcher, calling the correct specific tag-generation
 * method (e.g., `rsaCertTag` or `ecCertTag`) based on the provided
 * `KeyAlgorithmType` enum.
 *
 * @param keyAlgorithmType The enum value representing the algorithm associated with the certificate.
 *
 * @return An `NSString` containing the fully-formed certificate tag. Returns `nil` if the
 * algorithm type is `KeyAlgorithmTypeUnknown` or another unhandled value.
 */
+ (NSString *)getCertificateTagFromKeyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

/**
 * A factory method that returns the appropriate public key tag string for a given algorithm type.
 * This utility function acts as a dispatcher, calling the correct specific tag-generation
 * method (e.g., `rsaPublicKeyTag` or `ecPublicKeyTag`) based on the provided
 * `KeyAlgorithmType` enum.
 *
 * @param keyAlgorithmType The enum value representing the algorithm.
 *
 * @return An `NSString` containing the fully-formed public key tag. Returns `nil` if the
 * algorithm type is `KeyAlgorithmTypeUnknown` or another unhandled value.
 */
+ (NSString *)getPublicKeyTagFromKeyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

/**
 * A factory method that returns the appropriate private key tag string for a given algorithm type.
 * This utility function acts as a dispatcher, calling the correct specific tag-generation
 * method (e.g., `rsaPublicKeyTag` or `ecPublicKeyTag`) based on the provided
 * `KeyAlgorithmType` enum.
 *
 * @param keyAlgorithmType The enum value representing the algorithm.
 *
 * @return An `NSString` containing the fully-formed public key tag. Returns `nil` if the
 * algorithm type is `KeyAlgorithmTypeUnknown` or another unhandled value.
 */
+ (NSString *)getPrivateKeyTagFromKeyAlgorithmType:(KeyAlgorithmType)keyAlgorithmType;

@end
