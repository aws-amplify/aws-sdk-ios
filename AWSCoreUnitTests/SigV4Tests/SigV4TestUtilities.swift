//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

// Convenience extension to allow us to `throw` strings
extension String: Error { }

extension URLQueryItem: Comparable {
    public static func < (lhs: URLQueryItem, rhs: URLQueryItem) -> Bool {
        if lhs.name < rhs.name {
            return true
        }

        if lhs.name > rhs.name {
            return false
        }

        return lhs.value < rhs.value
    }
}

extension Optional: Comparable where Wrapped: Comparable {
    public static func < (lhs: Optional<Wrapped>, rhs: Optional<Wrapped>) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return false
        case (.some, .none):
            return true
        case (.none, .some):
            return false
        case let (.some(a), .some(b)):
            return a < b
        }
    }
}

extension String {
    static var sigV4UnreservedCharacters: CharacterSet = {
        var sigV4UnreservedCharacters = CharacterSet(charactersIn: "A"..."Z")
        sigV4UnreservedCharacters = sigV4UnreservedCharacters.union(CharacterSet(charactersIn: "a"..."z"))
        sigV4UnreservedCharacters = sigV4UnreservedCharacters.union(CharacterSet(charactersIn: "0"..."9"))
        sigV4UnreservedCharacters = sigV4UnreservedCharacters.union(CharacterSet(charactersIn: "-_~."))
        return sigV4UnreservedCharacters
    }()

    func percentEncodedPerSigV4Rules() -> String {
        let encoded = self.addingPercentEncoding(withAllowedCharacters: String.sigV4UnreservedCharacters)
        return encoded!
    }
}
