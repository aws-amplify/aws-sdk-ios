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

#import "AWSS3TestHelper.h"

@interface AWSS3CreateBucketConfiguration()

+ (NSValueTransformer *)locationConstraintJSONTransformer;

@end

@interface AWSEndpoint()

+ (NSString *)regionNameFromType:(AWSRegionType)regionType;

@end

@implementation AWSS3TestHelper

+ (BOOL)createBucketWithName:(NSString *)bucketName
                   andRegion:(AWSRegionType)regionType {
    
    AWSS3 *s3 = [AWSS3 defaultS3];
    
    AWSS3CreateBucketRequest *createBucketReq = [AWSS3CreateBucketRequest new];
    createBucketReq.bucket = bucketName;
    
    if (regionType != AWSRegionUSEast1) {
        NSString *regionName = [AWSEndpoint regionNameFromType:regionType];
        NSValueTransformer *locationConstraintTransformer = [AWSS3CreateBucketConfiguration locationConstraintJSONTransformer];
        NSNumber *constraint = [locationConstraintTransformer transformedValue:regionName];
        AWSS3BucketLocationConstraint dupcon = constraint.integerValue;
        AWSS3CreateBucketConfiguration *createBucketConfiguration = [AWSS3CreateBucketConfiguration new];
        createBucketConfiguration.locationConstraint = dupcon;
        createBucketReq.createBucketConfiguration = createBucketConfiguration;
    }

    
    __block BOOL success = NO;
    [[[s3 createBucket:createBucketReq] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            success = NO;
        } else {
            success = YES;
        }
        return nil;
    }] waitUntilFinished];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    return success;
}

+ (BOOL)deleteBucketWithName:(NSString *)bucketName {
    AWSS3 *s3 = [AWSS3 defaultS3];
    
    AWSS3ListObjectVersionsRequest *listObjectVersionsRequest = [AWSS3ListObjectVersionsRequest new];
    listObjectVersionsRequest.bucket = bucketName;
    
    [[[s3 listObjectVersions:listObjectVersionsRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        NSMutableArray *tasks = [NSMutableArray new];
        
        AWSS3ListObjectVersionsOutput *listObjectVersionsOutput = task.result;
        for (AWSS3ObjectVersion *version in listObjectVersionsOutput.versions) {
            AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
            deleteObjectRequest.bucket = bucketName;
            deleteObjectRequest.key = version.key;
            deleteObjectRequest.versionId = version.versionId;
            AWSTask *task = [s3 deleteObject:deleteObjectRequest];
            [tasks addObject:task];
        }
        for (AWSS3DeleteMarkerEntry *deleteMarker in listObjectVersionsOutput.deleteMarkers) {
            AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
            deleteObjectRequest.bucket = bucketName;
            deleteObjectRequest.key = deleteMarker.key;
            deleteObjectRequest.versionId = deleteMarker.versionId;
            AWSTask *task = [s3 deleteObject:deleteObjectRequest];
            [tasks addObject:task];
        }
        
        return [AWSTask taskForCompletionOfAllTasks:tasks];
    }] waitUntilFinished];
    
    AWSS3DeleteBucketRequest *deleteBucketReq = [AWSS3DeleteBucketRequest new];
    deleteBucketReq.bucket = bucketName;
    
    __block BOOL success = NO;
    [[[s3 deleteBucket:deleteBucketReq] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            success = NO;
        } else {
            success = YES;
        }
        return nil;
    }] waitUntilFinished];
    
    return success;
}

+ (void)deleteAllObjectsFromBucket:(NSString *)bucketName {
    AWSS3 *s3 = [AWSS3 defaultS3];
    
    AWSS3ListObjectsRequest *listObjectsRequest = [AWSS3ListObjectsRequest new];
    listObjectsRequest.bucket = bucketName;
    
    [[[s3 listObjects:listObjectsRequest] continueWithBlock:^id(AWSTask *task) {
        AWSS3ListObjectsOutput *output = task.result;
        AWSS3DeleteObjectsRequest *deleteObjectsRequest = [AWSS3DeleteObjectsRequest new];
        deleteObjectsRequest.bucket = bucketName;
        AWSS3Remove *s3Remove = [AWSS3Remove new];
        NSMutableArray *objects = [NSMutableArray new];
        for (AWSS3Object *object in output.contents) {
            AWSS3ObjectIdentifier *identifier = [AWSS3ObjectIdentifier new];
            identifier.key = object.key;
            [objects addObject:identifier];
        }
        s3Remove.objects = objects;
        deleteObjectsRequest.remove = s3Remove;
        [[s3 deleteObjects:deleteObjectsRequest] continueWithBlock:^id(AWSTask *task) {
            if (task.error) {
                NSLog(@"Failed to delete: %@", task.error);
            } else {
                NSLog(@"Successfully deleted: %@", objects);
            }
            return nil;
        }];
        return nil;
    }] waitUntilFinished];
}

+ (BOOL)checkIfObjectIsPresent:(NSString *)keyName bucket:(NSString *)bucketName {
    AWSS3 *s3 = [AWSS3 defaultS3];
    AWSS3HeadObjectRequest *headObjectRequest = [AWSS3HeadObjectRequest new];
    headObjectRequest.bucket = bucketName;
    headObjectRequest.key = keyName;
    __block BOOL success = NO;
    [[[s3 headObject:headObjectRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            success = NO;
        } else {
            success = YES;
        }
        return nil;
    }] waitUntilFinished];
    return success;
}

@end
