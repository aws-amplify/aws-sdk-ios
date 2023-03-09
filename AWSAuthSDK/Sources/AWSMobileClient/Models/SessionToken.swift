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


/// Contains the token string and the claims for the token.
public struct SessionToken {

    /// The token string if available.
    public let tokenString: String?

    /// The claims associated with this token.
    public var claims: [String: AnyObject]? {
        if tokenString == nil {
            return nil
        } else {
            let tokenSplit = tokenString!.split(separator: ".")
            guard tokenSplit.count > 2 else {
                print("Token is not valid base64 encoded string.")
                return nil
            }
            let claims = tokenSplit[1]
                .replacingOccurrences(of: "-", with: "+")
                .replacingOccurrences(of: "_", with: "/")

            let paddedLength = claims.count + (4 - (claims.count % 4)) % 4
            //JWT is not padded with =, pad it if necessary
            let updatedClaims = claims.padding(toLength: paddedLength, withPad: "=", startingAt: 0)
            let encodedData = Data(base64Encoded: updatedClaims, options: .ignoreUnknownCharacters)

            guard let claimsData = encodedData else {
                print("Cannot get claims in `Data` form. Token is not valid base64 encoded string.")
                return nil
            }

            let jsonObject = try? JSONSerialization.jsonObject(with: claimsData, options: [])
            guard let convertedDictionary = jsonObject as? [String: AnyObject] else {
                print("Cannot get claims in `Data` form. Token is not valid JSON string.")
                return nil
            }
            return convertedDictionary
        }
    }

    init(tokenString: String?) {
        self.tokenString = tokenString
    }
}
