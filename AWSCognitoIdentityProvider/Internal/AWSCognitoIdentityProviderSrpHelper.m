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

#import "AWSCognitoIdentityProviderSrpHelper.h"
#import "AWSCognitoIdentityProviderHKDF.h"
#import "AWSJKBigInteger.h"
#import "AWSCocoaLumberjack.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonKeyDerivation.h>
#import <CommonCrypto/CommonDigest.h>
#import <errno.h>

#import "NSData+AWSCognitoIdentityProvider.h"

void updateHashWithUnsignedBigInt(CC_SHA256_CTX *ctx, AWSJKBigInteger *bigInt, uint8_t *buffer, size_t bufferSize);
void updateHashWithSignedBigInt(CC_SHA256_CTX *ctx, AWSJKBigInteger *bigInt, uint8_t *buffer, size_t bufferSize);
AWSJKBigInteger* finalizeUnsignedBigIntHash(CC_SHA256_CTX *ctx);
AWSJKBigInteger* finalizeSignedBigIntHash(CC_SHA256_CTX *ctx);

static NSString* N_IN_HEX = @"FFFFFFFFFFFFFFFFC90FDAA22168C234C4C6628B80DC1CD129024E088A67CC74020BBEA63B139B22514A08798E3404DDEF9519B3CD3A431B302B0A6DF25F14374FE1356D6D51C245E485B576625E7EC6F44C42E9A637ED6B0BFF5CB6F406B7EDEE386BFB5A899FA5AE9F24117C4B1FE649286651ECE45B3DC2007CB8A163BF0598DA48361C55D39A69163FA8FD24CF5F83655D23DCA3AD961C62F356208552BB9ED529077096966D670C354E4ABC9804F1746C08CA18217C32905E462E36CE3BE39E772C180E86039B2783A2EC07A28FB5C55DF06F4C52C9DE2BCBF6955817183995497CEA956AE515D2261898FA051015728E5A8AAAC42DAD33170D04507A33A85521ABDF1CBA64ECFB850458DBEF0A8AEA71575D060C7DB3970F85A6E1E4C7ABF5AE8CDB0933D71E8C94E04A25619DCEE3D2261AD2EE6BF12FFA06D98A0864D87602733EC86A64521F2B18177B200CBBE117577A615D6C770988C0BAD946E208E24FA074E5AB3143DB5BFCE0FD108E4B82D120A93AD2CAFFFFFFFFFFFFFFFF";

#pragma mark - Srp State
@implementation AWSCognitoIdentityProviderSrpCommonState
- (instancetype)init {
    if (self = [super init]) {
            self.N = [[AWSJKBigInteger alloc] initWithString:N_IN_HEX
                                               andRadix:16];

            self.g = [[AWSJKBigInteger alloc] initWithUnsignedLong:2l];
            self.k = [self calculateK:self.N g:self.g];
    }
    return self;
}

- (instancetype)initN:(AWSJKBigInteger *)N g:(AWSJKBigInteger *)g k:(AWSJKBigInteger *)k {
    if (self = [super init]) {
        self.N = N;
        self.g = g;
        self.k = k;
    }
    return self;
}

- (instancetype)initN:(AWSJKBigInteger *)N g:(AWSJKBigInteger *)g {
    if (self = [super init]) {
        self.N = N;
        self.g = g;
        self.k = [self calculateK:self.N g:self.g];
    }
    return self;
}

- (AWSJKBigInteger*)calculateK:(AWSJKBigInteger*)N g:(AWSJKBigInteger*)g {

    // + 1 to allow for a sign byte
    unsigned int maxNumBytes = [N countBytes] + 1;

    uint8_t *bytes = malloc(sizeof(uint8_t) * maxNumBytes);

    CC_SHA256_CTX ctx;
    CC_SHA256_Init(&ctx);
    updateHashWithSignedBigInt(&ctx, N, bytes, maxNumBytes);
    updateHashWithUnsignedBigInt(&ctx, g, bytes, maxNumBytes);

    free(bytes);

    return finalizeUnsignedBigIntHash(&ctx);
}
@end

@implementation AWSCognitoIdentityProviderSrpClientState

