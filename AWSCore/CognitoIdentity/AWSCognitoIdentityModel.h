//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSNetworking.h"
#import "AWSModel.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSCognitoIdentityErrorDomain;

typedef NS_ENUM(NSInteger, AWSCognitoIdentityErrorType) {
    AWSCognitoIdentityErrorUnknown,
    AWSCognitoIdentityErrorIncompleteSignature,
    AWSCognitoIdentityErrorInvalidClientTokenId,
    AWSCognitoIdentityErrorMissingAuthenticationToken,
    AWSCognitoIdentityErrorDeveloperUserAlreadyRegistered,
    AWSCognitoIdentityErrorExternalService,
    AWSCognitoIdentityErrorInternalError,
    AWSCognitoIdentityErrorInvalidIdentityPoolConfiguration,
    AWSCognitoIdentityErrorInvalidParameter,
    AWSCognitoIdentityErrorLimitExceeded,
    AWSCognitoIdentityErrorNotAuthorized,
    AWSCognitoIdentityErrorResourceConflict,
    AWSCognitoIdentityErrorResourceNotFound,
    AWSCognitoIdentityErrorTooManyRequests,
};

@class AWSCognitoIdentityCreateIdentityPoolInput;
@class AWSCognitoIdentityCredentials;
@class AWSCognitoIdentityDeleteIdentityPoolInput;
@class AWSCognitoIdentityDescribeIdentityInput;
@class AWSCognitoIdentityDescribeIdentityPoolInput;
@class AWSCognitoIdentityGetCredentialsForIdentityInput;
@class AWSCognitoIdentityGetCredentialsForIdentityResponse;
@class AWSCognitoIdentityGetIdInput;
@class AWSCognitoIdentityGetIdResponse;
@class AWSCognitoIdentityGetIdentityPoolRolesInput;
@class AWSCognitoIdentityGetIdentityPoolRolesResponse;
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
@class AWSCognitoIdentitySetIdentityPoolRolesInput;
@class AWSCognitoIdentityUnlinkDeveloperIdentityInput;
@class AWSCognitoIdentityUnlinkIdentityInput;

/**
 <p>Input to the CreateIdentityPool action.</p>
 Required parameters: [IdentityPoolName, AllowUnauthenticatedIdentities]
 */
@interface AWSCognitoIdentityCreateIdentityPoolInput : AWSRequest


/**
 <p>TRUE if the identity pool supports unauthenticated logins.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowUnauthenticatedIdentities;

/**
 <p>The "domain" by which Cognito will refer to your users. This name acts as a placeholder that allows your backend and the Cognito service to communicate about the developer provider. For the <code>DeveloperProviderName</code>, you can use letters as well as period (<code>.</code>), underscore (<code>_</code>), and dash (<code>-</code>).</p><p>Once you have set a developer provider name, you cannot change it. Please take care in setting this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable developerProviderName;

/**
 <p>A string that you provide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolName;

/**
 <p>A list of OpendID Connect provider ARNs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable openIdConnectProviderARNs;

/**
 <p>Optional key:value pairs mapping provider names to provider app IDs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable supportedLoginProviders;

@end

/**
 <p>Credentials for the the provided identity ID.</p>
 */
@interface AWSCognitoIdentityCredentials : AWSModel


/**
 <p>The Access Key portion of the credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessKeyId;

/**
 <p>The date at which these credentials will expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiration;

/**
 <p>The Secret Access Key portion of the credentials</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretKey;

/**
 <p>The Session Token portion of the credentials</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionToken;

@end

/**
 <p>Input to the DeleteIdentityPool action.</p>
 Required parameters: [IdentityPoolId]
 */
@interface AWSCognitoIdentityDeleteIdentityPoolInput : AWSRequest


/**
 An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

@end

/**
 <p>Input to the <code>DescribeIdentity</code> action.</p>
 Required parameters: [IdentityId]
 */
@interface AWSCognitoIdentityDescribeIdentityInput : AWSRequest


/**
 <p>A unique identifier in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

@end

/**
 Input to the DescribeIdentityPool action.
 Required parameters: [IdentityPoolId]
 */
@interface AWSCognitoIdentityDescribeIdentityPoolInput : AWSRequest


/**
 An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

@end

/**
 <p>Input to the <code>GetCredentialsForIdentity</code> action.</p>
 Required parameters: [IdentityId]
 */
@interface AWSCognitoIdentityGetCredentialsForIdentityInput : AWSRequest


/**
 <p>A unique identifier in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 <p>A set of optional name-value pairs that map provider names to provider tokens.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable logins;

@end

/**
 <p>Returned in response to a successful <code>GetCredentialsForIdentity</code> operation.</p>
 */
@interface AWSCognitoIdentityGetCredentialsForIdentityResponse : AWSModel


/**
 <p>Credentials for the the provided identity ID.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityCredentials * _Nullable credentials;

/**
 <p>A unique identifier in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

@end

/**
 Input to the GetId action.
 Required parameters: [IdentityPoolId]
 */
@interface AWSCognitoIdentityGetIdInput : AWSRequest


