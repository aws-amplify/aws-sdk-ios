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
#import "AWSService.h"
#import "AWSCognitoIdentityModel.h"

@class BFTask;

/**
 * <fullname>Amazon Cognito</fullname><p>Amazon Cognito is a web service that delivers scoped temporary credentials to mobile devices andother untrusted environments. Amazon Cognito uniquely identifies a device and supplies the userwith a consistent identity over the lifetime of an application.</p><p>Using Amazon Cognito, you can enable authentication with one or more third-party identityproviders (Facebook, Google, or Login with Amazon), and you can also choose to supportunauthenticated access from your app. Cognito delivers a unique identifier for each userand acts as an OpenID token provider trusted by AWS Security Token Service (STS) to accesstemporary, limited-privilege AWS credentials.</p><p>To provide end-user credentials, first make an unsigned call to <a>GetId</a>. If the enduser is authenticated with one of the supported identity providers, set the <code>Logins</code> map with the identity provider token. <code>GetId</code> returns aunique identifier for the user.</p><p>Next, make an unsigned call to <a>GetOpenIdToken</a>, which returns the OpenID tokennecessary to call STS and retrieve AWS credentials. This call expects the same <code>Logins</code> map as the <code>GetId</code> call, as well as the <code>IdentityID</code> originally returned by <code>GetId</code>. The token returned by <code>GetOpenIdToken</code> can be passed to the STS operation <a href="http://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithWebIdentity.html">AssumeRoleWithWebIdentity</a> to retrieve AWS credentials.</p>
 */
@interface AWSCognitoIdentity : AWSService

@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

+ (instancetype)defaultCognitoIdentity;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

/**
 * <p>Creates a new identity pool. The identity pool is a store of user identity information thatis specific to your AWS account. The limit on identity pools is 60 per account.</p>
 *
 * @param request A container for the necessary parameters to execute the CreateIdentityPool service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCognitoIdentityIdentityPool. On failed execution, task.error may contain an NSError with AWSCognitoIdentityErrorDomain domian and the following error code: AWSCognitoIdentityErrorInvalidParameter, AWSCognitoIdentityErrorNotAuthorized, AWSCognitoIdentityErrorResourceConflict, AWSCognitoIdentityErrorTooManyRequests, AWSCognitoIdentityErrorInternalError, AWSCognitoIdentityErrorLimitExceeded.
 *
 * @see AWSCognitoIdentityCreateIdentityPoolInput
 * @see AWSCognitoIdentityIdentityPool
 */
- (BFTask *)createIdentityPool:(AWSCognitoIdentityCreateIdentityPoolInput *)request;

/**
 * <p>Deletes a user pool. Once a pool is deleted, users will not be able to authenticate withthe pool.</p>
 *
 * @param request A container for the necessary parameters to execute the DeleteIdentityPool service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSCognitoIdentityErrorDomain domian and the following error code: AWSCognitoIdentityErrorInvalidParameter, AWSCognitoIdentityErrorResourceNotFound, AWSCognitoIdentityErrorNotAuthorized, AWSCognitoIdentityErrorTooManyRequests, AWSCognitoIdentityErrorInternalError.
 *
 * @see AWSCognitoIdentityDeleteIdentityPoolInput
 */
- (BFTask *)deleteIdentityPool:(AWSCognitoIdentityDeleteIdentityPoolInput *)request;

/**
 * <p>Gets details about a particular identity pool, including the pool name, ID description,creation date, and current number of users.</p>
 *
 * @param request A container for the necessary parameters to execute the DescribeIdentityPool service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCognitoIdentityIdentityPool. On failed execution, task.error may contain an NSError with AWSCognitoIdentityErrorDomain domian and the following error code: AWSCognitoIdentityErrorInvalidParameter, AWSCognitoIdentityErrorResourceNotFound, AWSCognitoIdentityErrorNotAuthorized, AWSCognitoIdentityErrorTooManyRequests, AWSCognitoIdentityErrorInternalError.
 *
 * @see AWSCognitoIdentityDescribeIdentityPoolInput
 * @see AWSCognitoIdentityIdentityPool
 */
- (BFTask *)describeIdentityPool:(AWSCognitoIdentityDescribeIdentityPoolInput *)request;

/**
 * <p>Generates (or retrieves) a Cognito ID. Supplying multiple logins will create an implicitlinked account.</p>
 *
 * @param request A container for the necessary parameters to execute the GetId service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCognitoIdentityGetIdResponse. On failed execution, task.error may contain an NSError with AWSCognitoIdentityErrorDomain domian and the following error code: AWSCognitoIdentityErrorInvalidParameter, AWSCognitoIdentityErrorResourceNotFound, AWSCognitoIdentityErrorNotAuthorized, AWSCognitoIdentityErrorResourceConflict, AWSCognitoIdentityErrorTooManyRequests, AWSCognitoIdentityErrorInternalError, AWSCognitoIdentityErrorLimitExceeded.
 *
 * @see AWSCognitoIdentityGetIdInput
 * @see AWSCognitoIdentityGetIdResponse
 */
