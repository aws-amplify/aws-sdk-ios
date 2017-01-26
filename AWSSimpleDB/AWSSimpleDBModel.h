//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSSimpleDBErrorDomain;

typedef NS_ENUM(NSInteger, AWSSimpleDBErrorType) {
    AWSSimpleDBErrorUnknown,
    AWSSimpleDBErrorAttributeDoesNotExist,
    AWSSimpleDBErrorDuplicateItemName,
    AWSSimpleDBErrorInvalidNextToken,
    AWSSimpleDBErrorInvalidNumberPredicates,
    AWSSimpleDBErrorInvalidNumberValueTests,
    AWSSimpleDBErrorInvalidParameterValue,
    AWSSimpleDBErrorInvalidQueryExpression,
    AWSSimpleDBErrorMissingParameter,
    AWSSimpleDBErrorNoSuchDomain,
    AWSSimpleDBErrorNumberDomainAttributesExceeded,
    AWSSimpleDBErrorNumberDomainBytesExceeded,
    AWSSimpleDBErrorNumberDomainsExceeded,
    AWSSimpleDBErrorNumberItemAttributesExceeded,
    AWSSimpleDBErrorNumberSubmittedAttributesExceeded,
    AWSSimpleDBErrorNumberSubmittedItemsExceeded,
    AWSSimpleDBErrorRequestTimeout,
    AWSSimpleDBErrorTooManyRequestedAttributes,
};

@class AWSSimpleDBAttribute;
@class AWSSimpleDBBatchDeleteAttributesRequest;
@class AWSSimpleDBBatchPutAttributesRequest;
@class AWSSimpleDBCreateDomainRequest;
@class AWSSimpleDBDeletableAttribute;
@class AWSSimpleDBDeletableItem;
@class AWSSimpleDBDeleteAttributesRequest;
@class AWSSimpleDBDeleteDomainRequest;
@class AWSSimpleDBDomainMetadataRequest;
@class AWSSimpleDBDomainMetadataResult;
@class AWSSimpleDBGetAttributesRequest;
@class AWSSimpleDBGetAttributesResult;
@class AWSSimpleDBItem;
@class AWSSimpleDBListDomainsRequest;
@class AWSSimpleDBListDomainsResult;
@class AWSSimpleDBPutAttributesRequest;
@class AWSSimpleDBReplaceableAttribute;
@class AWSSimpleDBReplaceableItem;
@class AWSSimpleDBSelectRequest;
@class AWSSimpleDBSelectResult;
@class AWSSimpleDBUpdateCondition;

/**
 <p/>
 Required parameters: [Name, Value]
 */
@interface AWSSimpleDBAttribute : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable alternateNameEncoding;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable alternateValueEncoding;

/**
 The name of the attribute.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The value of the attribute.
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSSimpleDBBatchDeleteAttributesRequest : AWSRequest


/**
 The name of the domain in which the attributes are being deleted.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 A list of items on which to perform the operation.
 */
@property (nonatomic, strong) NSArray<AWSSimpleDBDeletableItem *> * _Nullable items;

@end

/**
 
 */
@interface AWSSimpleDBBatchPutAttributesRequest : AWSRequest


/**
 The name of the domain in which the attributes are being stored.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 A list of items on which to perform the operation.
 */
@property (nonatomic, strong) NSArray<AWSSimpleDBReplaceableItem *> * _Nullable items;

@end

/**
 
 */
@interface AWSSimpleDBCreateDomainRequest : AWSRequest


/**
 The name of the domain to create. The name can range between 3 and 255 characters and can contain the following characters: a-z, A-Z, 0-9, '_', '-', and '.'.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p/>
 Required parameters: [Name]
 */
@interface AWSSimpleDBDeletableAttribute : AWSModel


/**
 The name of the attribute.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 The value of the attribute.
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSSimpleDBDeletableItem : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSSimpleDBDeletableAttribute *> * _Nullable attributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSimpleDBDeleteAttributesRequest : AWSRequest


/**
 A list of Attributes. Similar to columns on a spreadsheet, attributes represent categories of data that can be assigned to items.
 */
@property (nonatomic, strong) NSArray<AWSSimpleDBDeletableAttribute *> * _Nullable attributes;

/**
 The name of the domain in which to perform the operation.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 The update condition which, if specified, determines whether the specified attributes will be deleted or not. The update condition must be satisfied in order for this request to be processed and the attributes to be deleted.
 */
@property (nonatomic, strong) AWSSimpleDBUpdateCondition * _Nullable expected;

/**
 The name of the item. Similar to rows on a spreadsheet, items represent individual objects that contain one or more value-attribute pairs.
 */
@property (nonatomic, strong) NSString * _Nullable itemName;

@end

/**
 
 */
@interface AWSSimpleDBDeleteDomainRequest : AWSRequest


/**
 The name of the domain to delete.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSSimpleDBDomainMetadataRequest : AWSRequest


/**
 The name of the domain for which to display the metadata of.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSSimpleDBDomainMetadataResult : AWSModel


/**
 The number of unique attribute names in the domain.
 */
@property (nonatomic, strong) NSNumber * _Nullable attributeNameCount;

/**
 The total size of all unique attribute names in the domain, in bytes.
 */
@property (nonatomic, strong) NSNumber * _Nullable attributeNamesSizeBytes;

/**
 The number of all attribute name/value pairs in the domain.
 */
