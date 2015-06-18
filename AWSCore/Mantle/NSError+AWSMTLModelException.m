//
//  NSError+MTLModelException.m
//  Mantle
//
//  Created by Robert Böhnke on 7/6/13.
//  Copyright (c) 2013 GitHub. All rights reserved.
//

#import "AWSMTLModel.h"

#import "NSError+AWSMTLModelException.h"

// The domain for errors originating from MTLModel.
static NSString * const AWSMTLModelErrorDomain = @"AWSMTLModelErrorDomain";

// An exception was thrown and caught.
static const NSInteger AWSMTLModelErrorExceptionThrown = 1;

// Associated with the NSException that was caught.
static NSString * const AWSMTLModelThrownExceptionErrorKey = @"AWSMTLModelThrownException";

@implementation NSError (AWSMTLModelException)

+ (instancetype)awsmtl_modelErrorWithException:(NSException *)exception {
	NSParameterAssert(exception != nil);

	NSDictionary *userInfo = @{
		NSLocalizedDescriptionKey: exception.description,
		NSLocalizedFailureReasonErrorKey: exception.reason,
		AWSMTLModelThrownExceptionErrorKey: exception
	};

	return [NSError errorWithDomain:AWSMTLModelErrorDomain code:AWSMTLModelErrorExceptionThrown userInfo:userInfo];
}

@end
