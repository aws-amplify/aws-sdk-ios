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
