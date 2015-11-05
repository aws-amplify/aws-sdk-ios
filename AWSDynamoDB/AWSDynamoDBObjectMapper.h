/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>

#import <AWSCore/AWSService.h>
#import <AWSCore/AWSModel.h>

/**
 Enumeration of behaviors for the save operation.
 */
typedef NS_ENUM(NSInteger, AWSDynamoDBObjectMapperSaveBehavior) {
    /**
     Unknown SaveBehavior.
     */
    AWSDynamoDBObjectMapperSaveBehaviorUnknown,

    /**
     `AWSDynamoDBObjectMapperSaveBehaviorUpdate` will not affect unmodeled
     attributes on a save operation and a nil value for the modeled attribute
     will remove it from that item in DynamoDB.
     By default, the mapper uses `AWSDynamoDBObjectMapperSaveBehaviorUpdate`.
     */
    AWSDynamoDBObjectMapperSaveBehaviorUpdate,

    /**
     `AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes` is similar
     to `AWSDynamoDBObjectMapperSaveBehaviorUpdate`, except that it
     ignores any null value attribute(s) and will NOT remove them from
     that item in DynamoDB. It also guarantees to send only one single
     updateItem request, no matter the object is key-only or not.
     */
    AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes,

    /**
     `AWSDynamoDBObjectMapperSaveBehaviorAppendSet` treats scalar attributes
     (String, Number, Binary) the same as
     `AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes` does.
     However, for set attributes, it will append to the existing attribute
     value, instead of overriding it. Caller needs to make sure that the
     modeled attribute type matches the existing set type, otherwise it would
     result in a service exception.
     */
    AWSDynamoDBObjectMapperSaveBehaviorAppendSet,

    /**
     `AWSDynamoDBObjectMapperSaveBehaviorClobber` will clear and replace all
     attributes, included unmodeled ones, (delete and recreate) on save.
     Versioned field constraints will also be disregarded.
     */
    AWSDynamoDBObjectMapperSaveBehaviorClobber
};

@class AWSTask;
@class AWSServiceConfiguration;
@class AWSDynamoDB;
@class AWSDynamoDBObjectMapperConfiguration;
@class AWSDynamoDBQueryExpression;
@class AWSDynamoDBScanExpression;

/**
 A DynamoDB Modeling protocol. All objects mapped to an Amazon DynamoDB table row need to conform to this protocol.
 */
@protocol AWSDynamoDBModeling <NSObject>

@required

/**
 Returns the Amazon DynamoDB table name.

 @return A table name.
 */
+ (NSString *)dynamoDBTableName;

/**
 Returns the hash key attribute name.

 @return A hash key attribute name.
 */
+ (NSString *)hashKeyAttribute;

@optional

/**
 Returns the range key attribute name.

 @return A range key attribute name.
 */
+ (NSString *)rangeKeyAttribute;

/**
 Returns an array of `NSString`s for the names of attributes that need to be ignored.

 @return An array of attribute names.
 */
+ (NSArray *)ignoreAttributes;

@end

__attribute__ ((deprecated("Use 'AWSDynamoDBObjectModel' instead.")))
/**
 @warning This class has been deprecated. Use `AWSDynamoDBObjectModel` instead.
 */
@interface AWSDynamoDBModel : AWSMTLModel <AWSMTLJSONSerializing>

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/**
 A base class for all objects mapped to an Amazon DynamoDB table row. They need to inherit from this class.
 */
@interface AWSDynamoDBObjectModel : AWSDynamoDBModel <AWSMTLJSONSerializing>

@end

#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/**
 Object mapper for domain-object interaction with DynamoDB.
 */
@interface AWSDynamoDBObjectMapper : AWSService

/**
 The service configuration used to instantiate this service client.

 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSDynamoDBObjectMapperConfiguration *objectMapperConfiguration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                        identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                              credentialsProvider:credentialsProvider];
         [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

         return YES;
     }

 Then call the following to get the default service client:

 *Swift*

     let DynamoDBObjectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()

 *Objective-C*

     AWSDynamoDBObjectMapper *DynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];

 @return The default service client.
 */