- (BFTask *)getId:(AWSCognitoIdentityGetIdInput *)request;

/**
 * <p>Gets an OpenID token, using a known Cognito ID. This known Cognito ID is returned by<a>GetId</a>. You can optionally add additional logins for the identity. Supplying multiple loginscreates an implicit link.</p><p>The OpenId token is valid for 15 minutes.</p>
 *
 * @param request A container for the necessary parameters to execute the GetOpenIdToken service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCognitoIdentityGetOpenIdTokenResponse. On failed execution, task.error may contain an NSError with AWSCognitoIdentityErrorDomain domian and the following error code: AWSCognitoIdentityErrorInvalidParameter, AWSCognitoIdentityErrorResourceNotFound, AWSCognitoIdentityErrorNotAuthorized, AWSCognitoIdentityErrorResourceConflict, AWSCognitoIdentityErrorTooManyRequests, AWSCognitoIdentityErrorInternalError.
 *
 * @see AWSCognitoIdentityGetOpenIdTokenInput
 * @see AWSCognitoIdentityGetOpenIdTokenResponse
 */
- (BFTask *)getOpenIdToken:(AWSCognitoIdentityGetOpenIdTokenInput *)request;

- (BFTask *)getOpenIdTokenForDeveloperIdentity:(AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput *)request;

/**
 * <p>Lists the identities in a pool.</p>
 *
 * @param request A container for the necessary parameters to execute the ListIdentities service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCognitoIdentityListIdentitiesResponse. On failed execution, task.error may contain an NSError with AWSCognitoIdentityErrorDomain domian and the following error code: AWSCognitoIdentityErrorInvalidParameter, AWSCognitoIdentityErrorResourceNotFound, AWSCognitoIdentityErrorNotAuthorized, AWSCognitoIdentityErrorTooManyRequests, AWSCognitoIdentityErrorInternalError.
 *
 * @see AWSCognitoIdentityListIdentitiesInput
 * @see AWSCognitoIdentityListIdentitiesResponse
 */
- (BFTask *)listIdentities:(AWSCognitoIdentityListIdentitiesInput *)request;

/**
 * <p>Lists all of the Cognito identity pools registered for your account.</p>
 *
 * @param request A container for the necessary parameters to execute the ListIdentityPools service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCognitoIdentityListIdentityPoolsResponse. On failed execution, task.error may contain an NSError with AWSCognitoIdentityErrorDomain domian and the following error code: AWSCognitoIdentityErrorInvalidParameter, AWSCognitoIdentityErrorNotAuthorized, AWSCognitoIdentityErrorTooManyRequests, AWSCognitoIdentityErrorInternalError.
 *
 * @see AWSCognitoIdentityListIdentityPoolsInput
 * @see AWSCognitoIdentityListIdentityPoolsResponse
 */
- (BFTask *)listIdentityPools:(AWSCognitoIdentityListIdentityPoolsInput *)request;

- (BFTask *)lookupDeveloperIdentity:(AWSCognitoIdentityLookupDeveloperIdentityInput *)request;

- (BFTask *)mergeDeveloperIdentities:(AWSCognitoIdentityMergeDeveloperIdentitiesInput *)request;

- (BFTask *)unlinkDeveloperIdentity:(AWSCognitoIdentityUnlinkDeveloperIdentityInput *)request;

/**
 * <p>Unlinks a federated identity from an existing account. Unlinked logins will be considerednew identities next time they are seen. Removing the last linked login will make thisidentity inaccessible.</p>
 *
 * @param request A container for the necessary parameters to execute the UnlinkIdentity service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSCognitoIdentityErrorDomain domian and the following error code: AWSCognitoIdentityErrorInvalidParameter, AWSCognitoIdentityErrorResourceNotFound, AWSCognitoIdentityErrorNotAuthorized, AWSCognitoIdentityErrorResourceConflict, AWSCognitoIdentityErrorTooManyRequests, AWSCognitoIdentityErrorInternalError.
 *
 * @see AWSCognitoIdentityUnlinkIdentityInput
 */
- (BFTask *)unlinkIdentity:(AWSCognitoIdentityUnlinkIdentityInput *)request;

/**
 * <p>Updates a user pool.</p>
 *
 * @param request A container for the necessary parameters to execute the UpdateIdentityPool service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSCognitoIdentityIdentityPool. On failed execution, task.error may contain an NSError with AWSCognitoIdentityErrorDomain domian and the following error code: AWSCognitoIdentityErrorInvalidParameter, AWSCognitoIdentityErrorResourceNotFound, AWSCognitoIdentityErrorNotAuthorized, AWSCognitoIdentityErrorResourceConflict, AWSCognitoIdentityErrorTooManyRequests, AWSCognitoIdentityErrorInternalError.
 *
 * @see AWSCognitoIdentityIdentityPool
 * @see AWSCognitoIdentityIdentityPool
 */
- (BFTask *)updateIdentityPool:(AWSCognitoIdentityIdentityPool *)request;

@end
