//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import "AWSCognitoConflict_Internal.h"
#import "AWSCognitoRecord.h"


@implementation AWSCognitoRecordTuple
-(instancetype) initWithLocalRecord:(AWSCognitoRecord *) local remoteRecord:(AWSCognitoRecord *) remote {
    self = [super init];
    if (nil != self) {
        _localRecord = local;
        _remoteRecord = remote;
    }
    return self;
}
@end

@implementation AWSCognitoConflict
-(AWSCognitoResolvedConflict *) resolveWithLocalRecord {
    return [AWSCognitoResolvedConflict resolvedConflictWithLocalRecord:self];
}

-(AWSCognitoResolvedConflict *) resolveWithRemoteRecord {
    return [AWSCognitoResolvedConflict resolvedConflictWithRemoteRecord:self];
}

-(AWSCognitoResolvedConflict *) resolveWithValue:(NSString *)value {
    return [AWSCognitoResolvedConflict resolvedConflictWithValue:self newValue:value];
}

@end

@implementation AWSCognitoResolvedConflict
- (instancetype) initWithRemoteRecord:(AWSCognitoConflict *) conflict {
    self = [super init];
    if (nil != self) {
        _conflict = conflict;
        _resolvedConflict = [conflict.remoteRecord copy];
    }
    return self;
}

- (instancetype) initWithLocalRecord:(AWSCognitoConflict *) conflict {
    self = [super init];
    if (nil != self) {
        _conflict = conflict;
        _resolvedConflict = [conflict.localRecord copy];
        _resolvedConflict.syncCount = conflict.remoteRecord.syncCount;
    }
    return self;
}

- (instancetype) initWithValue:(AWSCognitoConflict *)conflict newValue:(NSString *)value {
    self = [self initWithLocalRecord:conflict];
    if (nil != self) {
        _resolvedConflict.data = [[AWSCognitoRecordValue alloc] initWithString:value];
    }
    return self;
}

+ (instancetype) resolvedConflictWithRemoteRecord:(AWSCognitoConflict *)conflict {
    return [[AWSCognitoResolvedConflict alloc] initWithRemoteRecord:conflict];
}

+ (instancetype) resolvedConflictWithLocalRecord:(AWSCognitoConflict *)conflict {
    return [[AWSCognitoResolvedConflict alloc] initWithLocalRecord:conflict];
}

+ (instancetype) resolvedConflictWithValue:(AWSCognitoConflict *)conflict newValue:(NSString *)value {
    return [[AWSCognitoResolvedConflict alloc] initWithValue:conflict newValue:value];
}

@end

