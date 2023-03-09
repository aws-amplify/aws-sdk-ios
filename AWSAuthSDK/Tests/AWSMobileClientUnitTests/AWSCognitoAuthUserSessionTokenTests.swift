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
    
    func testClaimsWithSpecialCharacters() {
        let tokenString = """
        eyJraWQiOiJaS0s5ZUlZbmo4UEtGQzUrMHdMQUhJMjd0SWcxRkRRZU9ybW82SVwvdFkwbz0iLCJhbGciOiJSUzI1NiJ9\
        .eyJmYy1pZCI6IjE2ZjFkOTM3LTY5YmQtNGI2OS1hMzJmLWYwNjkxNGY0YzIxOCIsInN1YiI6IjE2ZjFkOTM3LTY5YmQ\
        tNGI2OS1hMzJmLWYwNjkxNGY0YzIxOCIsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC51cy1lYXN0LTEuYW1hem9\
        uYXdzLmNvbVwvdXMtZWFzdC0xXzhqRVI4cHY0ViIsImNvZ25pdG86dXNlcm5hbWUiOiIxNmYxZDkzNy02OWJkLTRiNjk\
        tYTMyZi1mMDY5MTRmNGMyMTgiLCJnaXZlbl9uYW1lIjoiQm_DsWEiLCJhdWQiOiI2bTZ1dWlocmhzM3BzbGI0amhhdHJ\
        zYnBxYyIsImV2ZW50X2lkIjoiYjAzZjQ1YWMtM2FlMS0xMWU5LTlkZDItODcyODBlYTRiMGNhIiwidG9rZW5fdXNlIjo\
        iaWQiLCJhdXRoX3RpbWUiOjE1NTEzMDc2NjEsImV4cCI6MTU1MTMxMTI2MSwiaWF0IjoxNTUxMzA3NjYxLCJmYW1pbHl\
        fbmFtZSI6IkJhcsOnYSIsImVtYWlsIjoiaW5mb0Bkb25hYmFyY2EzLmRlIn0.OGT9siqf_tAYrhVA-EhYabz-L4ZNLe0\
        w0N7fH4rASs0scRGm-34g96qmSZoD1j74bplIRcMqoFaDI0cLejyeeLN-z2ib1MDsuMnyq8cHfuu4x4qBGVcxWGkIOBj\
        AEdsiU5U4xsEuaRpgC1rNiS7X6t0vQsDj3Jw3cV1XmJbeHaZB8D7EUMW6-zk4ZT2jKrpiaeaPTFoJJFOYiYdlJj4zkxX\
        T2nzldS9K57Mwz91YgbjF_VCxPl84b-aiBoj7_ARdu8LDP2HHkpVoNslWYuusatBOOJvTT56Fa2kJzZqoUuAnGiC8AYU\
        _YKpL_iu-wv5xnWHthuDCxhpl85cdROrAbA
        """
        let sessionToken = AWSCognitoAuthUserSessionToken()
        sessionToken.setValue(tokenString, forKey: "tokenString")
        
        let claims = sessionToken.claims
        
        XCTAssertNotNil(claims)
        guard let givenName = claims["given_name"] as? String else {
            XCTFail("Claim should contain name")
            return
        }
        XCTAssertEqual(givenName, "Boña")
        
        guard let familyName = claims["family_name"] as? String else {
            XCTFail("Claim should contain sub")
            return
        }
        XCTAssertEqual(familyName, "Barça")
        
        guard let iat = claims["iat"] as? Int else {
            XCTFail("Claim should contain iat")
            return
        }
        
        guard let sub = claims["sub"] as? String else {
            XCTFail("Claim should contain sub")
            return
        }
        XCTAssertEqual(sub, "16f1d937-69bd-4b69-a32f-f06914f4c218")
        
        XCTAssertEqual(iat, 1551307661)
    }
}

