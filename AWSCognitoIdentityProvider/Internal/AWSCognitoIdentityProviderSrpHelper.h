//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License").
// You may not use this file except in compliance with the
// License. A copy of the License is located at
//
//     http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, express or implied. See the License
// for the specific language governing permissions and
// limitations under the License.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AWSJKBigInteger;

/* State shared between client and server */
@interface AWSCognitoIdentityProviderSrpCommonState : NSObject
- (instancetype)init;
- (instancetype)initN:(AWSJKBigInteger *)N g:(AWSJKBigInteger *)g;
- (instancetype)initN:(AWSJKBigInteger *)N g:(AWSJKBigInteger *)g k:(AWSJKBigInteger *)k;
- (AWSJKBigInteger*)calculateK:(AWSJKBigInteger*)N g:(AWSJKBigInteger*)g;

@property(nonatomic, retain) AWSJKBigInteger *N;
@property(nonatomic, retain) AWSJKBigInteger *g;
@property(nonatomic, retain) AWSJKBigInteger *k;
@end

@interface AWSCognitoIdentityProviderSrpClientState : NSObject
+ (instancetype)clientStateForUserName:(NSString*)userName
                              password:(NSString*)password
                           commonState:(AWSCognitoIdentityProviderSrpCommonState*)commonState;

+ (instancetype)clientStateForUserName:(NSString*)userName
                              password:(NSString*)password
                              privateA:(AWSJKBigInteger*)privateA
                               publicA:(AWSJKBigInteger*)publicA;

@property(nonatomic, strong) NSString *userName;
@property(nonatomic, strong) NSString *password;
@property(nonatomic, strong) AWSJKBigInteger *privateA;
@property(nonatomic, strong) AWSJKBigInteger *publicA;
@property(nonatomic, strong) NSDate* timestamp;
@end


@interface AWSCognitoIdentityProviderSrpServerState : NSObject

+ (instancetype)serverStateForPoolName:(NSString*)poolName
                      publicBHexString:(NSString*)publicBHexString
                         saltHexString:(NSString*)saltHexString
                        derivedKeyInfo:(const NSString*)derivedKeyInfo
                        derivedKeySize:(NSInteger)derivedKeyLength
                    serviceSecretBlock:(NSData*)serviceSecretBlock;

@property(nonatomic, strong) NSString *poolName;
@property(nonatomic, strong) AWSJKBigInteger *publicB;
@property(nonatomic, strong) AWSJKBigInteger *salt;
@property(nonatomic, strong) NSString *derivedKeyInfo;
@property(nonatomic) NSInteger derivedKeyLength;
// Opaque service state pass-through
@property(nonatomic, strong) NSData *serviceSecretBlock;
@end

@interface AWSCognitoIdentityProviderSrpHelper : NSObject

@property(nonatomic, strong) AWSCognitoIdentityProviderSrpCommonState *commonState;
@property(nonatomic, strong) AWSCognitoIdentityProviderSrpClientState *clientState;
@property(nonatomic, strong) AWSCognitoIdentityProviderSrpServerState *serverState;

#pragma mark - Intermediate results
@property(nonatomic, strong) AWSJKBigInteger *x;
@property(nonatomic, strong) AWSJKBigInteger *u;
@property(nonatomic, strong) AWSJKBigInteger *S;
@property(nonatomic, strong) NSData *authenticationKey;

#pragma mark - Generating password verifier
@property(nonatomic, strong) AWSJKBigInteger *salt;
@property(nonatomic, strong) AWSJKBigInteger *v;


+ (instancetype)beginUserAuthentication:(NSString*)userName
                           password:(NSString*)password;

- (instancetype)init:(NSString *)userName password:(NSString *)password;
- (instancetype)initWithClientState:(AWSCognitoIdentityProviderSrpClientState *)clientState;
- (instancetype)initWithPoolName:(NSString *)poolName userName:(NSString *)userName password:(NSString *)password;

- (NSData*)completeAuthentication:(AWSCognitoIdentityProviderSrpServerState*)serverState;

- (AWSJKBigInteger*)calculateS:(AWSCognitoIdentityProviderSrpServerState*)serverState;

- (NSData*)generatePasswordAuthenticationKey;
- (NSData*)generateUserAuthenticationSignature;

+ (NSData*)calculateXHash:(NSString*)userPool userName:(NSString*)userName password:(NSString*)password salt:(AWSJKBigInteger*)salt;
+ (AWSJKBigInteger*) calculateX:(NSString*)userPool userName:(NSString*)userName password:(NSString*)password salt:(AWSJKBigInteger*)salt;

+ (AWSJKBigInteger*) generatePrivateABigInt:(AWSJKBigInteger*)N;
+ (AWSJKBigInteger*) generatePublicABigInt:(AWSJKBigInteger*)privateA N:(AWSJKBigInteger*)N g:(AWSJKBigInteger*)g;
+ (NSString*) generateDateString:(NSDate *)date;

+ (AWSJKBigInteger*) hashSignedBigInts:(NSArray*)bigInts;
+ (AWSJKBigInteger*) hashBigInts:(NSArray*)bigInts;

@end

NS_ASSUME_NONNULL_END
