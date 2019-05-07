//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import "AWSCognitoService.h"
#import "AWSCognitoRecord.h"
#import "AWSCognitoUtil.h"
#import "AWSCognitoConstants.h"
#import "AWSCognitoRecord_Internal.h"

@implementation AWSCognitoRecordMetadata

- (instancetype)initWithId:(NSString *)recordId {
    if (self = [super init]) {
        _recordId = recordId;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (nil != self) {
        NSString *value = nil;
        
        value = [dictionary objectForKey:AWSCognitoTableRecordKeyName];
        _recordId = value;
        
        value = [dictionary objectForKey:AWSCognitoLastModifiedFieldName];
        _lastModified = [AWSCognitoUtil millisSinceEpochToDate:[NSNumber numberWithLongLong:[value longLongValue]]];
        
        value = [dictionary objectForKey:AWSCognitoModifiedByFieldName];
        _lastModifiedBy = value;
        
        value = [dictionary objectForKey:AWSCognitoDirtyFieldName];
        _dirtyCount = [value longLongValue];
        
        value = [dictionary objectForKey:AWSCognitoSyncCountFieldName];
        _syncCount = [value longLongValue];
    }
    return self;
}

- (BOOL)isEqualMetadata:(id)object
{
    if([object isKindOfClass:[AWSCognitoRecordMetadata class]])
    {
        return NO;
    }
    
    AWSCognitoRecordMetadata *other = object;
    if (self.syncCount != other.syncCount) {
        return NO;
    }
    
    if (self.dirtyCount != other.dirtyCount) {
        return NO;
    }
    
    if (![self.recordId isEqualToString:other.recordId]) {
        return NO;
    }
    
    if (![self.lastModifiedBy isEqualToString:other.lastModifiedBy]) {
        return NO;
    }
    
    if ([self.lastModified compare:other.lastModified] != NSOrderedSame) {
        return NO;
    }

    return YES;
}

@end

@implementation AWSCognitoRecord

- (instancetype)initWithId:(NSString *)recordId
                      data:(AWSCognitoRecordValue *)data {
    self = [super initWithId:recordId];
    if (nil != self) {
        _data = data;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];

    if (nil != self) {
        _data = [[AWSCognitoRecordValue alloc] initWithString:[dictionary objectForKey:AWSCognitoRecordValueName]];
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    if(![self isEqualMetadata:object])
    {
        return NO;
    }

    AWSCognitoRecord *other = object;
    if (![[self.data toJsonString] isEqualToString:[other.data toJsonString]]) {
        return NO;
    }

    return YES;
}

- (NSDictionary *)dictionaryRepresentation
{

    NSString *lastModifiedValue = [NSString stringWithFormat:@"%lld", [AWSCognitoUtil getTimeMillisForDate:self.lastModified]];

    
    NSString *recordVersionValue= [NSString stringWithFormat:@"%lld", self.syncCount];
    
    NSString *recordTypeValue = [NSString stringWithFormat:@"%ld", (long)self.data.type];

    return [NSDictionary dictionaryWithObjectsAndKeys:
            self.recordId, AWSCognitoTableRecordKeyName,
            lastModifiedValue, AWSCognitoLastModifiedFieldName,
            self.data.string, AWSCognitoRecordValueName,
            recordTypeValue, AWSCognitoTypeFieldName,
            self.lastModifiedBy, AWSCognitoModifiedByFieldName,
            recordVersionValue, AWSCognitoSyncCountFieldName, nil];
}

- (AWSCognitoRecord *)copyForFlush
{
    AWSCognitoRecord *flushableCopy =  [[AWSCognitoRecord alloc] initWithId:self.recordId data:self.data];
    flushableCopy.lastModified = self.lastModified;
    flushableCopy.lastModifiedBy = self.lastModifiedBy;
    flushableCopy.syncCount = self.syncCount;
    flushableCopy.dirtyCount = 0;

    return flushableCopy;
}

- (AWSCognitoRecord *)copy
{
    AWSCognitoRecord *copy =  [[AWSCognitoRecord alloc] initWithId:self.recordId data:self.data];
    copy.lastModified = self.lastModified;
    copy.lastModifiedBy = self.lastModifiedBy;
    copy.syncCount = self.syncCount;
    copy.dirtyCount = self.dirtyCount;
    
    return copy;
}

- (BOOL)isDirty
{
    return self.dirtyCount != 0;
}

- (BOOL)isDeleted {
    return self.data.type == AWSCognitoRecordValueTypeDeleted;
}

- (NSString *)description
{
    NSMutableString *buffer = [NSMutableString new];

    [buffer appendString:[super description]];

    [buffer appendFormat:@"recordId: %@\n", self.recordId];
    [buffer appendFormat:@"lastModified: %@\n", self.lastModified];
    [buffer appendFormat:@"data: %@\n", self.data];
    [buffer appendFormat:@"lastModifiedBy: %@\n", self.lastModifiedBy];
    [buffer appendFormat:@"dirtyCount: %lld\n", self.dirtyCount];
    [buffer appendFormat:@"recordVersion: %lld\n", self.syncCount];
    
    return [NSString stringWithString:buffer];
}

@end

@implementation AWSCognitoRecordValue

#pragma mark - Init methods

- (instancetype)init {
    if(self = [super init]) {
        _type = AWSCognitoRecordValueTypeUnknown;
    }
    
    return self;
}

- (instancetype)initWithString:(NSString *)value {
    return [self initWithString:value type:AWSCognitoRecordValueTypeString];
}

#pragma mark - Private init methods
- (instancetype)initWithJson:(NSString *)json
                        type:(AWSCognitoRecordValueType)type {
    if(json == nil){
        return [self initWithString:nil type:type];
    }
    NSError *error;
    NSObject *value = [[NSJSONSerialization
                        JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding]
                        options:NSJSONReadingMutableContainers
                        error:&error] objectForKey:AWSCognitoDataFieldKeyName];
    NSString *stringValue = nil;
    
    switch (type) {
        case AWSCognitoRecordValueTypeString:
            stringValue = (NSString *)value;
            break;
        default:
            NSAssert(YES,@"Type: %lld is unsupported for this initializer", (long long)type);
            break;
    }
    return [self initWithString:stringValue type:type];
    
}

- (instancetype)initWithString:(NSString *)value
                          type:(AWSCognitoRecordValueType)type
{
    if(self = [super init])
    {
        _type = type;
        switch (type) {
            case AWSCognitoRecordValueTypeString:
                _stringValue = value;
                break;
            case AWSCognitoRecordValueTypeDeleted:
                _stringValue = AWSCognitoDeletedRecord;
                break;
            default:
                NSAssert(YES,@"Type: %lld is unsupported for this initializer", (long long)type);
                break;
        }
    }
    
    return self;
}
#pragma mark - Getters

- (NSString *)string
{
    if(self.type == AWSCognitoRecordValueTypeString)
    {
        return (NSString *)self.stringValue;
    }
    
    return nil;
}

#pragma mark json
- (NSString *)toJsonString
{
    if(self.stringValue == nil)
        return nil;
    
    NSObject * value = nil;
    switch (self.type) {
            
        case AWSCognitoRecordValueTypeString:
            value = self.stringValue;
            break;
        case AWSCognitoRecordValueTypeDeleted:
            value = AWSCognitoDeletedRecord;
            break;
        default:
            NSAssert(YES,@"Type: %lld is unsupported for this method", (long long)self.type);
            break;
    }
    
    if(value != nil){
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                     value, AWSCognitoDataFieldKeyName, nil]
                                                           options:0 error:&error];
        if(jsonData != nil){
            return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
    }
    return nil;
}

#pragma mark -

- (BOOL)isEqual:(id)object {
    if([object isKindOfClass:[AWSCognitoRecordValue class]]) {
        AWSCognitoRecordValue *recordValue = object;
        if(recordValue.type == self.type) {
            switch (self.type) {
                case AWSCognitoRecordValueTypeString:
                    if([recordValue.string isEqualToString:self.string]) {
                        return YES;
                    }
                    break;
                    
                case AWSCognitoRecordValueTypeDeleted:
                    return YES;
                    break;
                default:
                    break;
            }
        }
    }
    
    return NO;
}

- (NSString *)description
{
    NSMutableString *buffer = [NSMutableString new];
    
    [buffer appendString:[super description]];
    
    [buffer appendFormat:@"\nType: %lld\n", (long long)self.type];
    [buffer appendFormat:@"Value: %@", self.stringValue];
    
    return [NSString stringWithString:buffer];
}

@end

