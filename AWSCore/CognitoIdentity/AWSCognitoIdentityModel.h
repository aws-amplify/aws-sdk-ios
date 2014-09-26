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
    AWSCognitoIdentityErrorDeveloperUserAlreadyRegistered,
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
@class AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput;
@class AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse;
@class AWSCognitoIdentityGetOpenIdTokenInput;
@class AWSCognitoIdentityGetOpenIdTokenResponse;
@class AWSCognitoIdentityIdentityDescription;
@class AWSCognitoIdentityIdentityPool;
@class AWSCognitoIdentityIdentityPoolShortDescription;
@class AWSCognitoIdentityListIdentitiesInput;
@class AWSCognitoIdentityListIdentitiesResponse;
@class AWSCognitoIdentityListIdentityPoolsInput;
@class AWSCognitoIdentityListIdentityPoolsResponse;
@class AWSCognitoIdentityLookupDeveloperIdentityInput;
@class AWSCognitoIdentityLookupDeveloperIdentityResponse;
@class AWSCognitoIdentityMergeDeveloperIdentitiesInput;
@class AWSCognitoIdentityMergeDeveloperIdentitiesResponse;
@class AWSCognitoIdentityUnlinkDeveloperIdentityInput;
@class AWSCognitoIdentityUnlinkIdentityInput;

/**
 * <p>Input to the CreateIdentityPool action.</p>
 * Required parameters: [IdentityPoolName, AllowUnauthenticatedIdentities]
 */
@interface AWSCognitoIdentityCreateIdentityPoolInput : AWSRequest


/**
 * <p>TRUE if the identity pool supports unauthenticated logins.</p>
 */
@property (nonatomic, strong) NSNumber *allowUnauthenticatedIdentities;
@property (nonatomic, strong) NSString *developerProviderName;

/**
 * <p>A string that you provide.</p>
 */
@property (nonatomic, strong) NSString *identityPoolName;

/**
 * <p>Optional key:value pairs mapping provider names to provider app IDs.</p>
 */
@property (nonatomic, strong) NSDictionary *supportedLoginProviders;

@end

/**
 * <p>Input to the DeleteIdentityPool action.</p>
 * Required parameters: [IdentityPoolId]
 */
@interface AWSCognitoIdentityDeleteIdentityPoolInput : AWSRequest


/**
 * An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityPoolId;

@end

/**
 * Input to the DescribeIdentityPool action.
 * Required parameters: [IdentityPoolId]
 */
@interface AWSCognitoIdentityDescribeIdentityPoolInput : AWSRequest


/**
 * An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityPoolId;

@end

/**
 * Input to the GetId action.
 * Required parameters: [AccountId, IdentityPoolId]
 */
@interface AWSCognitoIdentityGetIdInput : AWSRequest


/**
 * A standard AWS account ID (9+ digits).
 */
@property (nonatomic, strong) NSString *accountId;

/**
 * An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityPoolId;

/**
 * <p>A set of optional name/value pairs that map provider names to provider tokens.</p><p>The available provider names for <code>Logins</code> are as follows: <ul><li>Facebook: <code>graph.facebook.com</code></li><li>Google: <code>accounts.google.com</code></li><li>Amazon: <code>www.amazon.com</code></li></ul></p>
 */
@property (nonatomic, strong) NSDictionary *logins;

@end

/**
 * Returned in the response to a GetId request.
 */
@interface AWSCognitoIdentityGetIdResponse : AWSModel


/**
 * A unique identifier in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityId;

@end

@interface AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput : AWSRequest

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSDictionary *logins;
@property (nonatomic, strong) NSNumber *tokenDuration;

@end

@interface AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse : AWSModel

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *token;

@end

/**
 * Input to the GetOpenIdToken action.
 * Required parameters: [IdentityId]
 */
@interface AWSCognitoIdentityGetOpenIdTokenInput : AWSRequest


/**
 * A unique identifier in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityId;

/**
 * A set of optional name/value pairs that map provider names to provider tokens.
 */
@property (nonatomic, strong) NSDictionary *logins;

@end

/**
 * Returned in response to a successful GetOpenIdToken request.
 */
@interface AWSCognitoIdentityGetOpenIdTokenResponse : AWSModel


/**
 * A unique identifier in the format REGION:GUID. Note that the IdentityId returned may not match the one passed on input.
 */
