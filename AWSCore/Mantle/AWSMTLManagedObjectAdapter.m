//
//  MTLManagedObjectAdapter.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2013-03-29.
//  Copyright (c) 2013 GitHub. All rights reserved.
//

#import "AWSMTLManagedObjectAdapter.h"
#import "AWSEXTScope.h"
#import "AWSMTLModel.h"
#import "AWSMTLReflection.h"
#import "NSArray+AWSMTLManipulationAdditions.h"

NSString * const AWSMTLManagedObjectAdapterErrorDomain = @"AWSMTLManagedObjectAdapterErrorDomain";
const NSInteger AWSMTLManagedObjectAdapterErrorNoClassFound = 2;
const NSInteger AWSMTLManagedObjectAdapterErrorInitializationFailed = 3;
const NSInteger AWSMTLManagedObjectAdapterErrorInvalidManagedObjectKey = 4;
const NSInteger AWSMTLManagedObjectAdapterErrorUnsupportedManagedObjectPropertyType = 5;
const NSInteger AWSMTLManagedObjectAdapterErrorUnsupportedRelationshipClass = 6;
const NSInteger AWSMTLManagedObjectAdapterErrorUniqueFetchRequestFailed = 7;
const NSInteger AWSMTLManagedObjectAdapterErrorInvalidManagedObjectMapping = 8;

// Performs the given block in the context's queue, if it has one.
static id performInContext(NSManagedObjectContext *context, id (^block)(void)) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
	if (context.concurrencyType == NSConfinementConcurrencyType) {
		return block();
	}
#pragma clang diagnostic pop
	__block id result = nil;
	[context performBlockAndWait:^{
		result = block();
	}];

	return result;
}

@interface AWSMTLManagedObjectAdapter ()

// The MTLModel subclass being serialized or deserialized.
@property (nonatomic, strong, readonly) Class modelClass;

// A cached copy of the return value of +managedObjectKeysByPropertyKey.
@property (nonatomic, copy, readonly) NSDictionary *managedObjectKeysByPropertyKey;

// A cached copy of the return value of +relationshipModelClassesByPropertyKey.
@property (nonatomic, copy, readonly) NSDictionary *relationshipModelClassesByPropertyKey;

// Initializes the receiver to serialize or deserialize a MTLModel of the given
// class.
- (id)initWithModelClass:(Class)modelClass;

// Invoked from +modelOfClass:fromManagedObject:processedObjects:error: after
// the receiver's properties have been initialized.
- (id)modelFromManagedObject:(NSManagedObject *)managedObject processedObjects:(CFMutableDictionaryRef)processedObjects error:(NSError **)error;

// Performs the actual work of deserialization. This method is also invoked when
// processing relationships, to create a new adapter (if needed) to handle them.
//
// `processedObjects` is a dictionary mapping NSManagedObjects to the MTLModels
// that have been created so far. It should remain alive for the full process
// of deserializing the top-level managed object.
+ (id)modelOfClass:(Class)modelClass fromManagedObject:(NSManagedObject *)managedObject processedObjects:(CFMutableDictionaryRef)processedObjects error:(NSError **)error;

// Invoked from
// +managedObjectFromModel:insertingIntoContext:processedObjects:error: after
// the receiver's properties have been initialized.
- (id)managedObjectFromModel:(AWSMTLModel<AWSMTLManagedObjectSerializing> *)model insertingIntoContext:(NSManagedObjectContext *)context processedObjects:(CFMutableDictionaryRef)processedObjects error:(NSError **)error;

// Performs the actual work of serialization. This method is also invoked when
// processing relationships, to create a new adapter (if needed) to handle them.
//
// `processedObjects` is a dictionary mapping MTLModels to the NSManagedObjects
// that have been created so far. It should remain alive for the full process
// of serializing the top-level MTLModel.
+ (id)managedObjectFromModel:(AWSMTLModel<AWSMTLManagedObjectSerializing> *)model insertingIntoContext:(NSManagedObjectContext *)context processedObjects:(CFMutableDictionaryRef)processedObjects error:(NSError **)error;

