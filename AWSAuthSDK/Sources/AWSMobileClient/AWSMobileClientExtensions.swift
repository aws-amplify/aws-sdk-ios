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
    
    internal convenience init(setDelegate: Bool) {
        self.init()
        if (setDelegate) {
            UserPoolOperationsHandler.sharedInstance.authHelperDelegate = self
        }
    }
    
    internal var userpoolOpsHelper: UserPoolOperationsHandler {
        return UserPoolOperationsHandler.sharedInstance
    }
    
    internal var userPoolClient: AWSCognitoIdentityUserPool? {
        return self.userpoolOpsHelper.userpoolClient
    }
    
    internal var currentUser: AWSCognitoIdentityUser? {
        return self.userPoolClient?.currentUser()
    }

    /// Returns the username attribute of the access token for the current logged in user,  nil otherwise.
    /// Note that the value stored may vary depending on how sign-in was performed.
    /// @see https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-using-tokens-with-identity-providers.html#amazon-cognito-user-pools-using-the-access-token
    public var username: String? {
        return self.userpoolOpsHelper.currentActiveUser?.username
    }

    public var userSub: String? {
        guard  (isSignedIn && (federationProvider == .hostedUI || federationProvider == .userPools)) else {
            return nil
        }

        guard let idToken = self.cachedLoginsMap.first?.value else {
            return nil
        }
        let sessionToken = SessionToken(tokenString: idToken)
        guard let sub = sessionToken.claims?["sub"] as? String else {
            return nil
        }
        return sub
    }

    /// The identity id associated with this provider. This value will be fetched from the keychain at startup. If you do not want to reuse the existing identity id, you must call the clearKeychain method. If the identityId is not fetched yet, it will return nil. Use `getIdentityId()` method to force a server fetch when identityId is not available.
    override public var identityId: String? {
        return self.internalCredentialsProvider?.identityId
    }

    /// Returns true if there is a user currently signed in.
    @objc public var isSignedIn: Bool {
        get {
            return self.cachedLoginsMap.count > 0
        }
    }

    public func handleAuthResponse(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) {
        if (isCognitoAuthRegistered) {
            AWSCognitoAuth.init(forKey: CognitoAuthRegistrationKey).application(application, open: url, options: [:])
        }
    }

}
