//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AWSCognitoRecordValueType) {
    AWSCognitoRecordValueTypeUnknown,
    AWSCognitoRecordValueTypeString,
    AWSCognitoRecordValueTypeDeleted,
};

/**
 An object that encapsulates the record value.
 */
@interface AWSCognitoRecordValue : NSObject


/**
 The type of the record value.
 
 The record value datatypes.
 <ul>
 <li>AWSCognitoRecordValueTypeUnknown - Unknown type.</li>
 <li>AWSCognitoRecordValueTypeString - The string value.</li>
 <li>AWSCognitoRecordValueTypeDeleted - A deleted value.</li>
 </ul>
 */
@property (nonatomic, readonly) AWSCognitoRecordValueType type;

/**
 Initializes a AWSCognitoRecordValue with the given string value.
 The type property is automatically set to AWSCognitoRecordValueTypeString.
 
 @param value The string value of the AWSCognitoRecordValue.
 
 @return The initialized instance
 */
- (instancetype)initWithString:(NSString *)value;

/**
 Returns the string value.
 
 @return The string value stored by the record value object.
 */
- (NSString *)string;

@end

@interface AWSCognitoRecordMetadata : NSObject

/**
 Record ID or name.
 */
@property (nonatomic, readonly) NSString *recordId;

/**
 The last date the record was modified.
 */
@property (nonatomic, readonly) NSDate *lastModified;

/**
 The ID of the client that last modified the record. Set in AWSCognitoConfig under the clientID property.
 */
@property (nonatomic, strong) NSString *lastModifiedBy;

/**
 Boolean indicating whether or not the record has updates/deletes that need to be synced with the server.
 */
@property (nonatomic, readonly, getter = isDirty) BOOL dirty;

/**
 Integer value indicating how many times the record has been written since the last sync.
 The value is 0 if the record has not been modified. The value is incremented by 1 each time the record is updated.
 The value is set to -1 when the record is marked as deleted from the local database.
 */
@property (nonatomic, assign) int64_t dirtyCount;

/**
 Integer value of the server sync count of the record.
 */
@property (nonatomic, assign) int64_t syncCount;

- (instancetype)initWithId:(NSString *)recordId;

/**
 Checks if the metadata matches.
 
 @param object The object to be compared to the receiver.
 May be nil, in which case this method returns NO.
 @return YES if the receiver and object have equal metadata, otherwise NO.
 */
- (BOOL)isEqualMetadata:(id)object;

@end

@interface AWSCognitoRecord : AWSCognitoRecordMetadata

/**
 The data for the record.
 */
@property (nonatomic, strong) AWSCognitoRecordValue *data;

/**
 Initializes a AWSCognitoRecord with the given recordID, given data, and a dirtyCount and recordVersion of 0.
 
 @param recordId The record ID of the AWSCognitoRecord
 @param data the initial data that the AWSCognitoRecord will contain
 */
- (instancetype)initWithId:(NSString *)recordId
                      data:(AWSCognitoRecordValue *)data;

/**
 Returns true if this record has been deleted
 
 @return YES if the record is deleted, NO otherwise
 */
- (BOOL)isDeleted;

@end
