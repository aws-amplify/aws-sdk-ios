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
//  AWSMobileClientUserDetails.swift
//  AWSMobileClient
//

import Foundation
import AWSCognitoIdentityProvider

/// Mobile client helper class to handle user attribute related operations
///
internal class AWSMobileClientUserDetails {
    
    let cognitoIdentityUser: AWSCognitoIdentityUser
    
    init(with user: AWSCognitoIdentityUser) {
            cognitoIdentityUser = user
    }
    
    /// Verify a user attribute like phone_number.
    ///
    /// - Parameters:
    ///   - attributeName: name of the attribute.
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func verifyUserAttribute(attributeName: String,
                                    clientMetaData: [String:String] = [:],
                                    completionHandler: @escaping ((UserCodeDeliveryDetails?, Error?) -> Void)) {
        self.cognitoIdentityUser.getAttributeVerificationCode(attributeName,
                                                              clientMetaData: clientMetaData).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, AWSMobileClientError.makeMobileClientError(from: error))
            } else if let result = task.result {
                var codeDeliveryDetails: UserCodeDeliveryDetails? = nil
                if let deliveryDetails = result.codeDeliveryDetails {
                    codeDeliveryDetails = UserCodeDeliveryDetails.getUserCodeDeliveryDetails(deliveryDetails)
                }
                completionHandler(codeDeliveryDetails, nil)
            }
            return nil
        }
    }
    
    /// Update the attributes for a user.
    ///
    /// - Parameters:
    ///   - attributeMap: the attribute map of the user.
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func updateUserAttributes(attributeMap: [String: String], clientMetaData: [String:String] = [:], completionHandler: @escaping (([UserCodeDeliveryDetails]?, Error?) -> Void)) {
        let attributes = attributeMap.map {AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1) }
        self.cognitoIdentityUser.update(attributes, clientMetaData: clientMetaData).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, AWSMobileClientError.makeMobileClientError(from: error))
            } else if let result = task.result {
                var codeDeliveryDetailsList: [UserCodeDeliveryDetails] = []
                if result.codeDeliveryDetailsList != nil {
                    for codeDeliveryDetail in result.codeDeliveryDetailsList! {
                        codeDeliveryDetailsList.append(UserCodeDeliveryDetails.getUserCodeDeliveryDetails(codeDeliveryDetail))
                    }
                }
                completionHandler(codeDeliveryDetailsList, nil)
            }
            return nil
        }
    }
    
    /// Fetches the attributes for logged in user.
    ///
    /// - Parameter completionHandler: completion handler which will be invoked when result is available.
    public func getUserAttributes(completionHandler: @escaping (([String: String]?, Error?) -> Void)) {
        self.cognitoIdentityUser.getDetails().continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, AWSMobileClientError.makeMobileClientError(from: error))
            } else if let result = task.result {
                let userAttributes = result.userAttributes
                var attributesMap = [String: String]()
                if let userAttributes = userAttributes {
                    for attribute in userAttributes {
                        guard attribute.name != nil, attribute.value != nil else {continue}
                        attributesMap[attribute.name!] = attribute.value!
                    }
                }
                completionHandler(attributesMap, nil)
            }
            return nil
        }
    }
    
    /// Confirm the attribute using a confirmation code.
    ///
    /// - Parameters:
    ///   - attributeName: the attribute to be verified.
    ///   - code: the code sent to the user.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func confirmVerifyUserAttribute(attributeName: String, code: String, completionHandler: @escaping ((Error?) -> Void)) {
        self.cognitoIdentityUser.verifyAttribute(attributeName, code: code).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(AWSMobileClientError.makeMobileClientError(from: error))
            } else if let _ = task.result {
                completionHandler(nil)
            }
            return nil
        }
    }
    
}
