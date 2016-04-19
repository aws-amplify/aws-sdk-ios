//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import <Foundation/Foundation.h>
#import "AWSDynamoDBService.h"

NS_ASSUME_NONNULL_BEGIN

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

@class AWSDynamoDBObjectMapperConfiguration;
@class AWSDynamoDBQueryExpression;
@class AWSDynamoDBScanExpression;
@class AWSDynamoDBPaginatedOutput;

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
 Returns the names of attributes that need to be ignored.

 @return An array of attribute names.
 */
+ (NSArray<NSString *> *)ignoreAttributes;

@end

/**
 A base class for all objects mapped to an Amazon DynamoDB table row. They need to inherit from this class.
 */
@interface AWSDynamoDBObjectModel : AWSMTLModel <AWSMTLJSONSerializing>

@end

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
 Retrieves the service client associated with the key. You need to call `+ registerDynamoDBObjectMapperWithConfiguration:forKey:` before invoking this method.

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
 Saves the model object to an Amazon DynamoDB table using the default configuration.

 @param model A model to save.

 @return AWSTask.
 */
- (AWSTask *)save:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model;

/**
 Saves the model object to an Amazon DynamoDB table using the default configuration.

 @param model             A model to save.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)save:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Saves the model object to an Amazon DynamoDB table using the specified configuration.

 @param model         A model to save.
 @param configuration A configuration.

 @return AWSTask.
 */
- (AWSTask *)save:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
    configuration:(nullable AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 Saves the model object to an Amazon DynamoDB table using the specified configuration.

 @param model             A model to save.
 @param configuration     A configuration.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)save:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
configuration:(nullable AWSDynamoDBObjectMapperConfiguration *)configuration
completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Removes the given model object from the Amazon DynamoDB table using the default configuration.

 @param model A model to delete.

 @return AWSTask.
 */
- (AWSTask *)remove:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model;

/**
 Removes the given model object from the Amazon DynamoDB table using the default configuration.

 @param model             A model to delete.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)remove:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Removes the given model object from the Amazon DynamoDB table using the specified configuration.

 @param model         A model to delete.
 @param configuration A configuration.

 @return AWSTask.
 */
- (AWSTask *)remove:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
      configuration:(nullable AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 Removes the given model object from the Amazon DynamoDB table using the specified configuration.

 @param model             A model to delete.
 @param configuration     A configuration.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)remove:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
 configuration:(nullable AWSDynamoDBObjectMapperConfiguration *)configuration
completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Returns an object with the given hash key and the range key (if it exists), or `nil` if no such object exists.

 @param resultClass The class of the result object.
 @param hashKey     A hash key value.
 @param rangeKey    A range key value.

 @return AWSTask.
 */
- (AWSTask *)load:(Class)resultClass
          hashKey:(id)hashKey
         rangeKey:(nullable id)rangeKey;

/**
 Returns an object with the given hash key and the range key (if it exists), or `nil` if no such object exists.

 @param resultClass       The class of the result object.
 @param hashKey           A hash key value.
 @param rangeKey          A range key value.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response`: The specified model object, or `nil` if no such object exists.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)load:(Class)resultClass
     hashKey:(id)hashKey
    rangeKey:(nullable id)rangeKey
completionHandler:(void (^ _Nullable)(AWSDynamoDBObjectModel<AWSDynamoDBModeling> * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns an object with the given hash key and the range key (if it exists), or `nil` if no such object exists.

 @param resultClass   The class of the result object.
 @param hashKey       A hash key value.
 @param rangeKey      A range key value.
 @param configuration A configuration.

 @return AWSTask.
 */
- (AWSTask *)load:(Class)resultClass
          hashKey:(id)hashKey
         rangeKey:(nullable id)rangeKey
    configuration:(nullable AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 Returns an object with the given hash key and the range key (if it exists), or `nil` if no such object exists.

 @param resultClass       The class of the result object.
 @param hashKey           A hash key value.
 @param rangeKey          A range key value.
 @param configuration     A configuration.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response`: The specified model object, or `nil` if no such object exists.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)load:(Class)resultClass
     hashKey:(id)hashKey
    rangeKey:(nullable id)rangeKey
configuration:(nullable AWSDynamoDBObjectMapperConfiguration *)configuration
completionHandler:(void (^ _Nullable)(AWSDynamoDBObjectModel<AWSDynamoDBModeling> * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Queries an Amazon DynamoDB table and returns the matching results as an unmodifiable list of instantiated objects, using the default configuration.

 @param resultClass The class of the result object.
 @param expression  An expression object.

 @return AWSTask.
 */
- (AWSTask<AWSDynamoDBPaginatedOutput *> *)query:(Class)resultClass
                                      expression:(AWSDynamoDBQueryExpression *)expression;

/**
 Queries an Amazon DynamoDB table and returns the matching results as an unmodifiable list of instantiated objects.

 @param resultClass       The class of the result object.
 @param expression        An expression object.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response`: `AWSDynamoDBPaginatedOutput` that contains a list of model objects, or `nil` if no such object exists.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)query:(Class)resultClass
   expression:(AWSDynamoDBQueryExpression *)expression
