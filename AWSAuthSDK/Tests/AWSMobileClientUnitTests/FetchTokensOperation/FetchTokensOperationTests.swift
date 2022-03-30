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
import XCTest

import AWSCore
@testable import AWSMobileClient

class FetchTokensOperationTests: XCTestCase {

    let timeout: TimeInterval = 2

    /// Test successful getTokens api
    ///
    /// - Given: FetchUserPoolTokensOperation with mocked dependencies
    /// - When:
    ///    - I mock a username and valid token
    ///    - Then I  invoke the operation
    /// - Then:
    ///    - I should get back the token as response
    func testGetTokenSuccess() {
        let operationQueue = OperationQueue()
        let expectation = expectation(description: "Operation should complete")
        let session = AWSCognitoIdentityUserSession()
        let mockUser = MockUser(result: .success(session.mobileClientTokens))
        let mockUserPool = MockUserPool(user: mockUser)
        let delegate = MockDelegate()
        delegate.username = "testusername"

        let operation = FetchUserPoolTokensOperation(userPool: mockUserPool) { tokens, error in
            defer {
                expectation.fulfill()
            }
            XCTAssertNotNil(tokens)
        }
        operation.delegate =  delegate
        operationQueue.addOperation(operation)
        wait(for: [expectation], timeout: timeout)
    }

    /// Test fail getTokens api with nil username
    ///
    /// - Given: FetchUserPoolTokensOperation with mocked dependencies
    /// - When:
    ///    - I mock a nil username and valid token
    ///    - Then I  invoke the operation
    /// - Then:
    ///    - I should get back error
    func testGetTokenFailWithNoUsername() {
        let operationQueue = OperationQueue()
        let expectation = expectation(description: "Operation should complete")
        let session = AWSCognitoIdentityUserSession()
        let mockUser = MockUser(result: .success(session.mobileClientTokens))
        let mockUserPool = MockUserPool(user: mockUser)
        let delegate = MockDelegate()
        delegate.username = nil

        let operation = FetchUserPoolTokensOperation(userPool: mockUserPool) { tokens, error in
            defer {
                expectation.fulfill()
            }
            XCTAssertNil(tokens)
            guard let mobileClientError = error as? AWSMobileClientError,
                  case .notSignedIn = mobileClientError else {
                      XCTFail("Should be error but received \(String(describing: error))")
                      return
                  }
        }
        operation.delegate =  delegate
        operationQueue.addOperation(operation)
        wait(for: [expectation], timeout: timeout)
    }

    /// Test fail getTokens api with error from CognitoUserPool
    ///
    /// - Given: FetchUserPoolTokensOperation with mocked dependencies
    /// - When:
    ///    - I mock a valid username and error from Service
    ///    - Then I  invoke the operation
    /// - Then:
    ///    - I should get back error
    func testGetTokenFailWithError() {
        let operationQueue = OperationQueue()
        let expectation = expectation(description: "Operation should complete")
        
        let error = NSError(domain: AWSCognitoIdentityProviderErrorDomain,
                            code: AWSCognitoIdentityClientErrorType.providerClientErrorUnknown.rawValue,
                            userInfo: nil)
        let mockUser = MockUser(result: .failure(error))
        let mockUserPool = MockUserPool(user: mockUser)
        let delegate = MockDelegate()
        delegate.username = "testUser"

        let operation = FetchUserPoolTokensOperation(userPool: mockUserPool) { tokens, error in
            defer {
                expectation.fulfill()
            }
            XCTAssertNil(tokens)
            XCTAssertNotNil(error)
        }
        operation.delegate =  delegate
        operationQueue.addOperation(operation)
        wait(for: [expectation], timeout: timeout)
    }

    /// Test fail getTokens api with re-authenticate error from CognitoUserPool
    ///
    /// - Given: FetchUserPoolTokensOperation with mocked dependencies
    /// - When:
    ///    - I mock a valid username and error from Service
    ///    - Then I  invoke the operation
    /// - Then:
    ///    - I should get back error
    func testGetTokenFailWithReAuthError() {
        let operationQueue = OperationQueue()
        let error = NSError(domain: AWSCognitoIdentityProviderErrorDomain,
                            code: AWSCognitoIdentityClientErrorType.providerClientErrorInvalidAuthenticationDelegate.rawValue,
                            userInfo: nil)
        let mockUser = MockUser(result: .failure(error))
        let mockUserPool = MockUserPool(user: mockUser)
        let delegate = MockDelegate()
        delegate.username = "testUser"

        let operation = FetchUserPoolTokensOperation(userPool: mockUserPool) { tokens, error in
            XCTFail("Should not reach here")
        }
        operation.delegate =  delegate
        operationQueue.addOperation(operation)
        sleep(1)
        XCTAssertTrue(delegate.didReachAuth)
    }

