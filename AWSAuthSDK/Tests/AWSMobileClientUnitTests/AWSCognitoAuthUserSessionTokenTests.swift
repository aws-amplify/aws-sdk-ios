//
//  AWSCognitoAuthUserSessionTokenTests.swift
//  AWSAppleSignIn
//
//  Created by Roy, Jithin on 6/4/21.
//  Copyright © 2021 Amazon Web Services. All rights reserved.
//

import Foundation
import XCTest

import AWSCore
@testable import AWSMobileClient


class AWSCognitoAuthUserSessionTokenTests: XCTestCase {

    /// Test successful claims with no special characters
    ///
    /// - Given: AWSCognitoAuthUserSessionToken with token with payload
    ///     {
    ///         "sub": "2933",
    ///         "name": "SomeFN SomeLN",
    ///         "iat": 1516239022
    ///     }
    /// - When:
    ///    - I invoke `claims` on the token object
    /// - Then:
    ///    - I should get back the name sub and iat
    func testClaims() {
        let tokenString = """
        eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.\
        eyJzdWIiOiIyOTMzIiwibmFtZSI6IlNvbWVGTiBTb21lTE4iLCJpYXQiOjE1MTYyMzkwMjJ9.\
        JP1Rai2HOGbbmQCoIq2dO4FKPRYjK9xsylwPOowg2KI
        """
        let sessionToken = AWSCognitoAuthUserSessionToken()
        sessionToken.setValue(tokenString, forKey: "tokenString")
        
        let claims = sessionToken.claims
        
        XCTAssertNotNil(claims)
        guard let name = claims["name"] as? String else {
            XCTFail("Claim should contain name")
            return
        }
        XCTAssertEqual(name, "SomeFN SomeLN")
        
        guard let sub = claims["sub"] as? String else {
            XCTFail("Claim should contain sub")
            return
        }
        XCTAssertEqual(sub, "2933")
        
        guard let iat = claims["iat"] as? Int else {
            XCTFail("Claim should contain iat")
            return
        }
        XCTAssertEqual(iat, 1516239022)
    }
    
    /// Test successful claims with  special characters
    ///
    /// - Given: AWSCognitoAuthUserSessionToken with token with payload
    ///     {
    ///         "sub": "2933",
    ///         "name": "こんにちは、元気ですか",
    ///         "iat": 1516239022
    ///     }
    /// - When:
    ///    - I invoke `claims` on the token object
    /// - Then:
    ///    - I should get back the name sub and iat
    func testClaimsWithJapanese() {
        let tokenString = """
        eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.\
        eyJzdWIiOiIyOTMzIiwibmFtZSI6IuOBk-OCk-OBq-OBoeOBr-OAgeWFg-awl-OBp-OBmeOBiyIsImlhdCI6MTUxNjIzOTAyMn0.\
        88CtaYm4duFs6q5wYsDUAAMTjSNMIxvl_tv-2YxV6kQ
        """
        let sessionToken = AWSCognitoAuthUserSessionToken()
        sessionToken.setValue(tokenString, forKey: "tokenString")
        
        let claims = sessionToken.claims
        
        XCTAssertNotNil(claims)
        guard let name = claims["name"] as? String else {
            XCTFail("Claim should contain name")
            return
        }
        XCTAssertEqual(name, "こんにちは、元気ですか")
        
        guard let sub = claims["sub"] as? String else {
            XCTFail("Claim should contain sub")
            return
        }
        XCTAssertEqual(sub, "2933")
        
        guard let iat = claims["iat"] as? Int else {
            XCTFail("Claim should contain iat")
            return
        }
        XCTAssertEqual(iat, 1516239022)
    }
}

