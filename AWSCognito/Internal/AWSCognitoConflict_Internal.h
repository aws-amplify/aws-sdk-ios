//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import "AWSCognitoConflict.h"

@interface AWSCognitoRecordTuple ()
-(instancetype) initWithLocalRecord:(AWSCognitoRecord *)local remoteRecord:(AWSCognitoRecord *)remote;
@end

@interface AWSCognitoResolvedConflict()
@property (nonatomic, readonly) AWSCognitoRecord *resolvedConflict;
@property (nonatomic, readonly) AWSCognitoConflict *conflict;
- (instancetype) initWithRemoteRecord:(AWSCognitoConflict *)conflict;
- (instancetype) initWithLocalRecord:(AWSCognitoConflict *)conflict;
- (instancetype) initWithValue:(AWSCognitoConflict *)conflict newValue:(NSString *)value;
+ (instancetype) resolvedConflictWithRemoteRecord:(AWSCognitoConflict *)conflict;
+ (instancetype) resolvedConflictWithLocalRecord:(AWSCognitoConflict *)conflict;
+ (instancetype) resolvedConflictWithValue:(AWSCognitoConflict *)conflict newValue:(NSString *)value;
@end
