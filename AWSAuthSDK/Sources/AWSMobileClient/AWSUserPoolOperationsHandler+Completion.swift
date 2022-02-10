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

import Foundation

extension UserPoolOperationsHandler {

    typealias PasswordCompletion = AWSTaskCompletionSource<
        AWSCognitoIdentityPasswordAuthenticationDetails>
    typealias PasswordResult = Result<
        AWSCognitoIdentityPasswordAuthenticationDetails,
        Error>

    // MARK: - PasswordAuthTaskCompletionSource

    /// Check if the password completion source is waiting to be completed.
    internal var isWaitingPasswordAuthentication: Bool {

        return completionSourceQueue.sync {
            return !didComplete(self.passwordAuthTaskCompletionSource)
        }
    }

    internal func setPasswordAuthTaskCompletionSource(
        _ completion: PasswordCompletion?
    ) {

        completionSourceQueue.sync(flags: .barrier) {
            self.passwordAuthTaskCompletionSource = completion
        }
    }

    /// Complete the password completion source and make it nil
    internal func completePasswordAuth(_ result: PasswordResult) {

        completionSourceQueue.sync(flags: .barrier) {
            defer {
                self.passwordAuthTaskCompletionSource = nil
            }

            guard let completion = self.passwordAuthTaskCompletionSource,
                  !completion.task.isCompleted else {
                      return
                  }
            self.completeSource(completion, result: result)
        }
    }

    private func completeSource<E>(
        _ source: AWSTaskCompletionSource<E>,
        result: Result<E, Error>
    ) {
        DispatchQueue.main.async {
            do {
                let data = try result.get()
                source.set(result: data)
            } catch {
                source.set(error: error)
            }
        }

    }

    private func didComplete<E>(
        _ source: AWSTaskCompletionSource<E>?
    ) -> Bool {
        guard let task = source?.task else {
            return true
        }
        return task.isCompleted
    }
}