+ (instancetype)clientStateForUserName:(NSString*)userName
                              password:(NSString*)password
                           commonState:(AWSCognitoIdentityProviderSrpCommonState *)commonState {

    AWSCognitoIdentityProviderSrpClientState* me = [[AWSCognitoIdentityProviderSrpClientState alloc] init];
    me.userName = userName;
    me.password = password;

    me.privateA = [AWSCognitoIdentityProviderSrpHelper
            generatePrivateABigInt:commonState.N];

    me.publicA = [AWSCognitoIdentityProviderSrpHelper
            generatePublicABigInt:me.privateA
                                N:commonState.N
                                g:commonState.g];

    me.timestamp = [NSDate date];
    return me;
}
+ (instancetype)clientStateForUserName:(NSString *)userName
                              password:(NSString*)password
                              privateA:(AWSJKBigInteger*)privateA
                               publicA:(AWSJKBigInteger*)publicA {

    AWSCognitoIdentityProviderSrpClientState* me = [[AWSCognitoIdentityProviderSrpClientState alloc] init];
    me.userName = userName;
    me.password = password;
    me.privateA = privateA;
    me.publicA = publicA;
    me.timestamp = [NSDate date];
    return me;
}

@end

@implementation AWSCognitoIdentityProviderSrpServerState
+ (instancetype)serverStateForPoolName:(NSString*)poolName
                            publicBHexString:(NSString*)publicBHexString
                               saltHexString:(NSString*)saltHexString
                         derivedKeyInfo:(NSString*)derivedKeyInfo
                        derivedKeySize:(NSInteger)derivedKeyLength
                     serviceSecretBlock:(NSData*)serviceSecretBlock {
    
    AWSCognitoIdentityProviderSrpServerState *serverState =[[AWSCognitoIdentityProviderSrpServerState alloc] init];
    
    serverState.poolName = poolName;
    serverState.publicB = [[AWSJKBigInteger alloc] initWithString:publicBHexString andRadix:16];
    serverState.salt = [[AWSJKBigInteger alloc] initWithString:saltHexString andRadix:16];
    serverState.derivedKeyInfo = derivedKeyInfo;
    serverState.derivedKeyLength = derivedKeyLength;
    serverState.serviceSecretBlock = serviceSecretBlock;
    
    return serverState;
}
@end

#pragma mark - Srp Helper

@implementation AWSCognitoIdentityProviderSrpHelper {
}

#pragma mark - Static Factory Initializers
// Step 1 (or an initializer)
+ (instancetype)beginUserAuthentication:(NSString*)userName
                           password:(NSString*)password {
    return [[AWSCognitoIdentityProviderSrpHelper alloc]
                init:userName
                password:password
            ];
}

#pragma mark - Initializers
- (instancetype) init:(NSString*)userName
             password:(NSString*)password  {
    if (self = [super init]) {
        self.commonState = [[AWSCognitoIdentityProviderSrpCommonState alloc] init];

        AWSJKBigInteger *privateA = [AWSCognitoIdentityProviderSrpHelper generatePrivateABigInt:self.commonState.N];
        AWSJKBigInteger *publicA = [AWSCognitoIdentityProviderSrpHelper generatePublicABigInt:privateA N:self.commonState.N g:self.commonState.g];

        self.clientState = [AWSCognitoIdentityProviderSrpClientState
                clientStateForUserName:userName password:password privateA:privateA publicA:publicA];
    }
    return self;
}

- (instancetype)initWithClientState:(AWSCognitoIdentityProviderSrpClientState *)clientState {
    if (self = [super init]) {
        self.commonState = [[AWSCognitoIdentityProviderSrpCommonState alloc] init];
        self.clientState = clientState;
    }
    return self;
}

- (instancetype)initWithPoolName:(NSString *)poolName userName:(NSString *)userName password:(NSString *)password {
    if (self = [super init]) {
        self.salt = [AWSCognitoIdentityProviderSrpHelper generateRandomUnsignedBigInt:128];
 
        AWSJKBigInteger *x = [AWSCognitoIdentityProviderSrpHelper
                              calculateX:poolName
                              userName:userName
                              password:password
                              salt:self.salt];

        AWSJKBigInteger *N = [[AWSJKBigInteger alloc] initWithString:N_IN_HEX
                                       andRadix:16];
        AWSJKBigInteger *g = [[AWSJKBigInteger alloc] initWithUnsignedLong:2l];
        
        //calculate v
        self.v = [g pow:x andMod:N];
    }
    return self;
}

