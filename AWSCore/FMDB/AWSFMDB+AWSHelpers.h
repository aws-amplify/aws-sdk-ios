//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <AWSCore/AWSCore.h>
#import "AWSFMDatabasePool.h"
#import "AWSFMDatabaseQueue.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSFMDatabaseQueue (AWSHelpers)

/**
 Convenience method to open a database queue with the SQLITE_OPEN_FULLMUTEX flag so it can be safely accessed across
 threads.

 @param aPath The file path of the database.

 @return The `FMDatabaseQueue` object. `nil` on error.
 */

+ (instancetype)serialDatabaseQueueWithPath:(NSString*)aPath;

@end


@interface AWSFMDatabasePool (AWSHelpers)

/**
 Convenience method to create a database pool with the SQLITE_OPEN_FULLMUTEX flag so it can be safely accessed across
 threads.

 @param aPath The file path of the database.

 @return The `FMDatabasePool` object. `nil` on error.
 */

+ (instancetype)serialDatabasePoolWithPath:(NSString*)aPath;

@end

NS_ASSUME_NONNULL_END
