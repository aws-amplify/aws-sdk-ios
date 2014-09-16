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
#import "AWSNetworking.h"
#import "AWSModel.h"

FOUNDATION_EXPORT NSString *const AWSCognitoIdentityErrorDomain;

typedef NS_ENUM(NSInteger, AWSCognitoIdentityErrorType) {
    AWSCognitoIdentityErrorUnknown,
    AWSCognitoIdentityErrorIncompleteSignature,
    AWSCognitoIdentityErrorInvalidClientTokenId,
    AWSCognitoIdentityErrorMissingAuthenticationToken,
    AWSCognitoIdentityErrorInternalError,
    AWSCognitoIdentityErrorInvalidParameter,
    AWSCognitoIdentityErrorLimitExceeded,
    AWSCognitoIdentityErrorNotAuthorized,
    AWSCognitoIdentityErrorResourceConflict,
    AWSCognitoIdentityErrorResourceNotFound,
    AWSCognitoIdentityErrorTooManyRequests,
};

@class AWSCognitoIdentityCreateIdentityPoolInput;
@class AWSCognitoIdentityDeleteIdentityPoolInput;
@class AWSCognitoIdentityDescribeIdentityPoolInput;
@class AWSCognitoIdentityGetIdInput;
@class AWSCognitoIdentityGetIdResponse;
@class AWSCognitoIdentityGetOpenIdTokenInput;
@class AWSCognitoIdentityGetOpenIdTokenResponse;
@class AWSCognitoIdentityIdentityDescription;
@class AWSCognitoIdentityIdentityPool;
@class AWSCognitoIdentityIdentityPoolShortDescription;
@class AWSCognitoIdentityListIdentitiesInput;
@class AWSCognitoIdentityListIdentitiesResponse;
@class AWSCognitoIdentityListIdentityPoolsInput;
@class AWSCognitoIdentityListIdentityPoolsResponse;
@class AWSCognitoIdentityUnlinkIdentityInput;

@interface AWSCognitoIdentityCreateIdentityPoolInput : AWSRequest

@property (nonatomic, strong) NSNumber *allowUnauthenticatedIdentities;
@property (nonatomic, strong) NSString *identityPoolName;
@property (nonatomic, strong) NSDictionary *supportedLoginProviders;

@end

@interface AWSCognitoIdentityDeleteIdentityPoolInput : AWSRequest

@property (nonatomic, strong) NSString *identityPoolId;

@end

@interface AWSCognitoIdentityDescribeIdentityPoolInput : AWSRequest

@property (nonatomic, strong) NSString *identityPoolId;

@end

@interface AWSCognitoIdentityGetIdInput : AWSRequest

@property (nonatomic, strong) NSString *accountId;
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSDictionary *logins;

@end

@interface AWSCognitoIdentityGetIdResponse : AWSModel

@property (nonatomic, strong) NSString *identityId;

@end

@interface AWSCognitoIdentityGetOpenIdTokenInput : AWSRequest

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSDictionary *logins;

@end

@interface AWSCognitoIdentityGetOpenIdTokenResponse : AWSModel

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *token;

@end

@interface AWSCognitoIdentityIdentityDescription : AWSModel

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSArray *logins;

@end

@interface AWSCognitoIdentityIdentityPool : AWSRequest

@property (nonatomic, strong) NSNumber *allowUnauthenticatedIdentities;
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *identityPoolName;
@property (nonatomic, strong) NSDictionary *supportedLoginProviders;

@end

@interface AWSCognitoIdentityIdentityPoolShortDescription : AWSModel

@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *identityPoolName;

@end

@interface AWSCognitoIdentityListIdentitiesInput : AWSRequest

@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSNumber *maxResults;
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityListIdentitiesResponse : AWSModel

@property (nonatomic, strong) NSArray *identities;
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityListIdentityPoolsInput : AWSRequest

@property (nonatomic, strong) NSNumber *maxResults;
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityListIdentityPoolsResponse : AWSModel

@property (nonatomic, strong) NSArray *identityPools;
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityUnlinkIdentityInput : AWSRequest

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSDictionary *logins;
@property (nonatomic, strong) NSArray *loginsToRemove;

@end
