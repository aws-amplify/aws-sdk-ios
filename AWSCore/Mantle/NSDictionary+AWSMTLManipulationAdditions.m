//
//  NSDictionary+MTLManipulationAdditions.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-09-24.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "NSDictionary+AWSMTLManipulationAdditions.h"

@implementation NSDictionary (AWSMTLManipulationAdditions)

- (NSDictionary *)awsmtl_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary {
	NSMutableDictionary *result = [self mutableCopy];
	[result addEntriesFromDictionary:dictionary];
	return result;
}

- (NSDictionary *)awsmtl_dictionaryByRemovingEntriesWithKeys:(NSSet *)keys {
	NSMutableDictionary *result = [self mutableCopy];
	[result removeObjectsForKeys:keys.allObjects];
	return result;
}

@end