// Looks up the NSValueTransformer that should be used for any attribute that
// corresponds the given property key.
//
// key - The property key to transform from or to. This argument must not be nil.
//
// Returns a transformer to use, or nil to not transform the property.
- (NSValueTransformer *)entityAttributeTransformerForKey:(NSString *)key;

// Looks up the managed object key that corresponds to the given key.
//
// key - The property key to retrieve the corresponding managed object key for.
//       This argument must not be nil.
//
// Returns a key to use, or nil to omit the property from managed object
// serialization.
- (NSString *)managedObjectKeyForKey:(NSString *)key;

// Looks at propertyKeysForManagedObjectUniquing and forms an NSPredicate
// using the uniquing keys and the provided model.
- (NSPredicate *)uniquingPredicateForModel:(AWSMTLModel<AWSMTLManagedObjectSerializing> *)model;

@end

@implementation AWSMTLManagedObjectAdapter

#pragma mark Lifecycle

- (id)init {
	NSAssert(NO, @"%@ should not be initialized using -init", self.class);
	return nil;
}

- (id)initWithModelClass:(Class)modelClass {
	NSParameterAssert(modelClass != nil);

	self = [super init];
	if (self == nil) return nil;

	_modelClass = modelClass;
	_managedObjectKeysByPropertyKey = [[modelClass managedObjectKeysByPropertyKey] copy];

	if ([modelClass respondsToSelector:@selector(relationshipModelClassesByPropertyKey)]) {
		_relationshipModelClassesByPropertyKey = [[modelClass relationshipModelClassesByPropertyKey] copy];
	}

	return self;
}

#pragma mark Serialization

