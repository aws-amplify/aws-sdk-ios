//
//  UICKeyChainStore.h
//  UICKeyChainStore
//
//  Created by Kishikawa Katsumi on 11/11/20.
//  Copyright (c) 2011 Kishikawa Katsumi. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const AWSUICKeyChainStoreErrorDomain;

typedef NS_ENUM(NSInteger, AWSUICKeyChainStoreErrorCode) {
    AWSUICKeyChainStoreErrorInvalidArguments = 1,
};

typedef NS_ENUM(NSInteger, AWSUICKeyChainStoreItemClass) {
    AWSUICKeyChainStoreItemClassGenericPassword = 1,
    AWSUICKeyChainStoreItemClassInternetPassword,
};

typedef NS_ENUM(NSInteger, AWSUICKeyChainStoreProtocolType) {
    AWSUICKeyChainStoreProtocolTypeFTP = 1,
    AWSUICKeyChainStoreProtocolTypeFTPAccount,
    AWSUICKeyChainStoreProtocolTypeHTTP,
    AWSUICKeyChainStoreProtocolTypeIRC,
    AWSUICKeyChainStoreProtocolTypeNNTP,
    AWSUICKeyChainStoreProtocolTypePOP3,
    AWSUICKeyChainStoreProtocolTypeSMTP,
    AWSUICKeyChainStoreProtocolTypeSOCKS,
    AWSUICKeyChainStoreProtocolTypeIMAP,
    AWSUICKeyChainStoreProtocolTypeLDAP,
    AWSUICKeyChainStoreProtocolTypeAppleTalk,
    AWSUICKeyChainStoreProtocolTypeAFP,
    AWSUICKeyChainStoreProtocolTypeTelnet,
    AWSUICKeyChainStoreProtocolTypeSSH,
    AWSUICKeyChainStoreProtocolTypeFTPS,
    AWSUICKeyChainStoreProtocolTypeHTTPS,
    AWSUICKeyChainStoreProtocolTypeHTTPProxy,
    AWSUICKeyChainStoreProtocolTypeHTTPSProxy,
    AWSUICKeyChainStoreProtocolTypeFTPProxy,
    AWSUICKeyChainStoreProtocolTypeSMB,
    AWSUICKeyChainStoreProtocolTypeRTSP,
    AWSUICKeyChainStoreProtocolTypeRTSPProxy,
    AWSUICKeyChainStoreProtocolTypeDAAP,
    AWSUICKeyChainStoreProtocolTypeEPPC,
    AWSUICKeyChainStoreProtocolTypeNNTPS,
    AWSUICKeyChainStoreProtocolTypeLDAPS,
    AWSUICKeyChainStoreProtocolTypeTelnetS,
    AWSUICKeyChainStoreProtocolTypeIRCS,
    AWSUICKeyChainStoreProtocolTypePOP3S,
};

typedef NS_ENUM(NSInteger, AWSUICKeyChainStoreAuthenticationType) {
    AWSUICKeyChainStoreAuthenticationTypeNTLM = 1,
    AWSUICKeyChainStoreAuthenticationTypeMSN,
    AWSUICKeyChainStoreAuthenticationTypeDPA,
    AWSUICKeyChainStoreAuthenticationTypeRPA,
    AWSUICKeyChainStoreAuthenticationTypeHTTPBasic,
    AWSUICKeyChainStoreAuthenticationTypeHTTPDigest,
    AWSUICKeyChainStoreAuthenticationTypeHTMLForm,
    AWSUICKeyChainStoreAuthenticationTypeDefault,
};

typedef NS_ENUM(NSInteger, AWSUICKeyChainStoreAccessibility) {
    AWSUICKeyChainStoreAccessibilityWhenUnlocked = 1,
    AWSUICKeyChainStoreAccessibilityAfterFirstUnlock,
    AWSUICKeyChainStoreAccessibilityAlways,
    AWSUICKeyChainStoreAccessibilityWhenPasscodeSetThisDeviceOnly
    __OSX_AVAILABLE_STARTING(__MAC_10_10, __IPHONE_8_0),
    AWSUICKeyChainStoreAccessibilityWhenUnlockedThisDeviceOnly,
    AWSUICKeyChainStoreAccessibilityAfterFirstUnlockThisDeviceOnly,
    AWSUICKeyChainStoreAccessibilityAlwaysThisDeviceOnly,
}
__OSX_AVAILABLE_STARTING(__MAC_10_9, __IPHONE_4_0);

typedef NS_ENUM(NSInteger, AWSUICKeyChainStoreAuthenticationPolicy) {
    AWSUICKeyChainStoreAuthenticationPolicyUserPresence = kSecAccessControlUserPresence,
};

@interface AWSUICKeyChainStore : NSObject

@property (nonatomic, readonly) AWSUICKeyChainStoreItemClass itemClass;

@property (nonatomic, readonly) NSString *service;
@property (nonatomic, readonly) NSString *accessGroup;

@property (nonatomic, readonly) NSURL *server;
@property (nonatomic, readonly) AWSUICKeyChainStoreProtocolType protocolType;
@property (nonatomic, readonly) AWSUICKeyChainStoreAuthenticationType authenticationType;