+ (instancetype)defaultDynamoDBObjectMapper;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSDynamoDBObjectMapper.registerDynamoDBObjectMapperWithConfiguration(configuration, forKey: "USWest2DynamoDBObjectMapper")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:configuration forKey:@"USWest2DynamoDBObjectMapper"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let DynamoDBObjectMapper = AWSDynamoDBObjectMapper(forKey: "USWest2DynamoDBObjectMapper")

 *Objective-C*

     AWSDynamoDBObjectMapper *DynamoDBObjectMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"USWest2DynamoDBObjectMapper"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param objectMapperConfiguration The DynamoDB Object Mapper configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerDynamoDBObjectMapperWithConfiguration:(AWSServiceConfiguration *)configuration
                            objectMapperConfiguration:(AWSDynamoDBObjectMapperConfiguration *)objectMapperConfiguration
                                               forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerDynamoDBObjectMapperWithConfiguration:forKey:` before invoking this method. If `+ registerDynamoDBObjectMapperWithConfiguration:objectMapperConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSDynamoDBObjectMapper.registerDynamoDBObjectMapperWithConfiguration(configuration, forKey: "USWest2DynamoDBObjectMapper")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:configuration forKey:@"USWest2DynamoDBObjectMapper"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let DynamoDBObjectMapper = AWSDynamoDBObjectMapper(forKey: "USWest2DynamoDBObjectMapper")

 *Objective-C*

     AWSDynamoDBObjectMapper *DynamoDBObjectMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"USWest2DynamoDBObjectMapper"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)DynamoDBObjectMapperForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.

 @warning Before calling this method, make sure no method is running on this client.

 @param key A string to identify the service client.
 */
+ (void)removeDynamoDBObjectMapperForKey:(NSString *)key;

/**
 Instantiates the service client with the given service configuration.

 @warning This method has been deprecated. Use `+ registerDynamoDBObjectMapperWithConfiguration:forKey:` and `+ DynamoDBObjectMapperForKey:` instead.

 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.

 @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.

 @param configuration The service configuration object.
 @param objectMapperConfiguration The DynamoDB Object Mapper configuration object.

 @return An instance of the service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
            objectMapperConfiguration:(AWSDynamoDBObjectMapperConfiguration *)objectMapperConfiguration __attribute__ ((deprecated("Use '+ registerDynamoDBObjectMapperWithConfiguration:forKey:' and '+ DynamoDBObjectMapperForKey:' instead.")));

/**
 Saves the object given into DynamoDB, using the default configuration.

 @param model A model to save.

 @return AWSTask.
 */
- (AWSTask *)save:(AWSDynamoDBModel *)model;

/**
 Saves the object given into DynamoDB, using the specified configuration.

 @param model         A model to save.
 @param configuration A configuration.

 @return AWSTask.
 */
- (AWSTask *)save:(AWSDynamoDBModel *)model
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 Deletes the given object from its DynamoDB table using the default configuration.

 @param model A model to delete.

 @return AWSTask.
 */
- (AWSTask *)remove:(AWSDynamoDBModel *)model;

/**
 Deletes the given object from its DynamoDB table using the specified configuration.

 @param model         A model to delete.
 @param configuration A configuration.

 @return AWSTask.
 */
- (AWSTask *)remove:(AWSDynamoDBModel *)model
     configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 Loads an object with a hash and range key, using the default configuration.

 @param resultClass The class of the result object.
 @param hashKey     A hash key value.
 @param rangeKey    A range key value.

 @return AWSTask.
 */
- (AWSTask *)load:(Class)resultClass
         hashKey:(id)hashKey
        rangeKey:(id)rangeKey;