- (id)modelFromManagedObject:(NSManagedObject *)managedObject processedObjects:(CFMutableDictionaryRef)processedObjects error:(NSError **)error {
	NSParameterAssert(managedObject != nil);
	NSParameterAssert(processedObjects != nil);

	NSEntityDescription *entity = managedObject.entity;
	NSAssert(entity != nil, @"%@ returned a nil +entity", managedObject);

	NSManagedObjectContext *context = managedObject.managedObjectContext;

	NSDictionary *managedObjectProperties = entity.propertiesByName;
	AWSMTLModel *model = [[self.modelClass alloc] init];

	// Pre-emptively consider this object processed, so that we don't get into
	// any cycles when processing its relationships.
	CFDictionaryAddValue(processedObjects, (__bridge void *)managedObject, (__bridge void *)model);

	BOOL (^setValueForKey)(NSString *, id) = ^(NSString *key, id value) {
		// Mark this as being autoreleased, because validateValue may return
		// a new object to be stored in this variable (and we don't want ARC to
		// double-free or leak the old or new values).
		__autoreleasing id replaceableValue = value;
		if (![model validateValue:&replaceableValue forKey:key error:error]) return NO;

		[model setValue:replaceableValue forKey:key];
		return YES;
	};

	for (NSString *propertyKey in [self.modelClass propertyKeys]) {
		NSString *managedObjectKey = [self managedObjectKeyForKey:propertyKey];
		if (managedObjectKey == nil) continue;

		BOOL (^deserializeAttribute)(NSAttributeDescription *) = ^(NSAttributeDescription *attributeDescription) {
			id value = performInContext(context, ^{
				return [managedObject valueForKey:managedObjectKey];
			});

			NSValueTransformer *attributeTransformer = [self entityAttributeTransformerForKey:propertyKey];
			if (attributeTransformer != nil) value = [attributeTransformer reverseTransformedValue:value];

			return setValueForKey(propertyKey, value);
		};

		BOOL (^deserializeRelationship)(NSRelationshipDescription *) = ^(NSRelationshipDescription *relationshipDescription) {
			Class nestedClass = self.relationshipModelClassesByPropertyKey[propertyKey];
			if (nestedClass == nil) {
				[NSException raise:NSInvalidArgumentException format:@"No class specified for decoding relationship at key \"%@\" in managed object %@", managedObjectKey, managedObject];
			}

			if ([relationshipDescription isToMany]) {
				id models = performInContext(context, ^ id {
					id relationshipCollection = [managedObject valueForKey:managedObjectKey];
					NSMutableArray *models = [NSMutableArray arrayWithCapacity:[relationshipCollection count]];

					for (NSManagedObject *nestedObject in relationshipCollection) {
						AWSMTLModel *model = [self.class modelOfClass:nestedClass fromManagedObject:nestedObject processedObjects:processedObjects error:error];
						if (model == nil) return nil;
						
						[models addObject:model];
					}

					return models;
				});

				if (models == nil) return NO;
				if (![relationshipDescription isOrdered]) models = [NSSet setWithArray:models];

				return setValueForKey(propertyKey, models);
			} else {
				NSManagedObject *nestedObject = performInContext(context, ^{
					return [managedObject valueForKey:managedObjectKey];
				});

				if (nestedObject == nil) return YES;

				AWSMTLModel *model = [self.class modelOfClass:nestedClass fromManagedObject:nestedObject processedObjects:processedObjects error:error];
				if (model == nil) return NO;

				return setValueForKey(propertyKey, model);
			}
		};

		BOOL (^deserializeProperty)(NSPropertyDescription *) = ^(NSPropertyDescription *propertyDescription) {
			if (propertyDescription == nil) {
				if (error != NULL) {
					NSString *failureReason = [NSString stringWithFormat:NSLocalizedString(@"No property by name \"%@\" exists on the entity.", @""), managedObjectKey];

					NSDictionary *userInfo = @{
						NSLocalizedDescriptionKey: NSLocalizedString(@"Could not deserialize managed object", @""),
						NSLocalizedFailureReasonErrorKey: failureReason,
					};

					*error = [NSError errorWithDomain:AWSMTLManagedObjectAdapterErrorDomain code:AWSMTLManagedObjectAdapterErrorInvalidManagedObjectKey userInfo:userInfo];
				}

				return NO;
			}

			// Jump through some hoops to avoid referencing classes directly.
			NSString *propertyClassName = NSStringFromClass(propertyDescription.class);
			if ([propertyClassName isEqual:@"NSAttributeDescription"]) {
				return deserializeAttribute((id)propertyDescription);
			} else if ([propertyClassName isEqual:@"NSRelationshipDescription"]) {
				return deserializeRelationship((id)propertyDescription);
			} else {
				if (error != NULL) {
					NSString *failureReason = [NSString stringWithFormat:NSLocalizedString(@"Property descriptions of class %@ are unsupported.", @""), propertyClassName];

					NSDictionary *userInfo = @{
						NSLocalizedDescriptionKey: NSLocalizedString(@"Could not deserialize managed object", @""),
						NSLocalizedFailureReasonErrorKey: failureReason,
					};

					*error = [NSError errorWithDomain:AWSMTLManagedObjectAdapterErrorDomain code:AWSMTLManagedObjectAdapterErrorUnsupportedManagedObjectPropertyType userInfo:userInfo];
				}

				return NO;
			}
		};

		if (!deserializeProperty(managedObjectProperties[managedObjectKey])) return nil;
	}

	return model;
}

+ (id)modelOfClass:(Class)modelClass fromManagedObject:(NSManagedObject *)managedObject error:(NSError **)error {
	NSSet *propertyKeys = [modelClass propertyKeys];

	for (NSString *mappedPropertyKey in [modelClass managedObjectKeysByPropertyKey]) {
		if ([propertyKeys containsObject:mappedPropertyKey]) continue;

		if (error != NULL) {
			NSDictionary *userInfo = @{
				NSLocalizedDescriptionKey: NSLocalizedString(@"Invalid entity attribute mapping", nil),
				NSLocalizedFailureReasonErrorKey: [NSString stringWithFormat:NSLocalizedString(@"%1$@ could not be parsed because its entity attribute mapping contains illegal property keys.", nil), modelClass]
			};

			*error = [NSError errorWithDomain:AWSMTLManagedObjectAdapterErrorDomain code:AWSMTLManagedObjectAdapterErrorInvalidManagedObjectMapping userInfo:userInfo];
		}

		return nil;
	}

	CFMutableDictionaryRef processedObjects = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
	if (processedObjects == NULL) return nil;

	@onExit {
		CFRelease(processedObjects);
	};

	return [self modelOfClass:modelClass fromManagedObject:managedObject processedObjects:processedObjects error:error];
}