/**
 A standard AWS account ID (9+ digits).
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 <p>A set of optional name-value pairs that map provider names to provider tokens.</p><p>The available provider names for <code>Logins</code> are as follows: <ul><li>Facebook: <code>graph.facebook.com</code></li><li>Google: <code>accounts.google.com</code></li><li>Amazon: <code>www.amazon.com</code></li><li>Twitter: <code>www.twitter.com</code></li><li>Digits: <code>www.digits.com</code></li></ul></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable logins;

@end

/**
 Returned in response to a GetId request.
 */
@interface AWSCognitoIdentityGetIdResponse : AWSModel


/**
 A unique identifier in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

@end

/**
 <p>Input to the <code>GetIdentityPoolRoles</code> action.</p>
 Required parameters: [IdentityPoolId]
 */
@interface AWSCognitoIdentityGetIdentityPoolRolesInput : AWSRequest


/**
 <p>An identity pool ID in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

@end

/**
 <p>Returned in response to a successful <code>GetIdentityPoolRoles</code> operation.</p>
 */
@interface AWSCognitoIdentityGetIdentityPoolRolesResponse : AWSModel


/**
 <p>An identity pool ID in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 <p>The map of roles associated with this pool. Currently only authenticated and unauthenticated roles are supported.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable roles;

@end

/**
 <p>Input to the <code>GetOpenIdTokenForDeveloperIdentity</code> action.</p>
 Required parameters: [IdentityPoolId, Logins]
 */
@interface AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput : AWSRequest


/**
 <p>A unique identifier in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 <p>An identity pool ID in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 <p>A set of optional name-value pairs that map provider names to provider tokens. Each name-value pair represents a user from a public provider or developer provider. If the user is from a developer provider, the name-value pair will follow the syntax <code>"developer_provider_name": "developer_user_identifier"</code>. The developer provider is the "domain" by which Cognito will refer to your users; you provided this domain while creating/updating the identity pool. The developer user identifier is an identifier from your backend that uniquely identifies a user. When you create an identity pool, you can specify the supported logins.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable logins;

/**
 <p>The expiration time of the token, in seconds. You can specify a custom expiration time for the token so that you can cache it. If you don't provide an expiration time, the token is valid for 15 minutes. You can exchange the token with Amazon STS for temporary AWS credentials, which are valid for a maximum of one hour. The maximum token duration you can set is 24 hours. You should take care in setting the expiration time for a token, as there are significant security implications: an attacker could use a leaked token to access your AWS resources for the token's duration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tokenDuration;

@end

/**
 <p>Returned in response to a successful <code>GetOpenIdTokenForDeveloperIdentity</code> request.</p>
 */
@interface AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse : AWSModel


/**
 <p>A unique identifier in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 <p>An OpenID token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 Input to the GetOpenIdToken action.
 Required parameters: [IdentityId]
 */
@interface AWSCognitoIdentityGetOpenIdTokenInput : AWSRequest


/**
 A unique identifier in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 A set of optional name-value pairs that map provider names to provider tokens. When using graph.facebook.com and www.amazon.com, supply the access_token returned from the provider's authflow. For accounts.google.com or any other OpenId Connect provider, always include the id_token.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable logins;

@end

/**
 Returned in response to a successful GetOpenIdToken request.
 */
@interface AWSCognitoIdentityGetOpenIdTokenResponse : AWSModel


/**
 A unique identifier in the format REGION:GUID. Note that the IdentityId returned may not match the one passed on input.
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 An OpenID token, valid for 15 minutes.
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 A description of the identity.
 */
@interface AWSCognitoIdentityIdentityDescription : AWSModel


/**
 <p>Date on which the identity was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 A unique identifier in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 <p>Date on which the identity was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 A set of optional name-value pairs that map provider names to provider tokens.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logins;

@end

/**
 An object representing a Cognito identity pool.
 Required parameters: [IdentityPoolId, IdentityPoolName, AllowUnauthenticatedIdentities]
 */
@interface AWSCognitoIdentityIdentityPool : AWSRequest


/**
 TRUE if the identity pool supports unauthenticated logins.
 */
@property (nonatomic, strong) NSNumber * _Nullable allowUnauthenticatedIdentities;

/**
 <p>The "domain" by which Cognito will refer to your users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable developerProviderName;

/**
 An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 <p>A string that you provide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolName;

/**
 <p>A list of OpendID Connect provider ARNs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable openIdConnectProviderARNs;

/**
 <p>Optional key:value pairs mapping provider names to provider app IDs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable supportedLoginProviders;

@end

/**
 A description of the identity pool.
 */
@interface AWSCognitoIdentityIdentityPoolShortDescription : AWSModel


/**
 An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 A string that you provide.
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolName;

@end

/**
 Input to the ListIdentities action.
 Required parameters: [IdentityPoolId, MaxResults]
 */
@interface AWSCognitoIdentityListIdentitiesInput : AWSRequest


/**
 An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 The maximum number of identities to return.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 A pagination token.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 The response to a ListIdentities request.
 */
