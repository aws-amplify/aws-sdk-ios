//
//  AWSJKBigInteger.m
//  AWSJKBigInteger
//
//  Created by Jānis Kiršteins on 5/21/13.
//  Copyright (c) 2013 Jānis Kiršteins. All rights reserved.
//
#import "AWSJKBigInteger.h"

@implementation AWSJKBigInteger {
@private
    aws_mp_int m_value;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (id)initWithValue:(aws_mp_int *)value {

    self = [super init];
	
    if (self) {
        aws_mp_init_copy(&m_value, value);
    }
    
    return self;
}

- (aws_mp_int *)value {
    return &m_value;
}

- (id)initWithUnsignedLong:(unsigned long)unsignedLong {

    self = [super init];
    
    if (self) {
        aws_mp_set_int(&m_value, unsignedLong);
    }
    
    return self;
}

- (id)init {
    return [self initWithUnsignedLong:0];
}

- (id)initWithCString:(char *)cString andRadix:(int)radix {

    if (radix < 2 || radix > 64) {
        return nil;
    }
    
    self = [super init];
    
    if (self) {
        aws_mp_init(&m_value);
        int result;
        result = aws_mp_read_radix(&m_value, cString, radix);
        
        if (result != AWS_MP_OKAY) {
            aws_mp_clear(&m_value);
            return nil;
        }
    }
    
    return self;
}
- (id)initWithCString:(char *)cString {
    
    int radix = 10;
    return [self initWithCString:cString andRadix:radix];
}

- (id)initWithString:(NSString *)string andRadix:(int)radix {
    return [self initWithCString:(char *)[string UTF8String] andRadix:radix];
}

- (id)initWithString:(NSString *)string {

    int radix = 10;
    return [self initWithCString:(char *)[string UTF8String] andRadix:radix];
}

- (id)initWithCoder:(NSCoder *)decoder {

    self = [super init];
    
    if (self) {
		int sign = [decoder decodeInt32ForKey:@"AWSJKBigIntegerSign"];
		int alloc = [decoder decodeInt32ForKey:@"AWSJKBigIntegerAlloc"];

        aws_mp_init_size(&m_value, alloc);
		
        NSData *data = (NSData *)[decoder decodeObjectOfClass:[NSData class] forKey:@"AWSJKBigIntegerDP"];
        aws_mp_digit *temp = (aws_mp_digit *)[data bytes];
        
        for (unsigned int i = 0; i < alloc; ++i) {
			m_value.dp[i] = temp[i];
		}
		
		m_value.used = alloc;
		m_value.sign = sign;
    }

    return self;
}
- (void)encodeWithCoder:(NSCoder *)encoder {

    aws_mp_clamp(&m_value);

    NSData *data = [NSData dataWithBytes:(const void *)m_value.dp
                                  length:m_value.alloc * sizeof(aws_mp_digit)];

    [encoder encodeObject:data forKey:@"AWSJKBigIntegerDP"];
    [encoder encodeInteger:m_value.alloc forKey:@"AWSJKBigIntegerAlloc"];
    [encoder encodeInteger:m_value.sign forKey:@"AWSJKBigIntegerSign"];
}

- (id)add:(AWSJKBigInteger *)bigInteger {

    aws_mp_int sum;
    aws_mp_init(&sum);

    aws_mp_add(&m_value, [bigInteger value], &sum);
    
    id newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&sum];
    aws_mp_clear(&sum);
    
    return newBigInteger;
}

- (id)subtract:(AWSJKBigInteger *)bigInteger {

    aws_mp_int difference;
    aws_mp_init(&difference);

    aws_mp_sub(&m_value, [bigInteger value], &difference);
    
    id newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&difference];
    aws_mp_clear(&difference);
    
    return newBigInteger;
}

- (id)multiply:(AWSJKBigInteger *)bigInteger {

    aws_mp_int product;
    aws_mp_init(&product);

    aws_mp_mul(&m_value, [bigInteger value], &product);
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&product];
    aws_mp_clear(&product);
    
    return newBigInteger;
}

- (id)divide:(AWSJKBigInteger *)bigInteger {

    int result;
    aws_mp_int quotient;
    aws_mp_init(&quotient);
    
    result = aws_mp_div(&m_value, [bigInteger value], &quotient, NULL);
    if (result == AWS_MP_VAL) {
        aws_mp_clear(&quotient);
        return nil;
    }
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&quotient];
    aws_mp_clear(&quotient);
    
    return newBigInteger;
}

- (id)remainder:(AWSJKBigInteger *)bigInteger {

    int result;
    aws_mp_int remainder;
    aws_mp_init(&remainder);
    
    result = aws_mp_div(&m_value, [bigInteger value], NULL, &remainder);
    if (result == AWS_MP_VAL) {
        aws_mp_clear(&remainder);
        return nil;
    }
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&remainder];
    aws_mp_clear(&remainder);
    
    return newBigInteger;
}

- (NSArray *)divideAndRemainder:(AWSJKBigInteger *)bigInteger {

    int result;
    aws_mp_int quotient, remainder;
    aws_mp_init_multi(&quotient, &remainder, NULL);
    
    result = aws_mp_div(&m_value, [bigInteger value], &quotient, &remainder);
    if (result == AWS_MP_VAL) {
        aws_mp_clear_multi(&quotient, &remainder, NULL);
        return nil;
    }
    
    AWSJKBigInteger *quotientBigInteger = [[AWSJKBigInteger alloc] initWithValue:&quotient];
    AWSJKBigInteger *remainderBigInteger = [[AWSJKBigInteger alloc] initWithValue:&remainder];
    aws_mp_clear_multi(&quotient, &remainder, NULL);
    
    return @[quotientBigInteger, remainderBigInteger];
}

