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

/// The options object for drop-in UI which allows changing properties like logo image and background color.
@objc public class SignInUIOptions: NSObject {

    /// If true, the end user can cancel the sign-in operation and go back to previous view controller.
    @objc public let canCancel: Bool
    /// The logo image to be displayed on the sign-in screen.
    @objc public let logoImage: UIImage?
    /// The background color of the sign-in screen.
    @objc public let backgroundColor: UIColor?
    /// The secondary background color. It's applied to the bottom panel of the sign-in screen.
    @objc public let secondaryBackgroundColor: UIColor?
    /// The view primary color used for highlighted elements (button background, links).
    @objc public let primaryColor: UIColor?
    /// If set to true the sign up button is hidden from the UI.
    @objc public let disableSignUpButton: Bool

    /// Initializer for the drop-in UI configuration.
    @objc public init(canCancel: Bool = false,
                      logoImage: UIImage? = nil,
                      backgroundColor: UIColor? = nil,
                      secondaryBackgroundColor: UIColor? = nil,
                      primaryColor: UIColor? = .systemBlue,
                      disableSignUpButton: Bool = false) {
        self.canCancel = canCancel
        self.logoImage = logoImage
        self.backgroundColor = backgroundColor
        self.secondaryBackgroundColor = secondaryBackgroundColor
        self.primaryColor = primaryColor
        self.disableSignUpButton = disableSignUpButton
    }

    public override convenience init() {
        self.init(canCancel: false,
                  logoImage: nil,
                  backgroundColor: nil,
                  secondaryBackgroundColor: nil,
                  primaryColor: .systemBlue,
                  disableSignUpButton: false)
    }
}