@interface AWSCognitoIdentityListIdentitiesResponse : AWSModel


/**
 An object containing a set of identities and associated mappings.
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityIdentityDescription *> * _Nullable identities;

/**
 An identity pool ID in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 A pagination token.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 Input to the ListIdentityPools action.
 Required parameters: [MaxResults]
 */
@interface AWSCognitoIdentityListIdentityPoolsInput : AWSRequest


/**
 The maximum number of identities to return.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 A pagination token.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 The result of a successful ListIdentityPools action.
 */
@interface AWSCognitoIdentityListIdentityPoolsResponse : AWSModel


/**
 The identity pools returned by the ListIdentityPools action.
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityIdentityPoolShortDescription *> * _Nullable identityPools;

/**
 A pagination token.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Input to the <code>LookupDeveloperIdentityInput</code> action.</p>
 Required parameters: [IdentityPoolId]
 */
@interface AWSCognitoIdentityLookupDeveloperIdentityInput : AWSRequest


/**
 <p>A unique ID used by your backend authentication process to identify a user. Typically, a developer identity provider would issue many developer user identifiers, in keeping with the number of users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable developerUserIdentifier;

/**
 <p>A unique identifier in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 <p>An identity pool ID in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 <p>The maximum number of identities to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A pagination token. The first call you make will have <code>NextToken</code> set to null. After that the service will return <code>NextToken</code> values as needed. For example, let's say you make a request with <code>MaxResults</code> set to 10, and there are 20 matches in the database. The service will return a pagination token as a part of the response. This token can be used to call the API again and get results starting from the 11th match.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Returned in response to a successful <code>LookupDeveloperIdentity</code> action.</p>
 */
@interface AWSCognitoIdentityLookupDeveloperIdentityResponse : AWSModel


/**
 <p>This is the list of developer user identifiers associated with an identity ID. Cognito supports the association of multiple developer user identifiers with an identity ID.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable developerUserIdentifierList;

/**
 <p>A unique identifier in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 <p>A pagination token. The first call you make will have <code>NextToken</code> set to null. After that the service will return <code>NextToken</code> values as needed. For example, let's say you make a request with <code>MaxResults</code> set to 10, and there are 20 matches in the database. The service will return a pagination token as a part of the response. This token can be used to call the API again and get results starting from the 11th match.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Input to the <code>MergeDeveloperIdentities</code> action.</p>
 Required parameters: [SourceUserIdentifier, DestinationUserIdentifier, DeveloperProviderName, IdentityPoolId]
 */
@interface AWSCognitoIdentityMergeDeveloperIdentitiesInput : AWSRequest


/**
 <p>User identifier for the destination user. The value should be a <code>DeveloperUserIdentifier</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationUserIdentifier;

/**
 <p>The "domain" by which Cognito will refer to your users. This is a (pseudo) domain name that you provide while creating an identity pool. This name acts as a placeholder that allows your backend and the Cognito service to communicate about the developer provider. For the <code>DeveloperProviderName</code>, you can use letters as well as period (.), underscore (_), and dash (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable developerProviderName;

/**
 <p>An identity pool ID in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 <p>User identifier for the source user. The value should be a <code>DeveloperUserIdentifier</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceUserIdentifier;

@end

/**
 <p>Returned in response to a successful <code>MergeDeveloperIdentities</code> action.</p>
 */
@interface AWSCognitoIdentityMergeDeveloperIdentitiesResponse : AWSModel


/**
 <p>A unique identifier in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

@end

/**
 <p>Input to the <code>SetIdentityPoolRoles</code> action.</p>
 Required parameters: [IdentityPoolId, Roles]
 */
@interface AWSCognitoIdentitySetIdentityPoolRolesInput : AWSRequest


/**
 <p>An identity pool ID in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 <p>The map of roles associated with this pool. Currently only authenticated and unauthenticated roles are supported.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable roles;

@end

/**
 <p>Input to the <code>UnlinkDeveloperIdentity</code> action.</p>
 Required parameters: [IdentityId, IdentityPoolId, DeveloperProviderName, DeveloperUserIdentifier]
 */
@interface AWSCognitoIdentityUnlinkDeveloperIdentityInput : AWSRequest


/**
 <p>The "domain" by which Cognito will refer to your users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable developerProviderName;

/**
 A unique ID used by your backend authentication process to identify a user.
 */
@property (nonatomic, strong) NSString * _Nullable developerUserIdentifier;

/**
 <p>A unique identifier in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 <p>An identity pool ID in the format REGION:GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

@end

/**
 Input to the UnlinkIdentity action.
 Required parameters: [IdentityId, Logins, LoginsToRemove]
 */
@interface AWSCognitoIdentityUnlinkIdentityInput : AWSRequest


/**
 A unique identifier in the format REGION:GUID.
 */
@property (nonatomic, strong) NSString * _Nullable identityId;

/**
 A set of optional name-value pairs that map provider names to provider tokens.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable logins;

/**
 Provider names to unlink from this identity.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loginsToRemove;

@end

NS_ASSUME_NONNULL_END
