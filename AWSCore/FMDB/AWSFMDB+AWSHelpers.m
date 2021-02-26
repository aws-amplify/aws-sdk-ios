//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <sqlite3.h>
#import "AWSFMDB+AWSHelpers.h"

@implementation AWSFMDatabaseQueue (AWSHelpers)

+ (instancetype)serialDatabaseQueueWithPath:(NSString*)aPath {
    // Open the database queue in readwrite mode, creating if necessary, with full mutex to prevent errors
    // when accessing across threads.
    int flags = SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE | SQLITE_OPEN_FULLMUTEX;
    return [AWSFMDatabaseQueue databaseQueueWithPath:aPath
                                               flags:flags];
}

@end

@implementation AWSFMDatabasePool (AWSHelpers)

+ (instancetype)serialDatabasePoolWithPath:(NSString*)aPath {
    // Open the database pool in readwrite mode, creating if necessary, with full mutex to prevent errors
    // when accessing across threads.
    int flags = SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE | SQLITE_OPEN_FULLMUTEX;
    return [AWSFMDatabasePool databasePoolWithPath:aPath
                                             flags:flags];
}

@end