+ (id)modelOfClass:(Class)modelClass fromManagedObject:(NSManagedObject *)managedObject processedObjects:(CFMutableDictionaryRef)processedObjects error:(NSError **)error {
	NSParameterAssert(modelClass != nil);
	NSParameterAssert(processedObjects != nil);

	if (managedObject == nil) return nil;

	const void *existingModel = CFDictionaryGetValue(processedObjects, (__bridge void *)managedObject);
	if (existingModel != NULL) {
		return (__bridge id)existingModel;
	}

	if ([modelClass respondsToSelector:@selector(classForDeserializingManagedObject:)]) {
		modelClass = [modelClass classForDeserializingManagedObject:managedObject];
		if (modelClass == nil) {
			if (error != NULL) {
				NSDictionary *userInfo = @{
					NSLocalizedDescriptionKey: NSLocalizedString(@"Could not deserialize managed object", @""),
					NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"No model class could be found to deserialize the object.", @"")
				};

				*error = [NSError errorWithDomain:AWSMTLManagedObjectAdapterErrorDomain code:AWSMTLManagedObjectAdapterErrorNoClassFound userInfo:userInfo];
			}

			return nil;
		}
	}

	AWSMTLManagedObjectAdapter *adapter = [[self alloc] initWithModelClass:modelClass];
	return [adapter modelFromManagedObject:managedObject processedObjects:processedObjects error:error];
}