// Step 2
#pragma mark - Compute
- (NSData*)completeAuthentication:(AWSCognitoIdentityProviderSrpServerState*)serverState {
    self.serverState = serverState;
    self.S = [self calculateS:serverState];
    [self generatePasswordAuthenticationKey];
    return [self generateUserAuthenticationSignature];
}

#pragma mark - Helpers
+ (AWSJKBigInteger *)generateRandomUnsignedBigInt:(size_t)bitLength {
    size_t aBitLength = bitLength;
    size_t aByteLength = aBitLength/8;
    uint8_t *aBytes = malloc(aByteLength);
    int functionExitCode = SecRandomCopyBytes(kSecRandomDefault, aByteLength, aBytes);
    if (functionExitCode < 0) {
        AWSDDLogError(@"SecRandomCopyBytes failed with error code %d: %s", errno, strerror(errno));
    }

    aws_mp_int random;
    aws_mp_init(&random);
    aws_mp_read_unsigned_bin(&random, aBytes, (int)aByteLength);

    //random is copied
    AWSJKBigInteger *result = [[AWSJKBigInteger alloc] initWithValue:&random];
    aws_mp_clear(&random);
    free(aBytes);

    return result;
}

- (NSData*) generateUserAuthenticationSignature {

    NSString *dateStr = [AWSCognitoIdentityProviderSrpHelper generateDateString:self.clientState.timestamp];
    NSMutableData *hashOutput = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];

    CCHmacContext ctx;
    CCHmacInit(&ctx, kCCHmacAlgSHA256, self.authenticationKey.bytes, self.authenticationKey.length);
    CCHmacUpdate(&ctx, self.serverState.poolName.UTF8String, (CC_LONG)[self.serverState.poolName lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    CCHmacUpdate(&ctx, self.clientState.userName.UTF8String, (CC_LONG)[self.clientState.userName lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    CCHmacUpdate(&ctx, self.serverState.serviceSecretBlock.bytes, self.serverState.serviceSecretBlock.length);
    CCHmacUpdate(&ctx, dateStr.UTF8String, (CC_LONG)[dateStr lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    CCHmacFinal(&ctx, hashOutput.mutableBytes);

    return [NSData dataWithData:hashOutput];
}

- (NSData*)generatePasswordAuthenticationKey {

    self.authenticationKey = [AWSCognitoIdentityProviderHKDF
            deriveKeyWithInputKeyingMaterial:[NSData aws_dataWithSignedBigInteger:self.S]
                                        salt:[NSData aws_dataWithSignedBigInteger:self.u]
                                        info:[self.serverState.derivedKeyInfo dataUsingEncoding:NSUTF8StringEncoding]
                                outputLength:(NSUInteger) self.serverState.derivedKeyLength];
    
    return self.authenticationKey;
}

- (AWSJKBigInteger*)calculateS:(AWSCognitoIdentityProviderSrpServerState*)serverState {
    // S = ((B-kg^x)^(a+ux))%N

    AWSJKBigInteger *B = serverState.publicB;
    
    self.x = [AWSCognitoIdentityProviderSrpHelper
              calculateX:serverState.poolName
              userName:self.clientState.userName
              password:self.clientState.password
              salt:serverState.salt];
    
    self.u = [AWSCognitoIdentityProviderSrpHelper hashBigInts:@[self.clientState.publicA, B]];

    AWSJKBigInteger *k = self.commonState.k;
    AWSJKBigInteger *g = self.commonState.g;
    AWSJKBigInteger *N = self.commonState.N;

    AWSJKBigInteger *a = self.clientState.privateA;
    AWSJKBigInteger *exp = [a add:[self.u multiply:self.x]];
    AWSJKBigInteger *base = [B subtract:[k multiply:[g pow:self.x andMod:N]]];

    //Need this for negative base #s
    base = [AWSCognitoIdentityProviderSrpHelper mod:base divisor:N];

    AWSJKBigInteger *S = [base pow:exp andMod:N];
    S = [AWSCognitoIdentityProviderSrpHelper mod:S divisor:N];
    
    return S;
}

+ (NSString *)generateDateString:(NSDate *)date {
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = timeZone;
    dateFormatter.dateFormat = @"EEE MMM d HH:mm:ss 'UTC' yyyy";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    return [dateFormatter stringFromDate:date];
}

+ (AWSJKBigInteger*) generatePrivateABigInt:(AWSJKBigInteger*)N {
    //TODO Directory: revisit bits used here. Should match Caldera, and they changed it recently
    return [self mod:[AWSCognitoIdentityProviderSrpHelper generateRandomUnsignedBigInt:256] divisor:N];
}

+ (AWSJKBigInteger*) generatePublicABigInt:(AWSJKBigInteger*)privateA N:(AWSJKBigInteger*)N g:(AWSJKBigInteger*)g {
    AWSJKBigInteger *publicA = [g pow:privateA andMod:N];
    return publicA;
}

+ (AWSJKBigInteger*) mod:(AWSJKBigInteger*)dividend divisor:(AWSJKBigInteger*) divisor {
    return [[divisor add:[dividend remainder:divisor]] remainder:divisor];
}

#pragma mark - Hashing

+ (AWSJKBigInteger*) hashSignedBigInts:(NSArray*)bigInts {
    CC_SHA256_CTX ctx;
    CC_SHA256_Init(&ctx);
    
    for (AWSJKBigInteger *i in bigInts) {
        NSData *data = [NSData aws_dataWithSignedBigInteger:i];
        CC_SHA256_Update(&ctx, data.bytes, (CC_LONG)data.length);        
    }
    
    return finalizeSignedBigIntHash(&ctx);
}

void updateHashWithUnsignedBigInt(CC_SHA256_CTX *ctx, AWSJKBigInteger *bigInt, uint8_t *buffer, size_t bufferSize) {
    unsigned int byteCount = [bigInt countBytes];
    uint8_t *targetBuffer = buffer;
    
    if (byteCount <= bufferSize) {
        targetBuffer = malloc(sizeof(uint8_t) * byteCount);
    }
    
    [bigInt toByteArrayUnsigned:targetBuffer];
    CC_SHA256_Update(ctx, targetBuffer, byteCount);
    
    if (targetBuffer != buffer) {
        free(targetBuffer);
    }
}

void updateHashWithSignedBigInt(CC_SHA256_CTX *ctx, AWSJKBigInteger *bigInt, uint8_t *buffer, size_t bufferSize) {
    // + 1 to allow for a sign byte TODO: add a function to JKBigInteger to provide a countBytesForSigned
    unsigned int byteCount = [bigInt countBytes] + 1;
    uint8_t *targetBuffer = buffer;

    if (byteCount <= bufferSize) {
        targetBuffer = malloc(sizeof(uint8_t) * byteCount);
    }

    [bigInt toByteArraySigned:targetBuffer];
    CC_SHA256_Update(ctx, targetBuffer, byteCount);

    if (targetBuffer != buffer) {
        free(targetBuffer);
    }
}

AWSJKBigInteger* finalizeUnsignedBigIntHash(CC_SHA256_CTX *ctx) {
    uint8_t hash[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256_Final(hash, ctx);

    aws_mp_int hashBigInt;
    aws_mp_init(&hashBigInt);
    aws_mp_read_unsigned_bin(&hashBigInt, hash, CC_SHA256_DIGEST_LENGTH);

    AWSJKBigInteger *result = [[AWSJKBigInteger alloc] initWithValue:&hashBigInt];
    aws_mp_clear(&hashBigInt);

    return result;
}

AWSJKBigInteger* finalizeSignedBigIntHash(CC_SHA256_CTX *ctx) {
    int bufferLength = CC_SHA256_DIGEST_LENGTH+1;
    uint8_t hash[bufferLength];
    // hash goes in [1..CC_SHA256_DIGEST_LENGTH; keep hash[0] for the sign byte required by AWSJKBigInteger
    CC_SHA256_Final(hash+1, ctx);
    
    AWSJKBigInteger *twosComplementMinusOneMaybe = nil;
    hash[0] = (hash[1] & 0x80) == 0x80;
    if (hash[0]) { //two's complement; need to convert to unsigned
        
        twosComplementMinusOneMaybe = [[AWSJKBigInteger alloc] initWithString:@"-1"];
        
        for( int i = 1; i < bufferLength; i++) {
            hash[i] = ~hash[i];
        }
    } else {
        twosComplementMinusOneMaybe = [[AWSJKBigInteger alloc] initWithString:@"0"];
    }
    
    aws_mp_int hashBigInt;
    aws_mp_init(&hashBigInt);
    aws_mp_read_signed_bin(&hashBigInt, hash, bufferLength);
    
    AWSJKBigInteger *result = [[AWSJKBigInteger alloc] initWithValue:&hashBigInt];
    result = [result add:twosComplementMinusOneMaybe];
    
    aws_mp_clear(&hashBigInt);
    
    return result;

}

+ (NSData*)calculateXHash:(NSString*)userPool userName:(NSString*)userName password:(NSString*)password salt:(AWSJKBigInteger*)salt {
    uint8_t identityHash[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256_CTX identityHashCtx;
    CC_SHA256_Init(&identityHashCtx);
    CC_SHA256_Update(&identityHashCtx, [userPool UTF8String], (CC_LONG)[userPool lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    CC_SHA256_Update(&identityHashCtx, [userName UTF8String], (CC_LONG)[userName lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    const uint8_t delim = ':';
    CC_SHA256_Update(&identityHashCtx, &delim, sizeof(delim));
    CC_SHA256_Update(&identityHashCtx, [password UTF8String], (CC_LONG)[password lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    CC_SHA256_Final(identityHash, &identityHashCtx);
    
    NSData *saltData = [NSData aws_dataWithSignedBigInteger:salt];
    
    uint8_t finalHash[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256_CTX ctx;
    CC_SHA256_Init(&ctx);
    CC_SHA256_Update(&ctx, saltData.bytes, (CC_LONG)saltData.length);
    CC_SHA256_Update(&ctx, identityHash, sizeof(identityHash));
    CC_SHA256_Final(finalHash, &ctx);
    return [NSData dataWithBytes:finalHash length:CC_SHA256_DIGEST_LENGTH];
}

+ (AWSJKBigInteger*) calculateX:(NSString*)userPool userName:(NSString*)userName password:(NSString*)password salt:(AWSJKBigInteger*)salt {
    
    uint8_t identityHash[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256_CTX identityHashCtx;
    CC_SHA256_Init(&identityHashCtx);
    CC_SHA256_Update(&identityHashCtx, userPool.UTF8String, (CC_LONG)[userPool lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    CC_SHA256_Update(&identityHashCtx, userName.UTF8String, (CC_LONG)[userName lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    const uint8_t delim = ':';
    CC_SHA256_Update(&identityHashCtx, &delim, sizeof(delim));
    CC_SHA256_Update(&identityHashCtx, password.UTF8String, (CC_LONG)[password lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    CC_SHA256_Final(identityHash, &identityHashCtx);
    
    NSData *saltData = [NSData aws_dataWithSignedBigInteger:salt];
    CC_SHA256_CTX ctx;
    CC_SHA256_Init(&ctx);
    CC_SHA256_Update(&ctx, saltData.bytes, (CC_LONG)saltData.length);
    CC_SHA256_Update(&ctx, identityHash, sizeof(identityHash));
    

    return finalizeUnsignedBigIntHash(&ctx);
}

+ (AWSJKBigInteger*) hashBigInts:(NSArray*)bigInts {
    CC_SHA256_CTX ctx;
    CC_SHA256_Init(&ctx);
    
    for (AWSJKBigInteger *i in bigInts) {
        NSData *data = [NSData aws_dataWithSignedBigInteger:i];
        CC_SHA256_Update(&ctx, data.bytes, (CC_LONG)data.length);
    }
    
    return finalizeUnsignedBigIntHash(&ctx);
}

@end


