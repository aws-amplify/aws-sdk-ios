//
//  MTLValueTransformer.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-09-11.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "AWSMTLValueTransformer.h"

//
// Any MTLValueTransformer supporting reverse transformation. Necessary because
// +allowsReverseTransformation is a class method.
//
@interface AWSMTLReversibleValueTransformer : AWSMTLValueTransformer
@end

@interface AWSMTLValueTransformer ()

@property (nonatomic, copy, readonly) AWSMTLValueTransformerBlock forwardBlock;
@property (nonatomic, copy, readonly) AWSMTLValueTransformerBlock reverseBlock;

@end

@implementation AWSMTLValueTransformer

#pragma mark Lifecycle

+ (instancetype)transformerWithBlock:(AWSMTLValueTransformerBlock)transformationBlock {
	return [[self alloc] initWithForwardBlock:transformationBlock reverseBlock:nil];
}

+ (instancetype)reversibleTransformerWithBlock:(AWSMTLValueTransformerBlock)transformationBlock {
	return [self reversibleTransformerWithForwardBlock:transformationBlock reverseBlock:transformationBlock];
}

+ (instancetype)reversibleTransformerWithForwardBlock:(AWSMTLValueTransformerBlock)forwardBlock reverseBlock:(AWSMTLValueTransformerBlock)reverseBlock {
	return [[AWSMTLReversibleValueTransformer alloc] initWithForwardBlock:forwardBlock reverseBlock:reverseBlock];
}

- (id)initWithForwardBlock:(AWSMTLValueTransformerBlock)forwardBlock reverseBlock:(AWSMTLValueTransformerBlock)reverseBlock {
	NSParameterAssert(forwardBlock != nil);

	self = [super init];
	if (self == nil) return nil;

	_forwardBlock = [forwardBlock copy];
	_reverseBlock = [reverseBlock copy];

	return self;
}

#pragma mark NSValueTransformer

+ (BOOL)allowsReverseTransformation {
	return NO;
}

+ (Class)transformedValueClass {
	return [NSObject class];
}

- (id)transformedValue:(id)value {
	return self.forwardBlock(value);
}

@end

@implementation AWSMTLReversibleValueTransformer

#pragma mark Lifecycle

- (id)initWithForwardBlock:(AWSMTLValueTransformerBlock)forwardBlock reverseBlock:(AWSMTLValueTransformerBlock)reverseBlock {
	NSParameterAssert(reverseBlock != nil);
	return [super initWithForwardBlock:forwardBlock reverseBlock:reverseBlock];
}

#pragma mark NSValueTransformer

+ (BOOL)allowsReverseTransformation {
	return YES;
}

- (id)reverseTransformedValue:(id)value {
	return self.reverseBlock(value);
}

@end
