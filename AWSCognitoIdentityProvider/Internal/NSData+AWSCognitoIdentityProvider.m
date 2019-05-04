//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import "NSData+AWSCognitoIdentityProvider.h"
#import "AWSJKBigInteger.h"

void awsbigint_loadBigInt(){
}

AWSJKBigInteger *unsignedBigIntegerFromNSData(NSData* data) {
    aws_mp_int bigInt;
    aws_mp_init(&bigInt);
    if (data.length > INT_MAX) {
        return nil;
    }
    
    int len = (int)data.length;
    aws_mp_read_unsigned_bin(&bigInt, data.bytes, len);
    
    //bigInt is copied
    AWSJKBigInteger *result = [[AWSJKBigInteger alloc] initWithValue:&bigInt];
    aws_mp_clear(&bigInt);
    
    return result;
}

AWSJKBigInteger *signedBigIntegerFromNSData(NSData* data) {
    
    AWSJKBigInteger *twosComplementMinusOneMaybe = nil;
    unsigned long bufferLength = data.length + 1;
    uint8_t *bytes = malloc(sizeof(uint8_t) * bufferLength);
    if (bytes == NULL) {
        // this situation is irrecoverable and we don't want to return something corrupted, so we raise an exception (avoiding NSAssert that may be disabled)
        [NSException raise:@"NSInternalInconsistencyException" format:@"failed malloc" arguments:nil];
        return nil;
    }
    
    memcpy(bytes+1, data.bytes, data.length);
    
    bytes[0] = (bytes[1] & 0x80) == 0x80;
    if (bytes[0]) { //two's complement; need to convert to unsigned
        twosComplementMinusOneMaybe = [[AWSJKBigInteger alloc] initWithString:@"-1"];
        
        for( int i = 1; i < bufferLength; i++) {
            bytes[i] = ~bytes[i];
        }
    } else {
        twosComplementMinusOneMaybe = [[AWSJKBigInteger alloc] initWithString:@"0"];
    }

    aws_mp_int hashBigInt;
    aws_mp_init(&hashBigInt);
    aws_mp_read_signed_bin(&hashBigInt, bytes, (int)data.length);
    
    AWSJKBigInteger *result = [[AWSJKBigInteger alloc] initWithValue:&hashBigInt];
    result = [result add:twosComplementMinusOneMaybe];
    aws_mp_clear(&hashBigInt);
    free(bytes);
    return result;
}

@implementation NSData (NSDataBigInteger)
+ (NSData*) aws_dataWithBigInteger:(AWSJKBigInteger *)bigInteger {
    unsigned int byteCount = [bigInteger countBytes];
    if (byteCount == 0) {
        return [NSData data];
    }
    uint8_t *bytes = malloc(byteCount);
    if (bytes == NULL) {
        // this situation is irrecoverable and we don't want to return something corrupted, so we raise an exception (avoiding NSAssert that may be disabled)
        [NSException raise:@"NSInternalInconsistencyException" format:@"failed malloc" arguments:nil];
        return nil;
    }
    
    [bigInteger toByteArrayUnsigned:bytes];
    NSData *dataBigInt = [NSData dataWithBytes:bytes length:byteCount];
    free(bytes);
    
    return dataBigInt;
}

+ (NSData*) aws_dataWithSignedBigInteger:(AWSJKBigInteger *)bigInteger {
 
    unsigned int byteCount = [bigInteger countBytes];
    
    // +1 for sign byte
    uint8_t *bytes = malloc(byteCount + 1);
    if (bytes == NULL) {
        // this situation is irrecoverable and we don't want to return something corrupted, so we raise an exception (avoiding NSAssert that may be disabled)
        [NSException raise:@"NSInternalInconsistencyException" format:@"failed malloc" arguments:nil];
        return nil;
    }
    
    [bigInteger toByteArraySigned:bytes];
    
    NSData *dataBigInt = nil;
    
    if (byteCount > 1 && bytes[0] == 1) {
        //two's complement
        AWSJKBigInteger *modifier = [[AWSJKBigInteger alloc] initWithString:@"1"];
        for (unsigned int i = 1; i < byteCount + 1; i++) {
            bytes[i] = ~bytes[i];
        }

        dataBigInt = [NSData dataWithBytes:bytes+1 length:byteCount];
        AWSJKBigInteger *temp = [dataBigInt aws_toBigInt];
        temp = [temp add:modifier];
        return [NSData aws_dataWithBigInteger:temp];

    } else if (byteCount > 1 && ((bytes[1] & 0x80) == 0x80)) {
        //if we have a positive number but the msb is set, make sure we allow the 0-sign byte to be serialized
        dataBigInt = [NSData dataWithBytes:bytes length:byteCount + 1];
    } else {
        //we don't need the extra 0 to make Java happy
        dataBigInt = [NSData dataWithBytes:bytes+1 length:byteCount];
    }
    free(bytes);

    return dataBigInt;
}

- (AWSJKBigInteger *)aws_toBigInt {
    return unsignedBigIntegerFromNSData(self);
}

- (AWSJKBigInteger *)aws_toSignedBigInt {
    return signedBigIntegerFromNSData(self);
}

+ (NSData*) aws_dataFromHexString:(NSString*)hexString {
    hexString = [[hexString lowercaseString] stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    NSData *hexStrData = [hexString dataUsingEncoding:NSASCIIStringEncoding];
    NSUInteger len = [hexStrData length];
    if (len % 2 != 0) {
        return nil;
    }
    
    NSUInteger outputLen = len / 2;
    if (outputLen == 0) {
        return [NSData data];
    }
    uint8_t *output = malloc(sizeof(uint8_t) * outputLen);
    if (output == NULL) {
        // this situation is irrecoverable and we don't want to return something corrupted, so we raise an exception (avoiding NSAssert that may be disabled)
        [NSException raise:@"NSInternalInconsistencyException" format:@"failed malloc" arguments:nil];
        return nil;
    }
    
    const char *hexBytes = (const char*)[hexStrData bytes];
    for (NSUInteger i = 0, j=0; i < len && j < outputLen; i += 2, j++) {
        unsigned res;
        sscanf(hexBytes+i, "%2x", &res);
        output[j] = (uint8_t) (res & 0xff);
    }
    
    return [NSData dataWithBytesNoCopy:output length:outputLen freeWhenDone:YES];
}

@end
