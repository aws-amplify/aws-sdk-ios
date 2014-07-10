/**
 * Copyright 2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 */

#import <Foundation/Foundation.h>
#import "AWSNetworking.h"
#import "AZModel.h"

FOUNDATION_EXPORT NSString *const AWSCognitoIdentityServiceErrorDomain;

typedef NS_ENUM(NSInteger, AWSCognitoIdentityServiceErrorType) {
    AWSCognitoIdentityServiceErrorUnknown,
    AWSCognitoIdentityServiceErrorIncompleteSignature,
    AWSCognitoIdentityServiceErrorInvalidClientTokenId,
    AWSCognitoIdentityServiceErrorMissingAuthenticationToken,
    AWSCognitoIdentityServiceErrorInternalError,
    AWSCognitoIdentityServiceErrorInvalidParameter,
    AWSCognitoIdentityServiceErrorLimitExceeded,
    AWSCognitoIdentityServiceErrorNotAuthorized,
    AWSCognitoIdentityServiceErrorResourceConflict,
    AWSCognitoIdentityServiceErrorResourceNotFound,
    AWSCognitoIdentityServiceErrorTooManyRequests,
};

@class AWSCognitoIdentityServiceCreateIdentityPoolInput;
@class AWSCognitoIdentityServiceDeleteIdentityPoolInput;
@class AWSCognitoIdentityServiceDescribeIdentityPoolInput;
@class AWSCognitoIdentityServiceGetIdInput;
@class AWSCognitoIdentityServiceGetIdResponse;
@class AWSCognitoIdentityServiceGetOpenIdTokenInput;
@class AWSCognitoIdentityServiceGetOpenIdTokenResponse;
@class AWSCognitoIdentityServiceIdentityDescription;
@class AWSCognitoIdentityServiceIdentityPool;
@class AWSCognitoIdentityServiceIdentityPoolShortDescription;
@class AWSCognitoIdentityServiceListIdentitiesInput;
@class AWSCognitoIdentityServiceListIdentitiesResponse;
@class AWSCognitoIdentityServiceListIdentityPoolsInput;
@class AWSCognitoIdentityServiceListIdentityPoolsResponse;
@class AWSCognitoIdentityServiceUnlinkIdentityInput;

@interface AWSCognitoIdentityServiceCreateIdentityPoolInput : AWSRequest

@property (nonatomic, strong) NSNumber *allowUnauthenticatedIdentities;
@property (nonatomic, strong) NSString *identityPoolName;
@property (nonatomic, strong) NSDictionary *supportedLoginProviders;

@end

@interface AWSCognitoIdentityServiceDeleteIdentityPoolInput : AWSRequest

@property (nonatomic, strong) NSString *identityPoolId;

@end

@interface AWSCognitoIdentityServiceDescribeIdentityPoolInput : AWSRequest

@property (nonatomic, strong) NSString *identityPoolId;

@end

@interface AWSCognitoIdentityServiceGetIdInput : AWSRequest

@property (nonatomic, strong) NSString *accountId;
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSDictionary *logins;

@end

@interface AWSCognitoIdentityServiceGetIdResponse : AZModel

@property (nonatomic, strong) NSString *identityId;

@end

@interface AWSCognitoIdentityServiceGetOpenIdTokenInput : AWSRequest

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSDictionary *logins;

@end

@interface AWSCognitoIdentityServiceGetOpenIdTokenResponse : AZModel

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *token;

@end

@interface AWSCognitoIdentityServiceIdentityDescription : AZModel

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSArray *logins;

@end

@interface AWSCognitoIdentityServiceIdentityPool : AWSRequest

@property (nonatomic, strong) NSNumber *allowUnauthenticatedIdentities;
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *identityPoolName;
@property (nonatomic, strong) NSDictionary *supportedLoginProviders;

@end

@interface AWSCognitoIdentityServiceIdentityPoolShortDescription : AZModel

@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *identityPoolName;

@end

@interface AWSCognitoIdentityServiceListIdentitiesInput : AWSRequest

@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSNumber *maxResults;
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityServiceListIdentitiesResponse : AZModel

@property (nonatomic, strong) NSArray *identities;
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityServiceListIdentityPoolsInput : AWSRequest

@property (nonatomic, strong) NSNumber *maxResults;
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityServiceListIdentityPoolsResponse : AZModel

@property (nonatomic, strong) NSArray *identityPools;
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityServiceUnlinkIdentityInput : AWSRequest

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSDictionary *logins;
@property (nonatomic, strong) NSArray *loginsToRemove;

@end
