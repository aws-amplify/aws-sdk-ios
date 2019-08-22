//
//  AWSMobileClientUserDetails.swift
//  AWSMobileClient
//

import Foundation
import AWSCognitoIdentityProvider

class AWSMobileClientUserDetails {
    
    let user:AWSCognitoIdentityUser
    
    init(withUser: AWSCognitoIdentityUser) {
            user = withUser
    }
    
    /// Verify a user attribute like phone_number.
    ///
    /// - Parameters:
    ///   - attributeName: name of the attribute.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func verifyUserAttribute(attributeName: String, completionHandler: @escaping ((UserCodeDeliveryDetails?, Error?) -> Void)) {
        self.user.getAttributeVerificationCode(attributeName).continueWith { (task) -> Any? in
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
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func updateUserAttributes(attributeMap: [String: String], completionHandler: @escaping (([UserCodeDeliveryDetails]?, Error?) -> Void)) {
        let attributes = attributeMap.map {AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1) }
        self.user.update(attributes).continueWith { (task) -> Any? in
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
        self.user.getDetails().continueWith { (task) -> Any? in
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
        self.user.verifyAttribute(attributeName, code: code).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(AWSMobileClientError.makeMobileClientError(from: error))
            } else if let _ = task.result {
                completionHandler(nil)
            }
            return nil
        }
    }
    
}