/**
 Returns an object with the given hash key, or null if no such object exists.

 @param resultClass   The class of the result object.
 @param hashKey       A hash key value.
 @param rangeKey      A range key value.
 @param configuration A configuration.

 @return AWSTask.
 */
- (AWSTask *)load:(Class)resultClass
         hashKey:(id)hashKey
        rangeKey:(id)rangeKey
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 Queries an Amazon DynamoDB table and returns the matching results as an unmodifiable list of instantiated objects, using the default configuration.

 @param resultClass The class of the result object.
 @param expression  An expression object.

 @return AWSTask.
 */
- (AWSTask *)query:(Class)resultClass
       expression:(AWSDynamoDBQueryExpression *)expression;

/**
 Queries an Amazon DynamoDB table and returns the matching results as an unmodifiable list of instantiated objects.

 @param resultClass   The class of the result object.
 @param expression    An expression object.
 @param configuration A configuration.

 @return AWSTask.
 */
- (AWSTask *)query:(Class)resultClass
       expression:(AWSDynamoDBQueryExpression *)expression
    configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 Scans through an Amazon DynamoDB table and returns the matching results as an AWSDynamoDBPaginatedOutput of instantiated objects, using the default configuration.

 @param resultClass The class of the result object.
 @param expression  An expression object.

 @return AWSTask.
 */
- (AWSTask *)scan:(Class)resultClass
      expression:(AWSDynamoDBScanExpression *)expression;

/**
 Scans through an Amazon DynamoDB table and returns the matching results as an AWSDynamoDBPaginatedOutput of instantiated objects.

 @param resultClass   The class of the result object.
 @param expression    An expression object.
 @param configuration A configuration.

 @return AWSTask.
 */
- (AWSTask *)scan:(Class)resultClass
      expression:(AWSDynamoDBScanExpression *)expression
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

@end

#pragma clang diagnostic pop

/**
 Immutable configuration object for service call behavior. An instance of this configuration is supplied to every DynamoDBMapper at construction. New instances can be given to the mapper object on individual save, load, and remove operations to override the defaults.
 */
@interface AWSDynamoDBObjectMapperConfiguration : NSObject <NSCopying>

/**
 The behavior for the save operation.
 */
@property (nonatomic, assign) AWSDynamoDBObjectMapperSaveBehavior saveBehavior;

/**
 When set to @YES, AWSDynamoDBObjectMapper uses consistent read to read data from the table. When set to @NO, it uses eventually consistant read.
 */
@property (nonatomic, strong) NSNumber *consistentRead;

@end

/**
 A query expression.
 */
@interface AWSDynamoDBQueryExpression : NSObject

/**
 When set to @YES, AWSDynamoDBObjectMapper scans the index forward. When set to @NO, it scans the other direction.
 */
@property (nonatomic, strong) NSNumber *scanIndexForward;

/**
 The hash attribute name used as hashKeyConditions. If nil, the class uses the return value of `hashKeyAttribute` in user-defined Object Mapper Class.
 
 You should set this value when query a global secondary index where the index hash attribute name is different from table's hash attribute name.
 */
@property (nonatomic, strong) NSString *hashKeyAttribute;

/**
 The value of the hash key.
 */
@property (nonatomic, strong) id hashKeyValues;

/**
 The condition that specifies the key value(s) for items to be retrieved by the Query action. For more information, see [AWSDynamoDBQueryInput keyConditionExpression]
 
 *Important:* Unlike [AWSDynamoDBQueryInput keyConditionExpression], DynamoDB Object Mapper automatically provides the required hash key equality condition for you. You can provide an optinal range range key condition.
 
 For example, you may set rangeKeyConditionExpression to `rangeAttributeName = :rangeval`  where `rangeAttributeName` is the attribute name of the range key. You also need to use the expressionAttributeValues property to replace tokens `:rangeval` with actual values at runtime.
 
 @see [AWSDynamoDBQueryInput keyConditionExpression]
 @see expressionAttributeNames
 @see expressionAttributeValues
 */
