//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSS3/AWSS3.h>

@implementation AWSS3TransferUtility (Validation)

- (AWSTask *) validateParameters: (NSString * )bucket key:(NSString *)key fileURL:(NSURL *)fileURL accelerationModeEnabled: (BOOL) accelerationModeEnabled
{
    AWSTask *validationError = [self validateParameters:bucket key:key accelerationModeEnabled:accelerationModeEnabled];
    
    if (validationError) {
        return validationError;
    }
    
    NSString *filePath = [fileURL path];
    // Error out if the length of file name < minimum file path length (2 characters) or file does not exist
    if ([filePath length] < 2 ||
        ! [[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                                          code:AWSS3TransferUtilityErrorLocalFileNotFound
                                                      userInfo:nil]];
    }
    return nil;
}

- (AWSTask *) validateParameters: (NSString * )bucket key:(NSString *)key accelerationModeEnabled: (BOOL) accelerationModeEnabled
{
    //Validate input parameter: bucket
    if (!bucket || [bucket length] == 0) {
        NSInteger errorCode = (accelerationModeEnabled) ?
        AWSS3PresignedURLErrorInvalidBucketNameForAccelerateModeEnabled : AWSS3PresignedURLErrorInvalidBucketName;
    
        NSString *errorMessage = @"Invalid bucket specified. Please specify a bucket name or configure the bucket property in `AWSS3TransferUtilityConfiguration`.";
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errorMessage
                                                         forKey:NSLocalizedDescriptionKey];
    
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                      code:errorCode
                                                  userInfo:userInfo]];
    }

    
    if (!key || [key length] == 0) {
        NSString *errorMessage = [NSString stringWithFormat: @"Empty key specified"];
        
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errorMessage
                                                             forKey:NSLocalizedDescriptionKey];
        
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                                          code:AWSS3TransferUtilityErrorClientError
                                                      userInfo:userInfo]];
    }
    return nil;
}
@end
