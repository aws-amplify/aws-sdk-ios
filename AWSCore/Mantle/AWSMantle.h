//
//  Mantle.h
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-09-04.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for Mantle.
FOUNDATION_EXPORT double AWSMantleVersionNumber;

//! Project version string for Mantle.
FOUNDATION_EXPORT const unsigned char AWSMantleVersionString[];

#import "AWSMTLJSONAdapter.h"
#import "AWSMTLManagedObjectAdapter.h"
#import "AWSMTLModel.h"
#import "AWSMTLModel+NSCoding.h"
#import "AWSMTLValueTransformer.h"
#import "NSArray+AWSMTLManipulationAdditions.h"
#import "NSDictionary+AWSMTLManipulationAdditions.h"
#import "NSObject+AWSMTLComparisonAdditions.h"
#import "NSValueTransformer+AWSMTLInversionAdditions.h"
#import "NSValueTransformer+AWSMTLPredefinedTransformerAdditions.h"
