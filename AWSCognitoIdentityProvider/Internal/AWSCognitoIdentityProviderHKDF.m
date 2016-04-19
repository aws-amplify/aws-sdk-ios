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

#import "AWSCognitoIdentityProviderHKDF.h"

#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonKeyDerivation.h>
#import <CommonCrypto/CommonDigest.h>


@interface AWSCognitoIdentityProviderHKDF ()
+ (NSData*)extractWithInputKeyingMaterial:(NSData*)ikm salt:(NSData*)salt;
+ (NSData*)expand:(NSData*)prk info:(NSData*)info outputLength:(NSUInteger)outputLength;
@end

//https://tools.ietf.org/html/rfc5869
@implementation AWSCognitoIdentityProviderHKDF

+ (NSData*)deriveKeyWithInputKeyingMaterial:(NSData*)ikm salt:(NSData*)salt info:(NSData*)info outputLength:(NSUInteger)outputLength {
    NSData *prk = [self extractWithInputKeyingMaterial:ikm salt:salt];
    return [self expand:prk info:info outputLength:outputLength];
}

+ (NSData*)extractWithInputKeyingMaterial:(NSData*)ikm salt:(NSData*)salt {
    uint8_t output[CC_SHA256_DIGEST_LENGTH] = {0};
    
    CCHmac(kCCHmacAlgSHA256,
           [salt bytes], [salt length],
           [ikm bytes], [ikm length],
           output);
    
    return [NSData dataWithBytes:output length:CC_SHA256_DIGEST_LENGTH];
}

NSData* calculateT(NSData *prk, NSData *previousT, NSData *info, uint8_t i) {
    CCHmacContext ctx;
    CCHmacInit(&ctx, kCCHmacAlgSHA256, [prk bytes], [prk length]);
    CCHmacUpdate(&ctx, [previousT bytes], [previousT length]);
    if (info != nil) {
        CCHmacUpdate(&ctx, [info bytes], [info length]);
    }
    CCHmacUpdate(&ctx, &i, sizeof(uint8_t));
    
    uint8_t output[CC_SHA256_DIGEST_LENGTH];
    CCHmacFinal(&ctx, output);
    
    return [NSData dataWithBytes:output length:sizeof(output)];
}

+ (NSData*)expand:(NSData*)prk info:(NSData*)info outputLength:(NSUInteger)outputLength {
    
    NSUInteger n = (NSUInteger)ceil((double)outputLength / CC_SHA256_DIGEST_LENGTH);
    NSMutableData *outputKeyMaterial = [NSMutableData data];
    
    NSData *previousT = [NSData data];
    for (NSUInteger i = 0; i < n; i++) {
        NSData *T = calculateT(prk, previousT, info, i+1);
        [outputKeyMaterial appendData:T];
        previousT = [T copy];
    }
    return [NSData dataWithData:[outputKeyMaterial subdataWithRange:NSMakeRange(0, outputLength)]];
}

@end


