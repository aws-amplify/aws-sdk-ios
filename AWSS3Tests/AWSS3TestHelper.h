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
#import "AWSS3.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSS3TestHelper : NSObject

+ (BOOL)createBucketWithName:(NSString *)bucketName
                   andRegion:(AWSRegionType)regionType;

+ (void)deleteAllObjectsFromBucket:(NSString *)bucketName;

+ (BOOL)deleteBucketWithName:(NSString *)bucketName;

/**
Check if the given object is present inside the bucket. This is a blocking call.

@param keyName Object key name to be checked
@param bucketName Bucket name where the object is present
@return True if the object is present inside the bucket else False
 */
+ (BOOL)checkIfObjectIsPresent:(NSString *)keyName bucket:(NSString *)bucketName;

@end

NS_ASSUME_NONNULL_END
