//
//  NSValueTransformer+MTLPredefinedTransformerAdditions.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2012-09-27.
//  Copyright (c) 2012 GitHub. All rights reserved.
//

#import "NSValueTransformer+AWSMTLPredefinedTransformerAdditions.h"
#import "AWSMTLJSONAdapter.h"
#import "AWSMTLModel.h"
#import "AWSMTLValueTransformer.h"

void awsmtl_loadMTLPredefinedTransformerAdditions(){
}

NSString * const AWSMTLURLValueTransformerName = @"AWSMTLURLValueTransformerName";
NSString * const AWSMTLBooleanValueTransformerName = @"AWSMTLBooleanValueTransformerName";

@implementation NSValueTransformer (AWSMTLPredefinedTransformerAdditions)

#pragma mark Category Loading

+ (void)load {
	@autoreleasepool {
		AWSMTLValueTransformer *URLValueTransformer = [AWSMTLValueTransformer
			reversibleTransformerWithForwardBlock:^ id (NSString *str) {
				if (![str isKindOfClass:NSString.class]) return nil;
				return [NSURL URLWithString:str];
			}
			reverseBlock:^ id (NSURL *URL) {
				if (![URL isKindOfClass:NSURL.class]) return nil;
				return URL.absoluteString;
			}];
		
		[NSValueTransformer setValueTransformer:URLValueTransformer forName:AWSMTLURLValueTransformerName];

		AWSMTLValueTransformer *booleanValueTransformer = [AWSMTLValueTransformer
			reversibleTransformerWithBlock:^ id (NSNumber *boolean) {
				if (![boolean isKindOfClass:NSNumber.class]) return nil;
				return (NSNumber *)(boolean.boolValue ? kCFBooleanTrue : kCFBooleanFalse);
			}];

		[NSValueTransformer setValueTransformer:booleanValueTransformer forName:AWSMTLBooleanValueTransformerName];
	}
}

#pragma mark Customizable Transformers

+ (NSValueTransformer *)awsmtl_JSONDictionaryTransformerWithModelClass:(Class)modelClass {
	NSParameterAssert([modelClass isSubclassOfClass:AWSMTLModel.class]);
	NSParameterAssert([modelClass conformsToProtocol:@protocol(AWSMTLJSONSerializing)]);

	return [AWSMTLValueTransformer
		reversibleTransformerWithForwardBlock:^ id (id JSONDictionary) {
			if (JSONDictionary == nil) return nil;

			NSAssert([JSONDictionary isKindOfClass:NSDictionary.class], @"Expected a dictionary, got: %@", JSONDictionary);

			return [AWSMTLJSONAdapter modelOfClass:modelClass fromJSONDictionary:JSONDictionary error:NULL];
		}
		reverseBlock:^ id (id model) {
			if (model == nil) return nil;

			NSAssert([model isKindOfClass:AWSMTLModel.class], @"Expected a MTLModel object, got %@", model);
			NSAssert([model conformsToProtocol:@protocol(AWSMTLJSONSerializing)], @"Expected a model object conforming to <MTLJSONSerializing>, got %@", model);

			return [AWSMTLJSONAdapter JSONDictionaryFromModel:model];
		}];
}

+ (NSValueTransformer *)awsmtl_JSONArrayTransformerWithModelClass:(Class)modelClass {
	NSValueTransformer *dictionaryTransformer = [self awsmtl_JSONDictionaryTransformerWithModelClass:modelClass];

	return [AWSMTLValueTransformer
		reversibleTransformerWithForwardBlock:^ id (NSArray *dictionaries) {
			if (dictionaries == nil) return nil;

			NSAssert([dictionaries isKindOfClass:NSArray.class], @"Expected an array of dictionaries, got: %@", dictionaries);

			NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictionaries.count];
			for (id JSONDictionary in dictionaries) {
				if (JSONDictionary == NSNull.null) {
					[models addObject:NSNull.null];
					continue;
				}

				NSAssert([JSONDictionary isKindOfClass:NSDictionary.class], @"Expected a dictionary or an NSNull, got: %@", JSONDictionary);

				id model = [dictionaryTransformer transformedValue:JSONDictionary];
				if (model == nil) continue;

				[models addObject:model];
			}

			return models;
		}
		reverseBlock:^ id (NSArray *models) {
			if (models == nil) return nil;

			NSAssert([models isKindOfClass:NSArray.class], @"Expected an array of MTLModels, got: %@", models);

			NSMutableArray *dictionaries = [NSMutableArray arrayWithCapacity:models.count];
			for (id model in models) {
				if (model == NSNull.null) {
					[dictionaries addObject:NSNull.null];
					continue;
				}

				NSAssert([model isKindOfClass:AWSMTLModel.class], @"Expected an MTLModel or an NSNull, got: %@", model);

				NSDictionary *dict = [dictionaryTransformer reverseTransformedValue:model];
				if (dict == nil) continue;

				[dictionaries addObject:dict];
			}

			return dictionaries;
		}];
}

+ (NSValueTransformer *)awsmtl_valueMappingTransformerWithDictionary:(NSDictionary *)dictionary {
	return [self awsmtl_valueMappingTransformerWithDictionary:dictionary defaultValue:nil reverseDefaultValue:nil];
}

+ (NSValueTransformer *)awsmtl_valueMappingTransformerWithDictionary:(NSDictionary *)dictionary defaultValue:(id)defaultValue reverseDefaultValue:(id)reverseDefaultValue {
	NSParameterAssert(dictionary != nil);
	NSParameterAssert(dictionary.count == [[NSSet setWithArray:dictionary.allValues] count]);

	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^(id<NSCopying> key) {
		return dictionary[key ?: NSNull.null] ?: defaultValue;
	} reverseBlock:^(id object) {
		__block id result = nil;
		[dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id anObject, BOOL *stop) {
			if ([object isEqual:anObject]) {
				result = key;
				*stop = YES;
			}
		}];
		return result ?: reverseDefaultValue;
	}];
}

+ (NSValueTransformer *)awsmtl_NSInputStreamValueTransformerWithData:(NSData *)data{
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^(NSData *data) {
         return [[NSInputStream alloc]initWithData:data];
    } reverseBlock:^(NSInputStream *object) {
        return object;
    }];
}

@end