@property (nonatomic) AWSUICKeyChainStoreAccessibility accessibility;
@property (nonatomic, readonly) AWSUICKeyChainStoreAuthenticationPolicy authenticationPolicy
__OSX_AVAILABLE_STARTING(__MAC_10_10, __IPHONE_8_0);

@property (nonatomic) BOOL synchronizable;

@property (nonatomic) NSString *authenticationPrompt
__OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_8_0);

@property (nonatomic, readonly) NSArray *allKeys;
@property (nonatomic, readonly) NSArray *allItems;

+ (NSString *)defaultService;
+ (void)setDefaultService:(NSString *)defaultService;

+ (AWSUICKeyChainStore *)keyChainStore;
+ (AWSUICKeyChainStore *)keyChainStoreWithService:(NSString *)service;
+ (AWSUICKeyChainStore *)keyChainStoreWithService:(NSString *)service accessGroup:(NSString *)accessGroup;

+ (AWSUICKeyChainStore *)keyChainStoreWithServer:(NSURL *)server protocolType:(AWSUICKeyChainStoreProtocolType)protocolType;
+ (AWSUICKeyChainStore *)keyChainStoreWithServer:(NSURL *)server protocolType:(AWSUICKeyChainStoreProtocolType)protocolType authenticationType:(AWSUICKeyChainStoreAuthenticationType)authenticationType;

- (instancetype)init;
- (instancetype)initWithService:(NSString *)service;
- (instancetype)initWithService:(NSString *)service accessGroup:(NSString *)accessGroup;

- (instancetype)initWithServer:(NSURL *)server protocolType:(AWSUICKeyChainStoreProtocolType)protocolType;
- (instancetype)initWithServer:(NSURL *)server protocolType:(AWSUICKeyChainStoreProtocolType)protocolType authenticationType:(AWSUICKeyChainStoreAuthenticationType)authenticationType;

+ (NSString *)stringForKey:(NSString *)key;
+ (NSString *)stringForKey:(NSString *)key service:(NSString *)service;
+ (NSString *)stringForKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key service:(NSString *)service;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup;

+ (NSData *)dataForKey:(NSString *)key;
+ (NSData *)dataForKey:(NSString *)key service:(NSString *)service;
+ (NSData *)dataForKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key service:(NSString *)service;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup;

- (BOOL)contains:(NSString *)key;

- (BOOL)setString:(NSString *)string forKey:(NSString *)key;
- (BOOL)setString:(NSString *)string forKey:(NSString *)key label:(NSString *)label comment:(NSString *)comment;
- (NSString *)stringForKey:(NSString *)key;

- (BOOL)setData:(NSData *)data forKey:(NSString *)key;
- (BOOL)setData:(NSData *)data forKey:(NSString *)key label:(NSString *)label comment:(NSString *)comment;
- (NSData *)dataForKey:(NSString *)key;

+ (BOOL)removeItemForKey:(NSString *)key;
+ (BOOL)removeItemForKey:(NSString *)key service:(NSString *)service;
+ (BOOL)removeItemForKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup;

+ (BOOL)removeAllItems;
+ (BOOL)removeAllItemsForService:(NSString *)service;
+ (BOOL)removeAllItemsForService:(NSString *)service accessGroup:(NSString *)accessGroup;

- (BOOL)removeItemForKey:(NSString *)key;

- (BOOL)removeAllItems;

- (NSString *)objectForKeyedSubscript:(NSString <NSCopying> *)key;
- (void)setObject:(NSString *)obj forKeyedSubscript:(NSString <NSCopying> *)key;

+ (NSArray *)allKeysWithItemClass:(AWSUICKeyChainStoreItemClass)itemClass;
- (NSArray *)allKeys;

+ (NSArray *)allItemsWithItemClass:(AWSUICKeyChainStoreItemClass)itemClass;
- (NSArray *)allItems;

- (void)setAccessibility:(AWSUICKeyChainStoreAccessibility)accessibility authenticationPolicy:(AWSUICKeyChainStoreAuthenticationPolicy)authenticationPolicy
__OSX_AVAILABLE_STARTING(__MAC_10_10, __IPHONE_8_0);

#if TARGET_OS_IPHONE
- (void)sharedPasswordWithCompletion:(void (^)(NSString *account, NSString *password, NSError *error))completion;
- (void)sharedPasswordForAccount:(NSString *)account completion:(void (^)(NSString *password, NSError *error))completion;

- (void)setSharedPassword:(NSString *)password forAccount:(NSString *)account completion:(void (^)(NSError *error))completion;
- (void)removeSharedPasswordForAccount:(NSString *)account completion:(void (^)(NSError *error))completion;

+ (void)requestSharedWebCredentialWithCompletion:(void (^)(NSArray *credentials, NSError *error))completion;
+ (void)requestSharedWebCredentialForDomain:(NSString *)domain account:(NSString *)account completion:(void (^)(NSArray *credentials, NSError *error))completion;

