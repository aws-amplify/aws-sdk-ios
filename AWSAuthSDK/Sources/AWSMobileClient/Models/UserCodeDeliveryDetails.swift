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

/// Contains the details about where a code was sent to the user.
public struct UserCodeDeliveryDetails {
    public let deliveryMedium: UserCodeDeliveryMedium
    public let destination: String?
    public let attributeName: String?

    internal init(deliveryMedium: UserCodeDeliveryMedium,
                  destination: String?,
                  attributeName: String?) {
        self.destination = destination
        self.deliveryMedium = deliveryMedium
        self.attributeName = attributeName
    }

    public static func getUserCodeDeliveryDetails(
        _ deliveryDetails: AWSCognitoIdentityProviderCodeDeliveryDetailsType)
    -> UserCodeDeliveryDetails {

        var codeDeliveryDetails: UserCodeDeliveryDetails?
        switch(deliveryDetails.deliveryMedium) {
        case .email:
            codeDeliveryDetails = UserCodeDeliveryDetails(
                deliveryMedium: .email,
                destination: deliveryDetails.destination,
                attributeName: deliveryDetails.attributeName)
        case .sms:
            codeDeliveryDetails = UserCodeDeliveryDetails(
                deliveryMedium: .sms,
                destination: deliveryDetails.destination,
                attributeName: deliveryDetails.attributeName)
        case .unknown:
            codeDeliveryDetails = UserCodeDeliveryDetails(
                deliveryMedium: .unknown,
                destination: deliveryDetails.destination,
                attributeName: deliveryDetails.attributeName)
        @unknown default:
            codeDeliveryDetails = UserCodeDeliveryDetails(
                deliveryMedium: .unknown,
                destination: deliveryDetails.destination,
                attributeName: deliveryDetails.attributeName)
        }
        return codeDeliveryDetails!
    }
}
