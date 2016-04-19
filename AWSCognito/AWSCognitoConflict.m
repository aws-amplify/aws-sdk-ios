//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License").
// You may not use this file except in compliance with the
// License. A copy of the License is located at
//
//     http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, express or implied. See the License
// for the specific language governing permissions and
// limitations under the License.
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

