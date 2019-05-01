//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
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