    /// Test fail getTokens api with re-authenticate error from CognitoUserPool
    ///
    /// - Given: FetchUserPoolTokensOperation with mocked dependencies
    /// - When:
    ///    - I mock a valid username and error from Service
    ///    - Then I  invoke the operation
    /// - Then:
    ///    - I should get back error
    func testGetTokenFailWithReleaseSignInWaitReAuthError() {
        let operationQueue = OperationQueue()
        let expectation = expectation(description: "Operation should complete")

        let error = NSError(domain: AWSCognitoIdentityProviderErrorDomain,
                            code: AWSCognitoIdentityClientErrorType.providerClientErrorInvalidAuthenticationDelegate.rawValue,
                            userInfo: nil)
        let mockUser = MockUser(result: .failure(error))
        let mockUserPool = MockUserPool(user: mockUser)
        let delegate = MockDelegate()
        delegate.username = "testUser"

        let operation = FetchUserPoolTokensOperation(userPool: mockUserPool) { tokens, error in
            defer {
                expectation.fulfill()
            }
            XCTAssertNil(tokens)
            guard let mobileClientError = error as? AWSMobileClientError,
                  case .unableToSignIn = mobileClientError else {
                      XCTFail("Should be error but received \(String(describing: error))")
                      return
                  }
        }
        operation.delegate =  delegate
        operationQueue.addOperation(operation)
        sleep(1)
        XCTAssertTrue(delegate.didReachAuth)
        operation.acceptEvent(.releaseWait)
        wait(for: [expectation], timeout: timeout)
    }

    /// Test fail getTokens api with re-authenticate error from CognitoUserPool
    ///
    /// - Given: FetchUserPoolTokensOperation with mocked dependencies
    /// - When:
    ///    - I mock a valid username and error from Service
    ///    - Then I  invoke the operation
    /// - Then:
    ///    - I should get back error
    func testMultipleGetTokenFailWithReleaseSignInWaitReAuthError() {
        
        let operationQueue = OperationQueue()
        let expectation = expectation(description: "Operation should complete")
        expectation.expectedFulfillmentCount = 50

        let error = NSError(domain: AWSCognitoIdentityProviderErrorDomain,
                            code: AWSCognitoIdentityClientErrorType.providerClientErrorInvalidAuthenticationDelegate.rawValue,
                            userInfo: nil)
        let mockUser = MockUser(result: .failure(error))
        let mockUserPool = MockUserPool(user: mockUser)
        let delegate = MockDelegate()
        delegate.username = "testUser"

        var fetchOperations: [FetchUserPoolTokensOperation] = []

        for _ in 1...expectation.expectedFulfillmentCount {
            let operation = FetchUserPoolTokensOperation(userPool: mockUserPool) { tokens, error in
                defer {
                    expectation.fulfill()
                }
                XCTAssertNil(tokens)
                guard let mobileClientError = error as? AWSMobileClientError,
                      case .unableToSignIn = mobileClientError else {
                          XCTFail("Should be error but received \(String(describing: error))")
                          return
                      }
            }
            operation.delegate =  delegate
            fetchOperations.append(operation)
            operationQueue.addOperation(operation)
        }
        sleep(1)
        XCTAssertTrue(delegate.didReachAuth)
        fetchOperations.forEach { op in
            op.acceptEvent(.releaseWait)
        }
        wait(for: [expectation], timeout: timeout)
    }
}


class MockDelegate: FetchUserPoolTokensDelegate {
    var username: String? = nil
    var didReachAuth: Bool = false

    func tokenFetchNeedsAuthentication(operation: FetchUserPoolTokensOperation) {
        didReachAuth = true
    }

    func getCurrentUsername(operation: FetchUserPoolTokensOperation) -> String? {
        return username
    }
}
