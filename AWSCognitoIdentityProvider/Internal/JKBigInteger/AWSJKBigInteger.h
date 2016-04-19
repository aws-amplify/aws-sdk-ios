//
//  AWSJKBigInteger.h
//  AWSJKBigInteger
//
//  Created by Jānis Kiršteins on 5/21/13.
//  Copyright (c) 2013 Jānis Kiršteins. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "aws_tommath.h"

@interface AWSJKBigInteger : NSObject <NSCoding>

- (id)initWithValue:(aws_mp_int *)value;
- (aws_mp_int *)value;

- (id)initWithUnsignedLong:(unsigned long)ul;
- (id)initWithString:(NSString *)string;
- (id)initWithString:(NSString *)string andRadix:(int)radix;
- (id)initWithCString:(char *)cString;
- (id)initWithCString:(char *)cString andRadix:(int)radix;

- (id)add:(AWSJKBigInteger *)bigInteger;
- (id)subtract:(AWSJKBigInteger *)bigInteger;
- (id)multiply:(AWSJKBigInteger *)bigInteger;
- (id)divide:(AWSJKBigInteger *)bigInteger;

- (id)remainder:(AWSJKBigInteger *)bigInteger;
- (NSArray *)divideAndRemainder:(AWSJKBigInteger *)bigInteger;

- (id)pow:(unsigned int)exponent;
- (id)pow:(AWSJKBigInteger*)exponent andMod:(AWSJKBigInteger*)modulus;
- (id)negate;
- (id)abs;

- (id)bitwiseXor:(AWSJKBigInteger *)bigInteger;
- (id)bitwiseOr:(AWSJKBigInteger *)bigInteger;
- (id)bitwiseAnd:(AWSJKBigInteger *)bigInteger;
- (id)shiftLeft:(unsigned int)n;
- (id)shiftRight:(unsigned int)n;

- (id)gcd:(AWSJKBigInteger *)bigInteger;

- (NSComparisonResult) compare:(AWSJKBigInteger *)bigInteger;

- (unsigned long)unsignedIntValue;
- (NSString *)stringValue;
- (NSString *)stringValueWithRadix:(int)radix;

- (NSString *)description;

- (unsigned int)countBytes;
- (void)toByteArraySigned: (unsigned char*) byteArray;
- (void)toByteArrayUnsigned: (unsigned char*) byteArray;

@end