@property (nonatomic, strong) NSNumber * _Nullable attributeValueCount;

/**
 The total size of all attribute values in the domain, in bytes.
 */
@property (nonatomic, strong) NSNumber * _Nullable attributeValuesSizeBytes;

/**
 The number of all items in the domain.
 */
@property (nonatomic, strong) NSNumber * _Nullable itemCount;

/**
 The total size of all item names in the domain, in bytes.
 */
@property (nonatomic, strong) NSNumber * _Nullable itemNamesSizeBytes;

/**
 The data and time when metadata was calculated, in Epoch (UNIX) seconds.
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 
 */
@interface AWSSimpleDBGetAttributesRequest : AWSRequest


/**
 The names of the attributes.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeNames;

/**
 Determines whether or not strong consistency should be enforced when data is read from SimpleDB. If <code>true</code>, any data previously written to SimpleDB will be returned. Otherwise, results will be consistent eventually, and the client may not see data that was written immediately before your read.
 */
@property (nonatomic, strong) NSNumber * _Nullable consistentRead;

/**
 The name of the domain in which to perform the operation.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 The name of the item.
 */
@property (nonatomic, strong) NSString * _Nullable itemName;

@end

/**
 
 */
@interface AWSSimpleDBGetAttributesResult : AWSModel


/**
 The list of attributes returned by the operation.
 */
@property (nonatomic, strong) NSArray<AWSSimpleDBAttribute *> * _Nullable attributes;

@end

/**
 <p/>
 Required parameters: [Name, Attributes]
 */
@interface AWSSimpleDBItem : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable alternateNameEncoding;

/**
 A list of attributes.
 */
@property (nonatomic, strong) NSArray<AWSSimpleDBAttribute *> * _Nullable attributes;

/**
 The name of the item.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSimpleDBListDomainsRequest : AWSRequest


/**
 The maximum number of domain names you want returned. The range is 1 to 100. The default setting is 100.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxNumberOfDomains;

/**
 A string informing Amazon SimpleDB where to start the next list of domain names.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSimpleDBListDomainsResult : AWSModel


/**
 A list of domain names that match the expression.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable domainNames;

/**
 An opaque token indicating that there are more domains than the specified <code>MaxNumberOfDomains</code> still available.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSimpleDBPutAttributesRequest : AWSRequest


/**
 The list of attributes.
 */
@property (nonatomic, strong) NSArray<AWSSimpleDBReplaceableAttribute *> * _Nullable attributes;

/**
 The name of the domain in which to perform the operation.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 The update condition which, if specified, determines whether the specified attributes will be updated or not. The update condition must be satisfied in order for this request to be processed and the attributes to be updated.
 */
@property (nonatomic, strong) AWSSimpleDBUpdateCondition * _Nullable expected;

/**
 The name of the item.
 */
@property (nonatomic, strong) NSString * _Nullable itemName;

@end

/**
 <p/>
 Required parameters: [Name, Value]
 */
@interface AWSSimpleDBReplaceableAttribute : AWSModel


/**
 The name of the replaceable attribute.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 A flag specifying whether or not to replace the attribute/value pair or to add a new attribute/value pair. The default setting is <code>false</code>.
 */
@property (nonatomic, strong) NSNumber * _Nullable replace;

/**
 The value of the replaceable attribute.
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p/>
 Required parameters: [Name, Attributes]
 */
@interface AWSSimpleDBReplaceableItem : AWSModel


/**
 The list of attributes for a replaceable item.
 */
@property (nonatomic, strong) NSArray<AWSSimpleDBReplaceableAttribute *> * _Nullable attributes;

/**
 The name of the replaceable item.
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSimpleDBSelectRequest : AWSRequest


/**
 Determines whether or not strong consistency should be enforced when data is read from SimpleDB. If <code>true</code>, any data previously written to SimpleDB will be returned. Otherwise, results will be consistent eventually, and the client may not see data that was written immediately before your read.
 */
@property (nonatomic, strong) NSNumber * _Nullable consistentRead;

/**
 A string informing Amazon SimpleDB where to start the next list of <code>ItemNames</code>.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 The expression used to query the domain.
 */
@property (nonatomic, strong) NSString * _Nullable selectExpression;

@end

/**
 
 */
@interface AWSSimpleDBSelectResult : AWSModel


/**
 A list of items that match the select expression.
 */
@property (nonatomic, strong) NSArray<AWSSimpleDBItem *> * _Nullable items;

/**
 An opaque token indicating that more items than <code>MaxNumberOfItems</code> were matched, the response size exceeded 1 megabyte, or the execution time exceeded 5 seconds.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Specifies the conditions under which data should be updated. If an update condition is specified for a request, the data will only be updated if the condition is satisfied. For example, if an attribute with a specific name and value exists, or if a specific attribute doesn't exist. </p>
 */
@interface AWSSimpleDBUpdateCondition : AWSModel


/**
 <p>A value specifying whether or not the specified attribute must exist with the specified value in order for the update condition to be satisfied. Specify <code>true</code> if the attribute must exist for the update condition to be satisfied. Specify <code>false</code> if the attribute should not exist in order for the update condition to be satisfied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable exists;

/**
 <p>The name of the attribute involved in the condition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of an attribute. This value can only be specified when the <code>Exists</code> parameter is equal to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

NS_ASSUME_NONNULL_END
