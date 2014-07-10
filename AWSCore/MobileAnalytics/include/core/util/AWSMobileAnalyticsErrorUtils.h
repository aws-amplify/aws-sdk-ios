/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>

//FOUNDATION_EXPORT NSInteger const IO_STREAM_CLOSED;
//FOUNDATION_EXPORT NSInteger const IO_STREAM_NO_BYTES_WRITTEN;
//FOUNDATION_EXPORT NSInteger const IO_ENCRYPTION_CHECKSUM_GENERATION_FAILED;
//FOUNDATION_EXPORT NSInteger const IO_ENCRYPTION_CHECKSUM_LENGTH;
//FOUNDATION_EXPORT NSInteger const IO_ENCRYPTION_CHECKSUM_INVALID;


@interface AWSMobileAnalyticsErrorUtils : NSObject

+(NSError *) errorWithDomain:(NSString *) theDomain
             withDescription:(NSString *) theDescription
               withErrorCode:(int) theErrorCode;

+(BOOL) safeSetError:(NSError **)theProvidedError
           withError:(NSError *)theError;
@end
