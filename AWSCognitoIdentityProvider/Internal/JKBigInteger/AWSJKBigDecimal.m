//
//  AWSJKBigDecimal.m
//  AWSJKBigInteger
//
//  Created by Midfar Sun on 5/4/15.
//  Copyright (c) 2015 Midfar Sun. All rights reserved.
//

#import "AWSJKBigDecimal.h"

@implementation AWSJKBigDecimal
@synthesize bigInteger, figure;

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (id)init
{
    return [self initWithString:@"0"];
}

- (id)initWithString:(NSString *)string
{
    self = [super init];
    if (self) {
        figure = 0;
        if ([string containsString:@"."]) {
            NSRange range = [string rangeOfString:@"."];
            figure = string.length-range.location-range.length;
            string = [string stringByReplacingCharactersInRange:range withString:@""];
        }
        bigInteger = [[AWSJKBigInteger alloc] initWithString:string];
    }
    return self;
}

+ (id)decimalWithString:(NSString *)string
{
    return [[AWSJKBigDecimal alloc] initWithString:string];
}

-(id)initWithBigInteger:(AWSJKBigInteger *)i figure:(NSInteger)f
{
    self = [super init];
    if (self) {
        bigInteger = i;
        figure = f;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        bigInteger = [[AWSJKBigInteger alloc] initWithCoder:decoder];
        figure = [decoder decodeInt32ForKey:@"AWSJKBigDecimalFigure"];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)encoder
{
    [bigInteger encodeWithCoder:encoder];
    [encoder encodeInteger:figure forKey:@"AWSJKBigDecimalFigure"];
}

- (id)add:(AWSJKBigDecimal *)bigDecimal
{
    NSInteger maxFigure = 0;
    if (figure>=bigDecimal.figure) {
        maxFigure = figure;
        NSInteger exponent = maxFigure-bigDecimal.figure;
        AWSJKBigInteger *mInteger = [[AWSJKBigInteger alloc] initWithString:@"10"];
        AWSJKBigInteger *newInteger = [mInteger pow:(unsigned int)exponent];
        bigDecimal.bigInteger = [bigDecimal.bigInteger multiply:newInteger];
        bigDecimal.figure = maxFigure;
        
    }else{
        maxFigure = bigDecimal.figure;
        NSInteger exponent = maxFigure-figure;
        AWSJKBigInteger *mInteger = [[AWSJKBigInteger alloc] initWithString:@"10"];
        AWSJKBigInteger *newInteger = [mInteger pow:(unsigned int)exponent];
        bigInteger = [bigInteger multiply:newInteger];
        figure = maxFigure;
        
    }
    AWSJKBigInteger *newBigInteger = [bigInteger add:bigDecimal.bigInteger];
    AWSJKBigDecimal *newBigDecimal = [[AWSJKBigDecimal alloc] initWithBigInteger:newBigInteger figure:maxFigure];
    return newBigDecimal;
}

- (id)subtract:(AWSJKBigDecimal *)bigDecimal
{
    NSInteger maxFigure = 0;
    if (figure>=bigDecimal.figure) {
        maxFigure = figure;
        NSInteger exponent = maxFigure-bigDecimal.figure;
        AWSJKBigInteger *mInteger = [[AWSJKBigInteger alloc] initWithString:@"10"];
        AWSJKBigInteger *newInteger = [mInteger pow:(unsigned int)exponent];
        bigDecimal.bigInteger = [bigDecimal.bigInteger multiply:newInteger];
        bigDecimal.figure = maxFigure;
        
    }else{
        maxFigure = bigDecimal.figure;
        NSInteger exponent = maxFigure-figure;
        AWSJKBigInteger *mInteger = [[AWSJKBigInteger alloc] initWithString:@"10"];
        AWSJKBigInteger *newInteger = [mInteger pow:(unsigned int)exponent];
        bigInteger = [bigDecimal.bigInteger multiply:newInteger];
        figure = maxFigure;
        
    }
    AWSJKBigInteger *newBigInteger = [bigInteger subtract:bigDecimal.bigInteger];
    AWSJKBigDecimal *newBigDecimal = [[AWSJKBigDecimal alloc] initWithBigInteger:newBigInteger figure:maxFigure];
    return newBigDecimal;
}

- (id)multiply:(AWSJKBigDecimal *)bigDecimal
{
    NSInteger totalFigure = figure+bigDecimal.figure;
    AWSJKBigInteger *newBigInteger = [bigInteger multiply:bigDecimal.bigInteger];
    AWSJKBigDecimal *newBigDecimal = [[AWSJKBigDecimal alloc] initWithBigInteger:newBigInteger figure:totalFigure];
    return newBigDecimal;
}

- (id)divide:(AWSJKBigDecimal *)bigDecimal
{
    NSInteger totalFigure = figure-bigDecimal.figure;
    if (totalFigure<0) {
        NSInteger exponent = -totalFigure;
        totalFigure=0;
        AWSJKBigInteger *mInteger = [[AWSJKBigInteger alloc] initWithString:@"10"];
        AWSJKBigInteger *newInteger = [mInteger pow:(unsigned int)exponent];
        bigInteger = [bigInteger multiply:newInteger];
    }
    AWSJKBigInteger *newBigInteger = [bigInteger divide:bigDecimal.bigInteger];
    AWSJKBigDecimal *newBigDecimal = [[AWSJKBigDecimal alloc] initWithBigInteger:newBigInteger figure:totalFigure];
    return newBigDecimal;
}

- (id)remainder:(AWSJKBigDecimal *)bigDecimal
{
    NSInteger totalFigure = figure-bigDecimal.figure;
    if (totalFigure<0) {
        NSInteger exponent = -totalFigure;
        totalFigure=0;
        AWSJKBigInteger *mInteger = [[AWSJKBigInteger alloc] initWithString:@"10"];
        AWSJKBigInteger *newInteger = [mInteger pow:(unsigned int)exponent];
        bigInteger = [bigInteger multiply:newInteger];
    }
    AWSJKBigInteger *newBigInteger = [bigInteger remainder:bigDecimal.bigInteger];
    AWSJKBigDecimal *newBigDecimal = [[AWSJKBigDecimal alloc] initWithBigInteger:newBigInteger figure:bigDecimal.figure];
    return newBigDecimal;
}

//- (NSArray *)divideAndRemainder:(AWSJKBigDecimal *)bigInteger
//{
//    
//}

-(NSComparisonResult) compare:(AWSJKBigDecimal *)other {
    AWSJKBigDecimal *tens = [[AWSJKBigDecimal alloc] initWithString:@"10"];
    AWSJKBigInteger *scaledNum;
    AWSJKBigInteger *scaledCompareTo;
    
    if (figure > other.figure){
        tens = [tens pow:(int)figure];
    } else {
        tens = [tens pow:(int)other.figure];
    }
    //scale my value to integer value
    scaledNum = [[AWSJKBigInteger alloc] initWithString:[[self multiply:tens] stringValue]];
    //scale other value to integer
    scaledCompareTo = [[AWSJKBigInteger alloc] initWithString:[[other multiply:tens] stringValue]];
    NSComparisonResult compareBigInteger = [scaledNum compare:scaledCompareTo];
    return compareBigInteger;
}

- (id)pow:(unsigned int)exponent
{
    NSInteger totalFigure = figure*exponent;
    AWSJKBigInteger *newBigInteger = [bigInteger pow:exponent];
    AWSJKBigDecimal *newBigDecimal = [[AWSJKBigDecimal alloc] initWithBigInteger:newBigInteger figure:totalFigure];
    return newBigDecimal;
}

- (id)negate
{
    AWSJKBigInteger *newBigInteger = [bigInteger negate];
    AWSJKBigDecimal *newBigDecimal = [[AWSJKBigDecimal alloc] initWithBigInteger:newBigInteger figure:figure];
    return newBigDecimal;
}

- (id)abs
{
    AWSJKBigInteger *newBigInteger = [bigInteger abs];
    AWSJKBigDecimal *newBigDecimal = [[AWSJKBigDecimal alloc] initWithBigInteger:newBigInteger figure:figure];
    return newBigDecimal;
}

- (NSString *)stringValue
{
    NSString *string = [bigInteger stringValue];
    if (figure==0) {
        return string;
    }
    NSMutableString *mString = [NSMutableString stringWithString:string];
    NSInteger newFigure = string.length-figure;
    while (newFigure<=0) {
        [mString insertString:@"0" atIndex:0];
        newFigure++;
    }
    [mString insertString:@"." atIndex:newFigure];
    return mString;
}

- (NSString *)description
{
    return [self stringValue];
}

@end