@property (nonatomic, strong) NSString *identityId;

/**
 * An OpenID token, valid for 15 minutes.
 */
@property (nonatomic, strong) NSString *token;

@end

/**
 * A description of the identity.
 */
@interface AWSCognitoIdentityIdentityDescription : AWSModel


/**
 * A unique identifier in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityId;

/**
 * A set of optional name/value pairs that map provider names to provider tokens.
 */
@property (nonatomic, strong) NSArray *logins;

@end

/**
 * An object representing a Cognito identity pool.
 * Required parameters: [IdentityPoolId, IdentityPoolName, AllowUnauthenticatedIdentities]
 */
@interface AWSCognitoIdentityIdentityPool : AWSRequest


/**
 * TRUE if the identity pool supports unauthenticated logins.
 */
@property (nonatomic, strong) NSNumber *allowUnauthenticatedIdentities;
@property (nonatomic, strong) NSString *developerProviderName;

/**
 * An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityPoolId;

/**
 * <p>A string that you provide.</p>
 */
@property (nonatomic, strong) NSString *identityPoolName;

/**
 * <p>Optional key:value pairs mapping provider names to provider app IDs.</p>
 */
@property (nonatomic, strong) NSDictionary *supportedLoginProviders;

@end

/**
 * A description of the identity pool.
 */
@interface AWSCognitoIdentityIdentityPoolShortDescription : AWSModel


/**
 * An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityPoolId;

/**
 * A string that you provide.
 */
@property (nonatomic, strong) NSString *identityPoolName;

@end

/**
 * Input to the ListIdentities action.
 * Required parameters: [IdentityPoolId, MaxResults]
 */
@interface AWSCognitoIdentityListIdentitiesInput : AWSRequest


/**
 * An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityPoolId;

/**
 * The maximum number of identities to return.
 */
@property (nonatomic, strong) NSNumber *maxResults;

/**
 * A pagination token.
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * The response to a ListIdentities request.
 */
@interface AWSCognitoIdentityListIdentitiesResponse : AWSModel


/**
 * An object containing a set of identities and associated mappings.
 */
@property (nonatomic, strong) NSArray *identities;

/**
 * An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityPoolId;

/**
 * A pagination token.
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * Input to the ListIdentityPools action.
 * Required parameters: [MaxResults]
 */
@interface AWSCognitoIdentityListIdentityPoolsInput : AWSRequest


/**
 * The maximum number of identities to return.
 */
@property (nonatomic, strong) NSNumber *maxResults;

/**
 * A pagination token.
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * The result of a successful ListIdentityPools action.
 */
@interface AWSCognitoIdentityListIdentityPoolsResponse : AWSModel


/**
 * The identity pools returned by the ListIdentityPools action.
 */
@property (nonatomic, strong) NSArray *identityPools;

/**
 * A pagination token.
 */
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityLookupDeveloperIdentityInput : AWSRequest

@property (nonatomic, strong) NSString *developerUserIdentifier;
@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSNumber *maxResults;
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityLookupDeveloperIdentityResponse : AWSModel

@property (nonatomic, strong) NSArray *developerUserIdentifierList;
@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSCognitoIdentityMergeDeveloperIdentitiesInput : AWSRequest

@property (nonatomic, strong) NSString *destinationUserIdentifier;
@property (nonatomic, strong) NSString *developerProviderName;
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *sourceUserIdentifier;

@end

@interface AWSCognitoIdentityMergeDeveloperIdentitiesResponse : AWSModel

@property (nonatomic, strong) NSString *identityId;

@end

@interface AWSCognitoIdentityUnlinkDeveloperIdentityInput : AWSRequest

@property (nonatomic, strong) NSString *developerProviderName;
@property (nonatomic, strong) NSString *developerUserIdentifier;
@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *identityPoolId;

@end

/**
 * Input to the UnlinkIdentity action.
 * Required parameters: [IdentityId, Logins, LoginsToRemove]
 */
@interface AWSCognitoIdentityUnlinkIdentityInput : AWSRequest


/**
 * A unique identifier in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString *identityId;

/**
 * A set of optional name/value pairs that map provider names to provider tokens.
 */
@property (nonatomic, strong) NSDictionary *logins;

/**
 * Provider names to unlink from this identity.
 */
@property (nonatomic, strong) NSArray *loginsToRemove;

@end