- (id)pow:(unsigned int)exponent {

    int result;
    aws_mp_int power;
    aws_mp_init(&power);
    
    result = aws_mp_expt_d(&m_value, (aws_mp_digit) exponent, &power);
    if (result == AWS_MP_VAL) {
        aws_mp_clear(&power);
        return nil;
    }
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&power];
    aws_mp_clear(&power);
    
    return newBigInteger;
}

- (id)pow:(AWSJKBigInteger*)exponent andMod: (AWSJKBigInteger*)modulus {

    int result;
    aws_mp_int output;
    aws_mp_init(&output);
    
    result = aws_mp_exptmod(&m_value, &exponent->m_value, &modulus->m_value, &output);
    if (result == AWS_MP_VAL) {
        aws_mp_clear(&output);
        return nil;
    }
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&output];
    aws_mp_clear(&output);
    
    return newBigInteger;
}

- (id)negate {

    aws_mp_int negate;
    aws_mp_init(&negate);
    aws_mp_neg(&m_value, &negate);
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&negate];
    aws_mp_clear(&negate);
    
    return newBigInteger;
}

- (id)abs {

    aws_mp_int absolute;
    aws_mp_init(&absolute);
    aws_mp_abs(&m_value, &absolute);
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&absolute];
    aws_mp_clear(&absolute);
    
    return newBigInteger;
}

- (id)bitwiseXor:(AWSJKBigInteger *)bigInteger {

    aws_mp_int xor;
    aws_mp_init(&xor);
    aws_mp_xor(&m_value, [bigInteger value], &xor);
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&xor];
    aws_mp_clear(&xor);
    
    return newBigInteger;
}

- (id)bitwiseOr:(AWSJKBigInteger *)bigInteger {

    aws_mp_int or;
    aws_mp_init(&or);
    aws_mp_or(&m_value, [bigInteger value], &or);
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&or];
    aws_mp_clear(&or);
    
    return newBigInteger;
}

- (id)bitwiseAnd:(AWSJKBigInteger *)bigInteger {

    aws_mp_int and;
    aws_mp_init(&and);
    aws_mp_and(&m_value, [bigInteger value], &and);
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&and];
    aws_mp_clear(&and);
    
    return newBigInteger;
}

- (id)shiftLeft:(unsigned int)n {

    aws_mp_int lShift;
    aws_mp_init(&lShift);
    aws_mp_mul_2d(&m_value, n, &lShift);
	
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&lShift];
    aws_mp_clear(&lShift);
    
    return newBigInteger;
}

- (id)shiftRight:(unsigned int)n {

    aws_mp_int rShift;
    aws_mp_init(&rShift);
    aws_mp_div_2d(&m_value, n, &rShift, NULL);
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&rShift];
    aws_mp_clear(&rShift);
    
    return newBigInteger;
}
- (id)gcd:(AWSJKBigInteger *)bigInteger {

    int result;
    aws_mp_int gcd;
    aws_mp_init(&gcd);
    
    result = aws_mp_gcd(&m_value, [bigInteger value], &gcd);
    if (result == AWS_MP_VAL) {
        aws_mp_clear(&gcd);
        return nil;
    }
    
    AWSJKBigInteger *newBigInteger = [[AWSJKBigInteger alloc] initWithValue:&gcd];
    aws_mp_clear(&gcd);
    
    return newBigInteger;
}

- (NSComparisonResult) compare:(AWSJKBigInteger *)bigInteger {

    NSComparisonResult comparisonResult;
    comparisonResult = aws_mp_cmp([bigInteger value], &m_value);
    
    switch (comparisonResult) {
        case AWS_MP_GT:
            return NSOrderedAscending;
        case AWS_MP_EQ:
            return NSOrderedSame;
        case AWS_MP_LT:
            return NSOrderedDescending;
        default:
            return 0;
    }
}

- (unsigned long)unsignedIntValue {
    return aws_mp_get_int(&m_value);
}

- (NSString *)stringValue {

    int radix = 10;
    return [self stringValueWithRadix:radix];
}

- (NSString *)stringValueWithRadix:(int)radix {

    int stringSize;
    aws_mp_radix_size(&m_value, radix, &stringSize);
    char cString[stringSize];
    aws_mp_toradix(&m_value, cString, radix);
    
    for (int i = 0; i < stringSize; ++i) {
        cString[i] = (char)tolower(cString[i]);
    }
    
    return [NSString stringWithUTF8String:cString];
}

- (NSString *)description {
    return [self stringValue];
}

- (void)dealloc {
    aws_mp_clear(&m_value);
}

/* Returns the number of bytes required to store this AWSJKBigInteger as binary */
- (unsigned int)countBytes {
    return (unsigned int) aws_mp_unsigned_bin_size(&m_value);
}

/* Retrieves the signed [big endian] format of this AWSJKBigInteger */
- (void)toByteArraySigned: (unsigned char*) byteArray {
    aws_mp_to_signed_bin(&m_value, byteArray);
}

/* Retrieves the unsigned [big endian] format of this AWSJKBigInteger */
- (void)toByteArrayUnsigned: (unsigned char*) byteArray {
    aws_mp_to_unsigned_bin(&m_value, byteArray);
}

@end