+ (NSString *)generatePassword;
#endif

@end

@interface AWSUICKeyChainStore (ErrorHandling)

+ (NSString *)stringForKey:(NSString *)key error:(NSError * __autoreleasing *)error;
+ (NSString *)stringForKey:(NSString *)key service:(NSString *)service error:(NSError * __autoreleasing *)error;
+ (NSString *)stringForKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup error:(NSError * __autoreleasing *)error;

+ (BOOL)setString:(NSString *)value forKey:(NSString *)key error:(NSError * __autoreleasing *)error;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key service:(NSString *)service error:(NSError * __autoreleasing *)error;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup error:(NSError * __autoreleasing *)error;

+ (NSData *)dataForKey:(NSString *)key error:(NSError * __autoreleasing *)error;
+ (NSData *)dataForKey:(NSString *)key service:(NSString *)service error:(NSError * __autoreleasing *)error;
+ (NSData *)dataForKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup error:(NSError * __autoreleasing *)error;

+ (BOOL)setData:(NSData *)data forKey:(NSString *)key error:(NSError * __autoreleasing *)error;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key service:(NSString *)service error:(NSError * __autoreleasing *)error;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup error:(NSError * __autoreleasing *)error;

- (BOOL)setString:(NSString *)string forKey:(NSString *)key error:(NSError * __autoreleasing *)error;
- (BOOL)setString:(NSString *)string forKey:(NSString *)key label:(NSString *)label comment:(NSString *)comment error:(NSError * __autoreleasing *)error;

- (BOOL)setData:(NSData *)data forKey:(NSString *)key error:(NSError * __autoreleasing *)error;
- (BOOL)setData:(NSData *)data forKey:(NSString *)key label:(NSString *)label comment:(NSString *)comment error:(NSError * __autoreleasing *)error;

- (NSString *)stringForKey:(NSString *)key error:(NSError * __autoreleasing *)error;
- (NSData *)dataForKey:(NSString *)key error:(NSError * __autoreleasing *)error;

+ (BOOL)removeItemForKey:(NSString *)key error:(NSError * __autoreleasing *)error;
+ (BOOL)removeItemForKey:(NSString *)key service:(NSString *)service error:(NSError * __autoreleasing *)error;
+ (BOOL)removeItemForKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup error:(NSError * __autoreleasing *)error;

+ (BOOL)removeAllItemsWithError:(NSError * __autoreleasing *)error;
+ (BOOL)removeAllItemsForService:(NSString *)service error:(NSError * __autoreleasing *)error;
+ (BOOL)removeAllItemsForService:(NSString *)service accessGroup:(NSString *)accessGroup error:(NSError * __autoreleasing *)error;

- (BOOL)removeItemForKey:(NSString *)key error:(NSError * __autoreleasing *)error;
- (BOOL)removeAllItemsWithError:(NSError * __autoreleasing *)error;

@end

@interface AWSUICKeyChainStore (ForwardCompatibility)

+ (BOOL)setString:(NSString *)value forKey:(NSString *)key genericAttribute:(id)genericAttribute;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key genericAttribute:(id)genericAttribute error:(NSError * __autoreleasing *)error;

+ (BOOL)setString:(NSString *)value forKey:(NSString *)key service:(NSString *)service genericAttribute:(id)genericAttribute;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key service:(NSString *)service genericAttribute:(id)genericAttribute error:(NSError * __autoreleasing *)error;

+ (BOOL)setString:(NSString *)value forKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup genericAttribute:(id)genericAttribute;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup genericAttribute:(id)genericAttribute error:(NSError * __autoreleasing *)error;

+ (BOOL)setData:(NSData *)data forKey:(NSString *)key genericAttribute:(id)genericAttribute;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key genericAttribute:(id)genericAttribute error:(NSError * __autoreleasing *)error;

+ (BOOL)setData:(NSData *)data forKey:(NSString *)key service:(NSString *)service genericAttribute:(id)genericAttribute;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key service:(NSString *)service genericAttribute:(id)genericAttribute error:(NSError * __autoreleasing *)error;

+ (BOOL)setData:(NSData *)data forKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup genericAttribute:(id)genericAttribute;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup genericAttribute:(id)genericAttribute error:(NSError * __autoreleasing *)error;

- (BOOL)setString:(NSString *)string forKey:(NSString *)key genericAttribute:(id)genericAttribute;
- (BOOL)setString:(NSString *)string forKey:(NSString *)key genericAttribute:(id)genericAttribute error:(NSError * __autoreleasing *)error;

- (BOOL)setData:(NSData *)data forKey:(NSString *)key genericAttribute:(id)genericAttribute;
- (BOOL)setData:(NSData *)data forKey:(NSString *)key genericAttribute:(id)genericAttribute error:(NSError * __autoreleasing *)error;

@end

@interface AWSUICKeyChainStore (Deprecation)

- (void)synchronize __attribute__((deprecated("calling this method is no longer required")));
- (BOOL)synchronizeWithError:(NSError *__autoreleasing *)error __attribute__((deprecated("calling this method is no longer required")));

@end
