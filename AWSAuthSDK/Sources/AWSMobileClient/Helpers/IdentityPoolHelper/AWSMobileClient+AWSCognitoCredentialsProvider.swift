//
// Copyright 2017-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

import Foundation

/// Inherited methods from AWSCognitoCredentialsProvider
extension AWSMobileClient {


    /// Asynchronously returns a valid AWS credentials or an error object if it cannot retrieve valid credentials. It should cache valid credentials as much as possible and refresh them when they are invalid.
    ///
    /// - Returns: A valid AWS credentials or an error object describing the error.
    override public func credentials() -> AWSTask<AWSCredentials> {
        let credentialsTaskCompletionSource: AWSTaskCompletionSource<AWSCredentials> = AWSTaskCompletionSource()

        self.getAWSCredentials { (credentials, error) in
            if let credentials = credentials {
                credentialsTaskCompletionSource.set(result: credentials)
            } else if let error = error {
                credentialsTaskCompletionSource.set(error: error)
            }
        }
        return credentialsTaskCompletionSource.task
    }

    /// Invalidates the cached temporary AWS credentials. If the credentials provider does not cache temporary credentials, this operation is a no-op.
    override public func invalidateCachedTemporaryCredentials() {
        self.internalCredentialsProvider?.invalidateCachedTemporaryCredentials()
    }

    /// Get/retrieve the identity id for this provider. If an identity id is already set on this provider, no remote call is made and the identity will be returned as a result of the AWSTask (the identityId is also available as a property). If no identityId is set on this provider, one will be retrieved from the service.
    ///
    /// - Returns: Asynchronous task which contains the identity id or error.
    override public func getIdentityId() -> AWSTask<NSString> {
        guard self.internalCredentialsProvider != nil else {
            return AWSTask(error: AWSMobileClientError.cognitoIdentityPoolNotConfigured(message: "Cannot get identityId since cognito credentials configuration is not available."))
        }
        let identityFetchTaskCompletionSource: AWSTaskCompletionSource<NSString> = AWSTaskCompletionSource()
        self.internalCredentialsProvider?.getIdentityId().continueWith(block: { (task) -> Any? in
            if let error = task.error {
                if error._domain == AWSCognitoCredentialsProviderHelperErrorDomain
                    && error._code == AWSCognitoCredentialsProviderHelperErrorType.identityIsNil.rawValue {
                    identityFetchTaskCompletionSource.set(error: AWSMobileClientError.identityIdUnavailable(message: "Fetching identity id on another thread failed. Please retry by calling `getIdentityId()` method."))
                } else {
                    identityFetchTaskCompletionSource.set(error: error)
                }
            } else if let result = task.result {
                identityFetchTaskCompletionSource.set(result: result)
            }
            return nil
        })

        return identityFetchTaskCompletionSource.task
    }

    /// Clear the cached AWS credentials for this provider.
    override public func clearCredentials() {
        self.internalCredentialsProvider?.clearCredentials()
    }

    /// Clear ALL saved values for this provider (identityId, credentials, logins).
    override public func clearKeychain() {
        self.internalCredentialsProvider?.clearKeychain()
    }

}