- (id)managedObjectFromModel:(AWSMTLModel<AWSMTLManagedObjectSerializing> *)model insertingIntoContext:(NSManagedObjectContext *)context processedObjects:(CFMutableDictionaryRef)processedObjects error:(NSError **)error {
	NSParameterAssert(model != nil);
	NSParameterAssert(context != nil);
	NSParameterAssert(processedObjects != nil);

	NSString *entityName = [model.class managedObjectEntityName];
	NSAssert(entityName != nil, @"%@ returned a nil +managedObjectEntityName", model.class);

	Class entityDescriptionClass = NSClassFromString(@"NSEntityDescription");
	NSAssert(entityDescriptionClass != nil, @"CoreData.framework must be linked to use MTLManagedObjectAdapter");

	Class fetchRequestClass = NSClassFromString(@"NSFetchRequest");
	NSAssert(fetchRequestClass != nil, @"CoreData.framework must be linked to use MTLManagedObjectAdapter");

	// If a uniquing predicate is provided, perform a fetch request to guarantee a unique managed object.
	__block NSManagedObject *managedObject = nil;
	NSPredicate *uniquingPredicate = [self uniquingPredicateForModel:model];

	if (uniquingPredicate != nil) {
		__block NSError *fetchRequestError = nil;
		__block BOOL encountedError = NO;
		managedObject = performInContext(context, ^ id {
			NSFetchRequest *fetchRequest = [[fetchRequestClass alloc] init];
			fetchRequest.entity = [entityDescriptionClass entityForName:entityName inManagedObjectContext:context];
			fetchRequest.predicate = uniquingPredicate;
			fetchRequest.returnsObjectsAsFaults = NO;
			fetchRequest.fetchLimit = 1;

			NSArray *results = [context executeFetchRequest:fetchRequest error:&fetchRequestError];

			if (results == nil) {
				encountedError = YES;
				if (error != NULL) {
					NSString *failureReason = [NSString stringWithFormat:NSLocalizedString(@"Failed to fetch a managed object for uniqing predicate \"%@\".", @""), uniquingPredicate];
					
					NSDictionary *userInfo = @{
						NSLocalizedDescriptionKey: NSLocalizedString(@"Could not serialize managed object", @""),
						NSLocalizedFailureReasonErrorKey: failureReason,
					};
					
					fetchRequestError = [NSError errorWithDomain:AWSMTLManagedObjectAdapterErrorDomain code:AWSMTLManagedObjectAdapterErrorUniqueFetchRequestFailed userInfo:userInfo];
				}
				
				return nil;
			}

			return results.awsmtl_firstObject;
		});

		if (encountedError && error != NULL) {
			*error = fetchRequestError;
			return nil;
		}
	}

	if (managedObject == nil) {
		managedObject = [entityDescriptionClass insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
	} else {
		// Our CoreData store already has data for this model, we need to merge
		[self mergeValuesOfModel:model forKeysFromManagedObject:managedObject];
	}

	if (managedObject == nil) {
		if (error != NULL) {
			NSString *failureReason = [NSString stringWithFormat:NSLocalizedString(@"Failed to initialize a managed object from entity named \"%@\".", @""), entityName];

			NSDictionary *userInfo = @{
				NSLocalizedDescriptionKey: NSLocalizedString(@"Could not serialize managed object", @""),
				NSLocalizedFailureReasonErrorKey: failureReason,
			};

			*error = [NSError errorWithDomain:AWSMTLManagedObjectAdapterErrorDomain code:AWSMTLManagedObjectAdapterErrorInitializationFailed userInfo:userInfo];
		}

		return nil;
	}

	// Assign all errors to this variable to work around a memory problem.
	//
	// See https://github.com/github/Mantle/pull/120 for more context.
	__block NSError *tmpError;

	// Pre-emptively consider this object processed, so that we don't get into
	// any cycles when processing its relationships.
	CFDictionaryAddValue(processedObjects, (__bridge void *)model, (__bridge void *)managedObject);

	NSDictionary *dictionaryValue = model.dictionaryValue;
	NSDictionary *managedObjectProperties = managedObject.entity.propertiesByName;

	[dictionaryValue enumerateKeysAndObjectsUsingBlock:^(NSString *propertyKey, id value, BOOL *stop) {
		NSString *managedObjectKey = [self managedObjectKeyForKey:propertyKey];
		if (managedObjectKey == nil) return;
		if ([value isEqual:NSNull.null]) value = nil;

		BOOL (^serializeAttribute)(NSAttributeDescription *) = ^(NSAttributeDescription *attributeDescription) {
			// Mark this as being autoreleased, because validateValue may return
			// a new object to be stored in this variable (and we don't want ARC to
			// double-free or leak the old or new values).
			__autoreleasing id transformedValue = value;

			NSValueTransformer *attributeTransformer = [self entityAttributeTransformerForKey:propertyKey];
			if (attributeTransformer != nil) transformedValue = [attributeTransformer transformedValue:transformedValue];

			if (![managedObject validateValue:&transformedValue forKey:managedObjectKey error:&tmpError]) return NO;
			[managedObject setValue:transformedValue forKey:managedObjectKey];

			return YES;
		};

		NSManagedObject * (^objectForRelationshipFromModel)(id) = ^ id (id model) {
			if (![model isKindOfClass:AWSMTLModel.class] || ![model conformsToProtocol:@protocol(AWSMTLManagedObjectSerializing)]) {
				NSString *failureReason = [NSString stringWithFormat:NSLocalizedString(@"Property of class %@ cannot be encoded into an NSManagedObject.", @""), [model class]];

				NSDictionary *userInfo = @{
					NSLocalizedDescriptionKey: NSLocalizedString(@"Could not serialize managed object", @""),
					NSLocalizedFailureReasonErrorKey: failureReason
				};

				tmpError = [NSError errorWithDomain:AWSMTLManagedObjectAdapterErrorDomain code:AWSMTLManagedObjectAdapterErrorUnsupportedRelationshipClass userInfo:userInfo];

				return nil;
			}

			return [self.class managedObjectFromModel:model insertingIntoContext:context processedObjects:processedObjects error:&tmpError];
		};

		BOOL (^serializeRelationship)(NSRelationshipDescription *) = ^(NSRelationshipDescription *relationshipDescription) {
			if (value == nil) return YES;

			if ([relationshipDescription isToMany]) {
				if (![value conformsToProtocol:@protocol(NSFastEnumeration)]) {
					NSString *failureReason = [NSString stringWithFormat:NSLocalizedString(@"Property of class %@ cannot be encoded into a to-many relationship.", @""), [value class]];

					NSDictionary *userInfo = @{
						NSLocalizedDescriptionKey: NSLocalizedString(@"Could not serialize managed object", @""),
						NSLocalizedFailureReasonErrorKey: failureReason
					};

					tmpError = [NSError errorWithDomain:AWSMTLManagedObjectAdapterErrorDomain code:AWSMTLManagedObjectAdapterErrorUnsupportedRelationshipClass userInfo:userInfo];

					return NO;
				}

				id relationshipCollection;
				if ([relationshipDescription isOrdered]) {
					relationshipCollection = [NSMutableOrderedSet orderedSet];
				} else {
					relationshipCollection = [NSMutableSet set];
				}

				for (AWSMTLModel *model in value) {
					NSManagedObject *nestedObject = objectForRelationshipFromModel(model);
					if (nestedObject == nil) return NO;

					[relationshipCollection addObject:nestedObject];
				}

				[managedObject setValue:relationshipCollection forKey:managedObjectKey];
			} else {
				NSManagedObject *nestedObject = objectForRelationshipFromModel(value);
				if (nestedObject == nil) return NO;

				[managedObject setValue:nestedObject forKey:managedObjectKey];
			}

			return YES;
		};

		BOOL (^serializeProperty)(NSPropertyDescription *) = ^(NSPropertyDescription *propertyDescription) {
			if (propertyDescription == nil) {
				NSString *failureReason = [NSString stringWithFormat:NSLocalizedString(@"No property by name \"%@\" exists on the entity.", @""), managedObjectKey];

				NSDictionary *userInfo = @{
					NSLocalizedDescriptionKey: NSLocalizedString(@"Could not serialize managed object", @""),
					NSLocalizedFailureReasonErrorKey: failureReason
				};

				tmpError = [NSError errorWithDomain:AWSMTLManagedObjectAdapterErrorDomain code:AWSMTLManagedObjectAdapterErrorInvalidManagedObjectKey userInfo:userInfo];

				return NO;
			}

			// Jump through some hoops to avoid referencing classes directly.
			NSString *propertyClassName = NSStringFromClass(propertyDescription.class);
			if ([propertyClassName isEqual:@"NSAttributeDescription"]) {
				return serializeAttribute((id)propertyDescription);
			} else if ([propertyClassName isEqual:@"NSRelationshipDescription"]) {
				return serializeRelationship((id)propertyDescription);
			} else {
				NSString *failureReason = [NSString stringWithFormat:NSLocalizedString(@"Property descriptions of class %@ are unsupported.", @""), propertyClassName];

				NSDictionary *userInfo = @{
					NSLocalizedDescriptionKey: NSLocalizedString(@"Could not serialize managed object", @""),
					NSLocalizedFailureReasonErrorKey: failureReason
				};

				tmpError = [NSError errorWithDomain:AWSMTLManagedObjectAdapterErrorDomain code:AWSMTLManagedObjectAdapterErrorUnsupportedManagedObjectPropertyType userInfo:userInfo];

				return NO;
			}
		};
		
		if (!serializeProperty(managedObjectProperties[managedObjectKey])) {
			performInContext(context, ^ id {
				[context deleteObject:managedObject];
				return nil;
			});

			managedObject = nil;
			*stop = YES;
		}
	}];

	if (managedObject != nil && ![managedObject validateForInsert:&tmpError]) {
		managedObject = performInContext(context, ^ id {
			[context deleteObject:managedObject];
			return nil;
		});
	}

	if (error != NULL) {
		*error = tmpError;
	}

	return managedObject;
}

+ (id)managedObjectFromModel:(AWSMTLModel<AWSMTLManagedObjectSerializing> *)model insertingIntoContext:(NSManagedObjectContext *)context error:(NSError **)error {
	CFDictionaryKeyCallBacks keyCallbacks = kCFTypeDictionaryKeyCallBacks;

	// Compare MTLModel keys using pointer equality, not -isEqual:.
	keyCallbacks.equal = NULL;

	CFMutableDictionaryRef processedObjects = CFDictionaryCreateMutable(NULL, 0, &keyCallbacks, &kCFTypeDictionaryValueCallBacks);
	if (processedObjects == NULL) return nil;

	@onExit {
		CFRelease(processedObjects);
	};

	return [self managedObjectFromModel:model insertingIntoContext:context processedObjects:processedObjects error:error];
}

+ (id)managedObjectFromModel:(AWSMTLModel<AWSMTLManagedObjectSerializing> *)model insertingIntoContext:(NSManagedObjectContext *)context processedObjects:(CFMutableDictionaryRef)processedObjects error:(NSError **)error {
	NSParameterAssert(model != nil);
	NSParameterAssert(context != nil);
	NSParameterAssert(processedObjects != nil);

	const void *existingManagedObject = CFDictionaryGetValue(processedObjects, (__bridge void *)model);
	if (existingManagedObject != NULL) {
		return (__bridge id)existingManagedObject;
	}

	AWSMTLManagedObjectAdapter *adapter = [[self alloc] initWithModelClass:model.class];
	return [adapter managedObjectFromModel:model insertingIntoContext:context processedObjects:processedObjects error:error];
}

- (NSValueTransformer *)entityAttributeTransformerForKey:(NSString *)key {
	NSParameterAssert(key != nil);

	SEL selector = AWSMTLSelectorWithKeyPattern(key, "EntityAttributeTransformer");
	if ([self.modelClass respondsToSelector:selector]) {
		NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self.modelClass methodSignatureForSelector:selector]];
		invocation.target = self.modelClass;
		invocation.selector = selector;
		[invocation invoke];

		__unsafe_unretained id result = nil;
		[invocation getReturnValue:&result];
		return result;
	}

	if ([self.modelClass respondsToSelector:@selector(entityAttributeTransformerForKey:)]) {
		return [self.modelClass entityAttributeTransformerForKey:key];
	}

	return nil;
}