completionHandler:(void (^ _Nullable)(AWSDynamoDBPaginatedOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Queries an Amazon DynamoDB table and returns the matching results as an unmodifiable list of instantiated objects.

 @param resultClass   The class of the result object.
 @param expression    An expression object.
 @param configuration A configuration.

 @return AWSTask.
 */
- (AWSTask<AWSDynamoDBPaginatedOutput *> *)query:(Class)resultClass
                                      expression:(AWSDynamoDBQueryExpression *)expression
                                   configuration:(nullable AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 Queries an Amazon DynamoDB table and returns the matching results as an unmodifiable list of instantiated objects.

 @param resultClass       The class of the result object.
 @param expression        An expression object.
 @param configuration     A configuration.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response`: `AWSDynamoDBPaginatedOutput` that contains a list of model objects, or `nil` if no such object exists.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)query:(Class)resultClass
   expression:(AWSDynamoDBQueryExpression *)expression
configuration:(nullable AWSDynamoDBObjectMapperConfiguration *)configuration
completionHandler:(void (^ _Nullable)(AWSDynamoDBPaginatedOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Scans through an Amazon DynamoDB table and returns the matching results as an AWSDynamoDBPaginatedOutput of instantiated objects, using the default configuration.

 @param resultClass The class of the result object.
 @param expression  An expression object.

 @return AWSTask.
 */
- (AWSTask<AWSDynamoDBPaginatedOutput *> *)scan:(Class)resultClass
                                     expression:(AWSDynamoDBScanExpression *)expression;

/**
 Scans through an Amazon DynamoDB table and returns the matching results as an AWSDynamoDBPaginatedOutput of instantiated objects.

 @param resultClass   The class of the result object.
 @param expression    An expression object.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response`: `AWSDynamoDBPaginatedOutput` that contains a list of model objects, or `nil` if no such object exists.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)scan:(Class)resultClass
  expression:(AWSDynamoDBScanExpression *)expression
completionHandler:(void (^ _Nullable)(AWSDynamoDBPaginatedOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Scans through an Amazon DynamoDB table and returns the matching results as an AWSDynamoDBPaginatedOutput of instantiated objects.

 @param resultClass   The class of the result object.
 @param expression    An expression object.
 @param configuration A configuration.

 @return AWSTask.
 */
- (AWSTask<AWSDynamoDBPaginatedOutput *> *)scan:(Class)resultClass
                                     expression:(AWSDynamoDBScanExpression *)expression
                                  configuration:(nullable AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 Scans through an Amazon DynamoDB table and returns the matching results as an AWSDynamoDBPaginatedOutput of instantiated objects.

 @param resultClass   The class of the result object.
 @param expression    An expression object.
 @param configuration A configuration.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response`: `AWSDynamoDBPaginatedOutput` that contains a list of model objects, or `nil` if no such object exists.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)scan:(Class)resultClass
  expression:(AWSDynamoDBScanExpression *)expression
configuration:(nullable AWSDynamoDBObjectMapperConfiguration *)configuration
completionHandler:(void (^ _Nullable)(AWSDynamoDBPaginatedOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

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
@property (nonatomic, strong, nullable) NSNumber *consistentRead;

@end

/**
 A query expression.
 */
@interface AWSDynamoDBQueryExpression : NSObject

/**
 The index name.
 */
@property (nonatomic, strong, nullable) NSString *indexName;

/**
 The condition that specifies the key value(s) for items to be retrieved by the Query action. For more information, see [AWSDynamoDBQueryInput keyConditionExpression]

 For example, you may set keyConditionExpression to `hashAttributeName = :hashVal AND rangeAttributeName = :rangeVal` where `hashAttributeName` and `rangeAttributeName` is the attribute name of the hash key and range key respectively. Then you can set `expressionAttributeValues` to `@{@":hashVal" : @"myHashValue", @":rangeVal" : @100}`.
 
 @see [AWSDynamoDBQueryInput keyConditionExpression]
 @see expressionAttributeNames
 @see expressionAttributeValues
 */
@property (nonatomic, strong, nullable) NSString *keyConditionExpression;

/**
 A string that contains conditions DynamoDB applies after the Query operation, but before the data is returned. For more information, see [AWSDynamoDBQueryInput filterExpression]
 
 @see [AWSDynamoDBQueryInput filterExpression]
 @see expressionAttributeNames
 @see expressionAttributeValues
 */
@property (nonatomic, strong, nullable) NSString *filterExpression;

/**
 A string that identifies one or more attributes to retrieve from the table. If no attribute names are specified, all attributes will be returned.
 
 @see [AWSDynamoDBQueryInput projectionExpression]
 @see expressionAttributeNames
 @see expressionAttributeValues
 */
@property (nonatomic, strong, nullable) NSString *projectionExpression;

/**
 One or more values that can be substituted in an expression.

 @see [AWSDynamoDBQueryInput expressionAttributeValues]
 */
@property (nonatomic, strong, nullable) NSDictionary<NSString *, id> *expressionAttributeValues;

/**
 One or more substitution tokens for attribute names in an expression.
 
 @see [AWSDynamoDBQueryInput expressionAttributeNames]
 */
@property (nonatomic, strong, nullable) NSDictionary<NSString *, NSString *> *expressionAttributeNames;

/**
 The limit.
 */
@property (nonatomic, strong, nullable) NSNumber *limit;

/**
 When set to @YES, AWSDynamoDBObjectMapper scans the index forward. When set to @NO, it scans the other direction.
 */
@property (nonatomic, strong, nullable) NSNumber *scanIndexForward;

/**
 The exclusive start key.
 */
@property (nonatomic, strong, nullable) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *exclusiveStartKey;

@property (nonatomic, strong, nullable) NSString *hashKeyAttribute __attribute__ ((deprecated("Use 'keyConditionExpression' and 'expressionAttributeValues' instead.")));
@property (nonatomic, strong, nullable) id hashKeyValues __attribute__ ((deprecated("Use 'keyConditionExpression' and 'expressionAttributeValues' instead.")));
@property (nonatomic, strong, nullable) NSString *rangeKeyConditionExpression __attribute__ ((deprecated("Use 'keyConditionExpression' instead.")));

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
@property (nonatomic, strong, nullable) NSString *filterExpression;

/**
 A string that identifies one or more attributes to retrieve from the specified table or index. If no attribute names are specified, all attributes will be returned.
 
 @see [AWSDynamoDBScanInput projectionExpression]
 @see expressionAttributeNames
 @see expressionAttributeValues
 */
@property (nonatomic, strong, nullable) NSString *projectionExpression;

/**
 One or more substitution tokens for attribute names in an expression.
 
 @see [AWSDynamoDBScanInput expressionAttributeNames]
 */
@property (nonatomic, strong, nullable) NSDictionary<NSString *, NSString *> *expressionAttributeNames;

/**
 One or more values that can be substituted in an expression.
 
 @see [AWSDynamoDBScanInput expressionAttributeValues]
 */
@property (nonatomic, strong, nullable) NSDictionary<NSString *, id> *expressionAttributeValues;

/**
 The exclusive start key.
 */
@property (nonatomic, strong, nullable) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *exclusiveStartKey;

/**
 The limit.
 */
@property (nonatomic, strong, nullable) NSNumber *limit;

/**
 The index name.
 */
@property (nonatomic, strong, nullable) NSString *indexName;

@end

/**
 The paginated output object.
 */
@interface AWSDynamoDBPaginatedOutput : NSObject

/**
 The array of items.
 */
@property (nonatomic, strong, readonly) NSArray<__kindof AWSDynamoDBObjectModel<AWSDynamoDBModeling> *> *items;

/**
 The last evaluated key.
 */
@property (nonatomic, strong, readonly , nullable) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *lastEvaluatedKey;

/**
 Loads the next page of items when `self.lastEvaluatedKey` is not `nil`.

 @return `task.error` indicates why the request failed, or `nil` if the request was successful. `task.result` is always `nil`.
 */
- (AWSTask *)loadNextPage;

/**
 Loads the next page of items when `self.lastEvaluatedKey` is not `nil`.

 @param completionHandler The completion handler to call when the load request is complete.
                          `error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)loadNextPageWithCompletionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 Resets `self.lastEvaluatedKey` to `nil` and reloads the results from the beginning.

 @return `task.error` indicates why the request failed, or `nil` if the request was successful. `task.result` is always `nil`.
 */
- (AWSTask *)reload;

/**
 Resets `self.lastEvaluatedKey` to `nil` and reloads the results from the beginning.

 @param completionHandler The completion handler to call when the load request is complete.
                          error`: An error object that indicates why the request failed, or `nil` if the request was successful.
 */
- (void)reloadWithCompletionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
