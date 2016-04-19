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
    
    uint8_t *bytes = malloc(byteCount);
    if (!bytes) {
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
    if (!bytes) {
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
    uint8_t *output = malloc(sizeof(uint8_t) * outputLen);
    
    const char *hexBytes = (const char*)[hexStrData bytes];
    for (NSUInteger i = 0, j=0; i < len && j < outputLen; i += 2, j++) {
        unsigned res;
        sscanf(hexBytes+i, "%2x", &res);
        output[j] = (uint8_t) (res & 0xff);
    }
    
    return [NSData dataWithBytesNoCopy:output length:outputLen freeWhenDone:YES];
}

@end
