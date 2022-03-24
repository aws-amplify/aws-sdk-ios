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

protocol CognitoIdentityUserBehavior {

    func getUserPoolToken(completion: @escaping (Result<Tokens, Error>) -> Void)
}

extension AWSCognitoIdentityUser: CognitoIdentityUserBehavior {

    func getUserPoolToken(completion: @escaping (Result<Tokens, Error>) -> Void) {
        self.getSession().continueWith { task in
            if let result = task.result {
                completion(.success(result.mobileClientTokens))
            } else if let error = task.error {
                completion(.failure(error))
            }
            return nil
        }
    }
}

extension AWSCognitoAuth: CognitoIdentityUserBehavior {

    func getUserPoolToken(completion: @escaping (Result<Tokens, Error>) -> Void) {
        self.getSession{ session, error in
            if let result = session {
                completion(.success(result.mobileClientTokens))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
