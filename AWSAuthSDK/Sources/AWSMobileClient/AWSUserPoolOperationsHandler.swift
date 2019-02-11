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
//  AWSUserPoolOperationsHandler.swift
//  AWSMobileClient
//

import Foundation
import AWSCognitoIdentityProvider

protocol UserPoolAuthHelperlCallbacks {

    func getPasswordDetails(_ authenticationInput: AWSCognitoIdentityPasswordAuthenticationInput, passwordAuthenticationCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>)
    
    func didCompletePasswordStepWithError(_ error: Error?)
    
    func getNewPasswordDetails(_ newPasswordRequiredInput: AWSCognitoIdentityNewPasswordRequiredInput, newPasswordRequiredCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails>)
    
    func didCompleteNewPasswordStepWithError(_ error: Error?)
    
    func getCode(_ authenticationInput: AWSCognitoIdentityMultifactorAuthenticationInput, mfaCodeCompletionSource: AWSTaskCompletionSource<NSString>)
    
    func didCompleteMultifactorAuthenticationStepWithError(_ error: Error?)
    
}

internal class UserPoolOperationsHandler: NSObject, AWSCognitoIdentityInteractiveAuthenticationDelegate {
    internal var userpoolClient: AWSCognitoIdentityUserPool?
    internal var signUpUser: AWSCognitoIdentityUser?
    
    internal var currentActiveUser: AWSCognitoIdentityUser? {
        return self.userpoolClient?.currentUser()
    }
    
    internal var passwordAuthTaskCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>?
    internal var passwordAuthInput: AWSCognitoIdentityPasswordAuthenticationInput?
    
    internal var newPasswordRequiredTaskCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails>?
    internal var newPasswordRequiredInput: AWSCognitoIdentityNewPasswordRequiredInput?
    
    internal var mfaAuthenticationInput: AWSCognitoIdentityMultifactorAuthenticationInput?
    internal var mfaCodeCompletionSource: AWSTaskCompletionSource<NSString>?
    
    internal var currentSignInHandlerCallback: ((SignInResult?, Error?) -> Void)?
    
    var authHelperDelegate: UserPoolAuthHelperlCallbacks?
    
    internal static let sharedInstance: UserPoolOperationsHandler = UserPoolOperationsHandler()
    
    public override init() {
        super.init()
        if (AWSInfo.default().defaultServiceInfo("CognitoUserPool") != nil) {
            self.userpoolClient = AWSCognitoIdentityUserPool.default()
            self.userpoolClient?.delegate = self
        }
    }
    
    internal func startPasswordAuthentication() -> AWSCognitoIdentityPasswordAuthentication {
        return self
    }
    
    internal func startNewPasswordRequired() -> AWSCognitoIdentityNewPasswordRequired {
        return self
    }
    
    internal func startMultiFactorAuthentication() -> AWSCognitoIdentityMultiFactorAuthentication {
        return self
    }
    
    internal func setAuthHelperDelegate(authHelperDelegate: UserPoolAuthHelperlCallbacks) {
        self.authHelperDelegate = authHelperDelegate
    }
}

extension UserPoolOperationsHandler: AWSCognitoIdentityPasswordAuthentication {
    
    public func getDetails(_ authenticationInput: AWSCognitoIdentityPasswordAuthenticationInput, passwordAuthenticationCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>) {
        self.authHelperDelegate?.getPasswordDetails(authenticationInput, passwordAuthenticationCompletionSource: passwordAuthenticationCompletionSource)
    }
    
    public func didCompleteStepWithError(_ error: Error?) {
        self.authHelperDelegate?.didCompletePasswordStepWithError(error)
    }
}

extension UserPoolOperationsHandler: AWSCognitoIdentityNewPasswordRequired {
    
    public func getNewPasswordDetails(_ newPasswordRequiredInput: AWSCognitoIdentityNewPasswordRequiredInput, newPasswordRequiredCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails>) {
        self.newPasswordRequiredTaskCompletionSource = newPasswordRequiredCompletionSource
        self.authHelperDelegate?.getNewPasswordDetails(newPasswordRequiredInput, newPasswordRequiredCompletionSource: newPasswordRequiredCompletionSource)
    }
    
    public func didCompleteNewPasswordStepWithError(_ error: Error?) {
        self.authHelperDelegate?.didCompleteNewPasswordStepWithError(error)
    }
}

extension UserPoolOperationsHandler: AWSCognitoIdentityMultiFactorAuthentication {
    
    public func getCode(_ authenticationInput: AWSCognitoIdentityMultifactorAuthenticationInput, mfaCodeCompletionSource: AWSTaskCompletionSource<NSString>) {
        self.mfaAuthenticationInput = authenticationInput
        self.authHelperDelegate?.getCode(authenticationInput, mfaCodeCompletionSource: mfaCodeCompletionSource)
    }
    
    public func didCompleteMultifactorAuthenticationStepWithError(_ error: Error?) {
        self.authHelperDelegate?.didCompleteMultifactorAuthenticationStepWithError(error)
    }
}
