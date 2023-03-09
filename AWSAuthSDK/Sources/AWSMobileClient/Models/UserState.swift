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

/// Indicates the user state.
///
public enum UserState: String {

    /// The user is signed in through Cognito User Pools or a federation provider like Google, Facebook, etc.
    case signedIn

    /// The user is signed out and does not have guest access.
    case signedOut

    /// The tokens associated with the federation provider like Google or Facebook have expired and need to re-submitted to
    /// `AWSMobileClient`. You can do that by calling the `federatedSignIn` method or by showing the drop in UI.
    ///  If the end user is unable to sign in, call `releaseSignInWait` method to return an error to the calling API.
    case signedOutFederatedTokensInvalid

    /// The Cognito User Pools tokens have expired and the end-user needs to sign in again. You can complete the sign in process
    /// using the `signIn` method or by showing the drop in UI. If the end user is unable to sign in, call `releaseSignInWait`
    /// method to return an error to the calling API.
    case signedOutUserPoolsTokenInvalid

    /// The user is signed out, but has guest access in the app.
    case guest

    /// The initial user state before `AWSMobileClient` is initialized.
    case unknown
}
