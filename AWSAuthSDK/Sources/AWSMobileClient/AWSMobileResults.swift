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
    case badRequest(message: String)
    case expiredRefreshToken(message: String)
    case errorLoadingPage(message: String)
    case securityFailed(message: String)
    case idTokenNotIssued(message: String)
    case idTokenAndAcceessTokenNotIssued(message: String)
    case invalidConfiguration(message: String)
    case deviceNotRemembered(message: String)
}

extension AWSMobileClientError {
    /// Underlying error message of `AWSMobileClientError`
    var message: String {
        switch self {
        case .aliasExists(let message),
             .badRequest(let message),
             .codeDeliveryFailure(let message),
             .codeMismatch(let message),
             .cognitoIdentityPoolNotConfigured(let message),
             .deviceNotRemembered(let message),
             .errorLoadingPage(let message),
             .expiredCode(let message),
             .expiredRefreshToken(let message),
             .federationProviderExists(let message),
             .groupExists(let message),
             .guestAccessNotAllowed(let message),
             .idTokenAndAcceessTokenNotIssued(let message),
             .idTokenNotIssued(let message),
             .identityIdUnavailable(let message),
             .internalError(let message),
             .invalidConfiguration(let message),
             .invalidLambdaResponse(let message),
             .invalidOAuthFlow(let message),
             .invalidParameter(let message),
             .invalidPassword(let message),
             .invalidState(let message),
             .invalidUserPoolConfiguration(let message),
             .limitExceeded(let message),
             .mfaMethodNotFound(let message),
             .notAuthorized(let message),
             .notSignedIn(let message),
             .passwordResetRequired(let message),
             .resourceNotFound(let message),
             .scopeDoesNotExist(let message),
             .securityFailed(let message),
             .softwareTokenMFANotFound(let message),
             .tooManyFailedAttempts(let message),
             .tooManyRequests(let message),
             .unableToSignIn(let message),
             .unexpectedLambda(let message),
             .unknown(let message),
             .userCancelledSignIn(let message),
             .userLambdaValidation(let message),
             .userNotConfirmed(let message),
             .userNotFound(let message),
             .userPoolNotConfigured(let message),
             .usernameExists(let message):
            return message
        }
    }
    
    /// Utility class which maps a service error to `AWSMobileClientError`. If no mapping is available, returns the original error.
    public static func makeMobileClientError(from error: Error) -> Error {
        if error._domain == AWSCognitoIdentityProviderErrorDomain {
            if error._code == -3000 {
                return AWSMobileClientError.deviceNotRemembered(message: "This device does not have an id, either it was never tracked or previously forgotten.")
            }
            let message = (error as NSError).userInfo["message"] as? String ?? "Error information not available."
            let type = (error as NSError).userInfo["__type"] as? String ?? "Error type not available."
            let mobileError = ErrorMappingHelper(errorCode: type, message: message, error: error as NSError)
            return mobileError
        }
        return error
    }
    
    /// Utility class which maps a cognito error to `AWSMobileClientError`.
    public static func makeMobileClientError(from cognitoAuthError: AWSCognitoAuthClientErrorType) -> AWSMobileClientError {
        return CognitoAuthErrorMappingHelper(error: cognitoAuthError)
    }
    
    static func CognitoAuthErrorMappingHelper(error: AWSCognitoAuthClientErrorType) -> AWSMobileClientError {
        switch error {
        case .errorBadRequest:
            return .badRequest(message: "Incorrect host URL or query parameters.")
        case .errorExpiredRefreshToken:
            return .expiredRefreshToken(message: "The refresh token is expired, user needs to sign-in again.")
        case .errorLoadingPageFailed:
            return .errorLoadingPage(message: "Could not load the page from the specified URL.")
        case .errorSecurityFailed:
            return .securityFailed(message: "State code did not match request.")
        case .errorUserCanceledOperation:
            return .userCancelledSignIn(message: "The user cancelled sign-in.")
        case .noIdTokenIssued:
            return .idTokenNotIssued(message: "The ID Token was not issued by the server.")
        case .invalidAuthenticationDelegate, .errorUnknown:
            return .unknown(message: "Unknown error occurred.")
        default:
            break
        }
        return .unknown(message: "Unknown error occurred.")
    }
    
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
    
    public static func getUserCodeDeliveryDetails(_ deliveryDetails: AWSCognitoIdentityProviderCodeDeliveryDetailsType) -> UserCodeDeliveryDetails {
        var codeDeliveryDetails: UserCodeDeliveryDetails?
        switch(deliveryDetails.deliveryMedium) {
        case .email:
            codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .email, destination: deliveryDetails.destination, attributeName: deliveryDetails.attributeName)
        case .sms:
            codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .sms, destination: deliveryDetails.destination, attributeName: deliveryDetails.attributeName)
        case .unknown:
            codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .unknown, destination: deliveryDetails.destination, attributeName: deliveryDetails.attributeName)
        }
        return codeDeliveryDetails!
    }
}
