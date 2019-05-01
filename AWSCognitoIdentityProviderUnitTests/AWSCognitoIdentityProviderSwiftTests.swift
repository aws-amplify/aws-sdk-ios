//
// Copyright 2014-2018 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest

import AWSCognitoIdentityProvider

// https://github.com/aws-amplify/aws-sdk-ios/pull/1068 identified that the implementation of AWSCognitoIdentityUserSessionToken
// crashed in Swift when the claim value wasn't a string. This test case exists to confirm proper behavior of the
// AWSCognitoIdentityProvider module in Swift
class AWSCognitoIdentityProviderSwiftTests: XCTestCase {

    /*
     The base64 encoded representation of the token:
     header: {"typ": "JWT", "alg": "HS256"}
     payload: {"aud":["aud1","aud2"],"iat":1516239022,"iss":"The Issuer","name":"John Doe","sub":"1234567890","http://example.com/is_root":true}
     secret: the-secret
     */
    struct TestTokenData {
        static let header = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"
        static let payload = "eyJhdWQiOlsiYXVkMSIsImF1ZDIiXSwiaWF0IjoxNTE2MjM5MDIyLCJpc3MiOiJUaGUgSXNz" +
            "dWVyIiwibmFtZSI6IkpvaG4gRG9lIiwic3ViIjoiMTIzNDU2Nzg5MCIsImh0dHA6Ly9leGFt" +
            "cGxlLmNvbS9pc19yb290Ijp0cnVlfQ"
        static let signature = "cTRtETWuhEcJNxJUoqKOuiYz5liCR9hk3ewDB5Tp-Rw"
        static var tokenString: String {
            return [header, payload, signature].joined(separator: ".")
        }
    }

    func testAWSCognitoIdentityUserSessionTokenClaims() {
        let tokenString = TestTokenData.tokenString
        let token = AWSCognitoIdentityUserSessionToken(token: tokenString)
        let claims = token.tokenClaims
        XCTAssertNil(claims["thisClaimDoesNotExist"])

        let audienceFromClaims = claims["aud"] as! [String]
        XCTAssertEqual(audienceFromClaims.count, 2)
        XCTAssertEqual(audienceFromClaims[0], "aud1")
        XCTAssertEqual(audienceFromClaims[1], "aud2")

        XCTAssertEqual(claims["iat"] as! Int, 1516239022)
        XCTAssertEqual(claims["iss"] as! String, "The Issuer")
        XCTAssertEqual(claims["name"] as! String, "John Doe")
        XCTAssertEqual(claims["sub"] as! String, "1234567890")
        XCTAssertEqual(claims["http://example.com/is_root"] as! Bool, true)
    }

}
