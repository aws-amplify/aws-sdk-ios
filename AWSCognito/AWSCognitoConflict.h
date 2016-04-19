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

#import <Foundation/Foundation.h>

@class AWSCognitoRecord;

/**
 An object that encapsulates a resolved conflict in Amazon Cognito.
 */
@interface AWSCognitoResolvedConflict : NSObject
@end

/**
 An object that encapsulates a tuple of Amazon Cognito records.
 */
@interface AWSCognitoRecordTuple : NSObject
/**
 The local copy of the record.
 */
@property (nonatomic, readonly) AWSCognitoRecord *localRecord;
/**
 The remote (cloud) copy of the record.
 */
@property (nonatomic, readonly) AWSCognitoRecord *remoteRecord;
@end

/**
 An object that encapsulates a conflicting record where both
 the local and remote have been modified since the last synchronization.
 */
@interface AWSCognitoConflict : AWSCognitoRecordTuple

/**
 Create a AWSCognitoResolvedConflict object with the value of the
 local record.
 
 @return AWSCognitoResolvedConflict object using local value
 */
-(AWSCognitoResolvedConflict *) resolveWithLocalRecord;
/**
 Create a AWSCognitoResolvedConflict object with the value of the
 remote (cloud) record.
 
 @return AWSCognitoResolvedConflict object using remote (cloud) value
 */
-(AWSCognitoResolvedConflict *) resolveWithRemoteRecord;
/**
 Create a AWSCognitoResolvedConflict object with a custom value that
 is neither the local nor remote value.
 
 @param value the value to use to resolve the conflict
 
 @return AWSCognitoResolvedConflict object using passed value
 */
-(AWSCognitoResolvedConflict *) resolveWithValue:(NSString *)value;
@end

