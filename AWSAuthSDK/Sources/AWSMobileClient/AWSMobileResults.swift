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
//  AWSMobileResults.swift
//  AWSMobileClient
//

import Foundation
import AWSCognitoIdentityProvider

/// The error enum for `AWSMobileClient` errors.
public enum AWSMobileClientError: Error {
    case aliasExists(message: String)
    case codeDeliveryFailure(message: String)
    case codeMismatch(message: String)
    case expiredCode(message: String)
    case groupExists(message: String)
    case internalError(message: String)
    case invalidLambdaResponse(message: String)
    case invalidOAuthFlow(message: String)
    case invalidParameter(message: String)
    case invalidPassword(message: String)
    case invalidUserPoolConfiguration(message: String)
    case limitExceeded(message: String)
    case mfaMethodNotFound(message: String)
    case notAuthorized(message: String)
    case passwordResetRequired(message: String)
    case resourceNotFound(message: String)
    case scopeDoesNotExist(message: String)
    case softwareTokenMFANotFound(message: String)
    case tooManyFailedAttempts(message: String)
    case tooManyRequests(message: String)
    case unexpectedLambda(message: String)
    case userLambdaValidation(message: String)
    case userNotConfirmed(message: String)
    case userNotFound(message: String)
    case usernameExists(message: String)
    case unknown(message: String)
    case notSignedIn(message: String)
    case identityIdUnavailable(message: String)
    case guestAccessNotAllowed(message: String)
    case federationProviderExists(message: String)
    case cognitoIdentityPoolNotConfigured(message: String)
    case unableToSignIn(message: String)
    case invalidState(message: String)
    case userPoolNotConfigured(message: String)
    case userCancelledSignIn(message: String)
}

extension AWSMobileClient {
    /// Mapping helper to map error code and messages to `AWSMobileClientError`
    static func ErrorMappingHelper(errorCode: String, message: String, error: NSError?) -> AWSMobileClientError {
        switch (errorCode) {
        case "AliasExistsException":
            return .aliasExists(message: message)
        case "CodeDeliveryFailureException":
            return .codeDeliveryFailure(message: message)
        case "CodeMismatchException":
            return .codeMismatch(message: message)
        case "ExpiredCodeException":
            return .expiredCode(message: message)
        case "GroupExistsException":
            return .groupExists(message: message)
        case "InternalErrorException":
            return .internalError(message: message)
        case "InvalidLambdaResponseException":
            return .invalidLambdaResponse(message: message)
        case "InvalidOAuthFlowException":
            return .invalidOAuthFlow(message: message)
        case "InvalidParameterException":
            return .invalidParameter(message: message)
        case "InvalidPasswordException":
            return .invalidPassword(message: message)
        case "InvalidUserPoolConfigurationException":
            return .invalidUserPoolConfiguration(message: message)
        case "LimitExceededException":
            return .limitExceeded(message: message)
        case "MFAMethodNotFoundException":
            return .mfaMethodNotFound(message: message)
        case "NotAuthorizedException":
            return .notAuthorized(message: message)
        case "PasswordResetRequiredException":
            return .passwordResetRequired(message: message)
        case "ResourceNotFoundException":
            return .resourceNotFound(message: message)
        case "ScopeDoesNotExistException":
            return .scopeDoesNotExist(message: message)
        case "SoftwareTokenMFANotFoundException":
            return .softwareTokenMFANotFound(message: message)
        case "TooManyFailedAttemptsException":
            return .tooManyFailedAttempts(message: message)
        case "TooManyRequestsException":
            return .tooManyRequests(message: message)
        case "UnexpectedLambdaException":
            return .unexpectedLambda(message: message)
        case "UserLambdaValidationException":
            return .userLambdaValidation(message: message)
        case "UserNotConfirmedException":
            return .userNotConfirmed(message: message)
        case "UserNotFoundException":
            return .userNotFound(message: message)
        case "UsernameExistsException":
            return .usernameExists(message: message)
        default:
            break
        }
        if let error = error {
            return .unknown(message: "\(String(describing: error.userInfo["__type"])): \(message)")
        } else {
            return .unknown(message: message)
        }
    }
}

/// Indicates sign in state of the user in the sign in process.
public enum SignInState: String {
    case unknown = "UNKNOWN"
    case smsMFA = "CONFIRMATION_CODE"
    case passwordVerifier = "PASSWORD_VERIFIER"
    case customChallenge = "CUSTOM_CHALLENGE"
    case deviceSRPAuth = "DEVICE_SRP_AUTH"
    case devicePasswordVerifier = "DEVICE_PASSWORD_VERIFIER"
    case adminNoSRPAuth = "ADMIN_NO_SRP_AUTH"
    case newPasswordRequired = "NEW_PASSWORD_REQUIRED"
    case signedIn = "SIGN_IN_COMPLETE"
}

/// Indicates the state of forgot password operation.
public enum ForgotPasswordState {
    case done, confirmationCodeSent
}

/// Contains the result of the forgot password operation.
public struct ForgotPasswordResult {
    public let forgotPasswordState: ForgotPasswordState
    public let codeDeliveryDetails: UserCodeDeliveryDetails?
    
    internal init(forgotPasswordState: ForgotPasswordState, codeDeliveryDetails: UserCodeDeliveryDetails?) {
        self.forgotPasswordState = forgotPasswordState
        self.codeDeliveryDetails = codeDeliveryDetails
    }
}

/// Indicates the state of user during the sign up operation.
public enum SignUpConfirmationState {
    case confirmed, unconfirmed, unknown
}

/// Contains the result of the sign in operation.
public struct SignInResult {
    public let signInState: SignInState
    public let parameters: [String: String]
    public let codeDetails: UserCodeDeliveryDetails?
    
    internal init(signInState: SignInState, parameters: [String: String] = [:], codeDetails: UserCodeDeliveryDetails? = nil) {
        self.signInState = signInState
        self.parameters = parameters
        self.codeDetails = codeDetails
    }
}

/// Contains the result of the sign up operation.
public struct SignUpResult {
    public let codeDeliveryDetails: UserCodeDeliveryDetails?
    public let signUpConfirmationState: SignUpConfirmationState
    
    internal init(signUpState: SignUpConfirmationState, codeDeliveryDetails: UserCodeDeliveryDetails?){
        self.codeDeliveryDetails = codeDeliveryDetails
        self.signUpConfirmationState = signUpState
    }
}


/// Describes the medium through which a code was sent to the user.
public enum UserCodeDeliveryMedium {
    case sms, email, unknown
}

/// Contains the details about where a code was sent to the user.
public struct UserCodeDeliveryDetails {
    public let deliveryMedium: UserCodeDeliveryMedium
    public let destination: String?
    public let attributeName: String?
    
    internal init(deliveryMedium: UserCodeDeliveryMedium, destination: String?, attributeName: String?) {
        self.destination = destination
        self.deliveryMedium = deliveryMedium
        self.attributeName = attributeName
    }
}