- (NSString *)managedObjectKeyForKey:(NSString *)key {
	NSParameterAssert(key != nil);

	id managedObjectKey = self.managedObjectKeysByPropertyKey[key];
	if ([managedObjectKey isEqual:NSNull.null]) return nil;

	if (managedObjectKey == nil) {
		return key;
	} else {
		return managedObjectKey;
	}
}

- (void)mergeValueOfModel:(AWSMTLModel<AWSMTLManagedObjectSerializing> *)model forKey:(NSString *)key fromManagedObject:(NSManagedObject *)managedObject {
	[model mergeValueForKey:key fromManagedObject:managedObject];
}

- (void)mergeValuesOfModel:(AWSMTLModel<AWSMTLManagedObjectSerializing> *)model forKeysFromManagedObject:(NSManagedObject *)managedObject {
	if ([model respondsToSelector:@selector(mergeValuesForKeysFromManagedObject:)]) {
		[model mergeValuesForKeysFromManagedObject:managedObject];
	} else if ([model respondsToSelector:@selector(mergeValueForKey:fromManagedObject:)]) {
		[[model.class managedObjectKeysByPropertyKey] enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *managedObjectKey, BOOL *stop) {
			[self mergeValueOfModel:model forKey:key fromManagedObject:managedObject];
		}];
	}
}

