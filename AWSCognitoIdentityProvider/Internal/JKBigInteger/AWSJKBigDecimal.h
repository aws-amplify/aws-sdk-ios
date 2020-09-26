//
//  AWSJKBigDecimal.h
//  AWSJKBigInteger
//
//  Created by Midfar Sun on 5/4/15.
//  Copyright (c) 2015 Midfar Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWSJKBigInteger.h"

@interface AWSJKBigDecimal : NSObject <NSSecureCoding>

@property(nonatomic, retain)AWSJKBigInteger *bigInteger;
@property(nonatomic, assign)NSUInteger figure;//小数位数

+ (id)decimalWithString:(NSString *)string;
- (id)initWithString:(NSString *)string;

- (id)add:(AWSJKBigDecimal *)bigDecimal;
- (id)subtract:(AWSJKBigDecimal *)bigDecimal;
- (id)multiply:(AWSJKBigDecimal *)bigDecimal;
- (id)divide:(AWSJKBigDecimal *)bigDecimal;

- (id)remainder:(AWSJKBigDecimal *)bigInteger;
//- (NSArray *)divideAndRemainder:(AWSJKBigDecimal *)bigInteger;

- (NSComparisonResult) compare:(AWSJKBigDecimal *)other;
- (id)pow:(unsigned int)exponent;

- (id)negate;
- (id)abs;

- (NSString *)stringValue;

- (NSString *)description;

@end
