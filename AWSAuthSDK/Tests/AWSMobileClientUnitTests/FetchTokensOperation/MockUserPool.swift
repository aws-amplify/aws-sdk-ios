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
@testable import AWSMobileClient

class MockUser: CognitoIdentityUserBehavior {

    let result: Result<AWSCognitoIdentityUserSession, Error>

    init(result: Result<AWSCognitoIdentityUserSession, Error>) {
        self.result = result
    }

    func getSession() -> AWSTask<AWSCognitoIdentityUserSession> {
        let completion = AWSTaskCompletionSource<AWSCognitoIdentityUserSession>()
        switch result {
        case .success(let result):
            completion.set(result: result)
        case .failure(let error):
            completion.set(error: error)
        }
        return completion.task
    }
}

class MockUserPool: CognitoUserPoolBehavior {

    let user: CognitoIdentityUserBehavior

    init(user: CognitoIdentityUserBehavior) {
        self.user = user
    }

    func getIdentityUser(_ username: String) -> CognitoIdentityUserBehavior {
        return user
    }
}
