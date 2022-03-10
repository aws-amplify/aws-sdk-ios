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

extension AWSMobileClient {
    
    /// Fetches the `AWSCredentials` asynchronously.
    ///
    /// - Parameter completionHandler: completionHandler which would have `AWSCredentials` if successfully retrieved, else error.
    public func getAWSCredentials(_ completionHandler: @escaping(AWSCredentials?, Error?) -> Void) {
        if self.internalCredentialsProvider == nil {
            completionHandler(nil, AWSMobileClientError.cognitoIdentityPoolNotConfigured(message: "There is no valid cognito identity pool configured in `awsconfiguration.json`."))
            return
        }

        let cancellationToken = self.credentialsFetchCancellationSource
        let operation = AWSAsyncBlockOperation { done in
            self.internalCredentialsProvider?.credentials(withCancellationToken: cancellationToken).continueWith(block: { (task) -> Any? in
                // If we have called cancellation already, leave the block without doing anything
                // with the fetched credentials.
                if (task.isCancelled || cancellationToken.isCancellationRequested) {
                    completionHandler(task.result, task.error)
                    done()
                    return nil
                }

                if let error = task.error {
                    if error._domain == AWSCognitoIdentityErrorDomain
                        && error._code == AWSCognitoIdentityErrorType.notAuthorized.rawValue
                        && self.federationProvider == .none {

                        completionHandler(nil, AWSMobileClientError.guestAccessNotAllowed(message: "Your backend is not configured with cognito identity pool to allow guest access. Please allow un-authenticated access to identity pool to use this feature."))
                        done()
                    } else if error._domain == AWSCognitoIdentityErrorDomain
                        && error._code == AWSCognitoIdentityErrorType.notAuthorized.rawValue
                        && self.federationProvider == .oidcFederation {
                        // store a reference to the completion handler which we would be calling later on.
                        self.pendingAWSCredentialsCompletion = { credentials, error in
                            completionHandler(credentials, error)
                            done()
                        }

                        self.mobileClientStatusChanged(
                            userState: .signedOutFederatedTokensInvalid,
                            additionalInfo: [
                                AWSMobileClientConstants.ProviderKey:self.cachedLoginsMap.first!.key
                            ])
                    } else {
                        completionHandler(nil, error)
                        done()
                    }
                } else if let result = task.result {
                    if self.federationProvider == .none && self.currentUserState != .guest {
                        self.mobileClientStatusChanged(userState: .guest, additionalInfo: [:])
                    }
                    completionHandler(result, nil)
                    done()
                }

                return nil
            })
        }
        credentialsFetchOperationQueue.addOperation(operation)
    }
}