- (NSPredicate *)uniquingPredicateForModel:(AWSMTLModel<AWSMTLManagedObjectSerializing> *)model {
	if (![self.modelClass respondsToSelector:@selector(propertyKeysForManagedObjectUniquing)]) return nil;

	NSSet *propertyKeys = [self.modelClass propertyKeysForManagedObjectUniquing];

	if (propertyKeys == nil) return nil;

	NSAssert(propertyKeys.count > 0, @"+propertyKeysForManagedObjectUniquing must not be empty.");

	NSMutableArray *subpredicates = [NSMutableArray array];
	for (NSString *propertyKey in propertyKeys) {
		NSString *managedObjectKey = [self managedObjectKeyForKey:propertyKey];

		NSAssert(managedObjectKey != nil, @"%@ must map to a managed object key.", propertyKey);

		id transformedValue = [model valueForKeyPath:propertyKey];

		NSValueTransformer *attributeTransformer = [self entityAttributeTransformerForKey:propertyKey];
		if (attributeTransformer != nil) transformedValue = [attributeTransformer transformedValue:transformedValue];

		NSPredicate *subpredicate = [NSPredicate predicateWithFormat:@"%K == %@", managedObjectKey, transformedValue];
		[subpredicates addObject:subpredicate];
	}
	
	return [NSCompoundPredicate andPredicateWithSubpredicates:subpredicates];
}

@end
