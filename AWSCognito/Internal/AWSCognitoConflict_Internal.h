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