@property (nonatomic, strong) NSString *rangeKeyConditionExpression;

/**
 A string that contains conditions DynamoDB applies after the Query operation, but before the data is returned. For more information, see [AWSDynamoDBQueryInput filterExpression]
 
 @see [AWSDynamoDBQueryInput filterExpression]
 @see expressionAttributeNames
 @see expressionAttributeValues
 */
@property (nonatomic, strong) NSString *filterExpression;

/**
 A string that identifies one or more attributes to retrieve from the table. If no attribute names are specified, all attributes will be returned.
 
 @see [AWSDynamoDBQueryInput projectionExpression]
 @see expressionAttributeNames
 @see expressionAttributeValues
 */
@property (nonatomic, strong) NSString *projectionExpression;

/**
 One or more substitution tokens for attribute names in an expression.
 
 @see [AWSDynamoDBQueryInput expressionAttributeNames]
 */
@property (nonatomic, strong) NSDictionary *expressionAttributeNames;

/**
 One or more values that can be substituted in an expression.
 
 @see [AWSDynamoDBQueryInput expressionAttributeValues]
 */
@property (nonatomic, strong) NSDictionary *expressionAttributeValues;

/**
 The range key conditions.
 
 @warning This is a legacy parameter, provided for backward compatibility. New applications should use KeyConditionExpression instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a ValidationException error.
 
 @see KeyConditionExpression
 */
@property (nonatomic, strong) NSDictionary *rangeKeyConditions __attribute__ ((deprecated("Use 'keyConditionExpression' instead.")));

/**
 The exclusive start key.
 */
@property (nonatomic, strong) NSDictionary *exclusiveStartKey;

/**
 The limit.
 */
@property (nonatomic, strong) NSNumber *limit;

/**
 The index name.
 */
@property (nonatomic, strong) NSString *indexName;

@end

/**
 Options for filtering results from a scan operation. For example, callers can specify filter conditions so that only objects whose attributes match different conditions are returned (see ComparisonOperator for more information on the available comparison types).
 */
@interface AWSDynamoDBScanExpression : NSObject

/**
 A string that contains conditions that DynamoDB applies after the Scan operation, but before the data is returned.
 
 @see [AWSDynamoDBScanInput filterExpression]
 @see expressionAttributeNames
 @see expressionAttributeValues
 */
@property (nonatomic, strong) NSString *filterExpression;

/**
 A string that identifies one or more attributes to retrieve from the specified table or index. If no attribute names are specified, all attributes will be returned.
 
 @see [AWSDynamoDBScanInput projectionExpression]
 @see expressionAttributeNames
 @see expressionAttributeValues
 */
@property (nonatomic, strong) NSString *projectionExpression;

/**
 One or more substitution tokens for attribute names in an expression.
 
 @see [AWSDynamoDBScanInput expressionAttributeNames]
 */
@property (nonatomic, strong) NSDictionary *expressionAttributeNames;

/**
 One or more values that can be substituted in an expression.
 
 @see [AWSDynamoDBScanInput expressionAttributeValues]
 */
@property (nonatomic, strong) NSDictionary *expressionAttributeValues;

/**
 The scan filter.
 */
@property (nonatomic, strong) NSDictionary *scanFilter __attribute__ ((deprecated("Use 'filterExpression' instead.")));

/**
 The exclusive start key.
 */
@property (nonatomic, strong) NSDictionary *exclusiveStartKey;

/**
 The limit.
 */
@property (nonatomic, strong) NSNumber *limit;

/**
 The index name.
 */
@property (nonatomic, strong) NSString *indexName;

@end

/**
 The paginated output object.
 */
@interface AWSDynamoDBPaginatedOutput : NSObject

/**
 The array of items.
 */
@property (nonatomic, strong) NSArray *items;

/**
 The last evaluated key.
 */
@property (nonatomic, strong) NSDictionary *lastEvaluatedKey;

@end
