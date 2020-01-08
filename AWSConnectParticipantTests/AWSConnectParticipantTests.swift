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

import XCTest
import AWSConnectParticipant
import AWSConnect

class AWSConnectParticipantTests: XCTestCase {

    var connectSerivceClient: AWSConnect?
    var connectChatClient: AWSConnectParticipant?
    var participantToken: String?
    
    override func setUp() {
        super.setUp()
        AWSTestUtility.setupCredentialsViaFile()
        connectSerivceClient = AWSConnect.default()
        connectChatClient = AWSConnectParticipant.default()
        fetchParticipantToken()
    }
    
    func fetchParticipantToken() {
        let startChatContactRequest = AWSConnectStartChatContactRequest()

        AWSDDLog.sharedInstance.logLevel = .verbose
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        let credentialsJson: [String : String]? = AWSTestUtility.getCredentialsJsonAsDictionary()
        if credentialsJson?["amazon-connect-instance-id"] != nil {
            startChatContactRequest?.instanceId = credentialsJson?["amazon-connect-instance-id"]
        }
        if credentialsJson?["amazon-connect-contactFlow-id"] != nil {
            startChatContactRequest?.contactFlowId = credentialsJson?["amazon-connect-contactFlow-id"]
        }
    
        let participantDetial = AWSConnectParticipantDetails()
        participantDetial?.displayName = "aws-integration-test"
        startChatContactRequest?.participantDetails = participantDetial
        let startChatContactExcpectation = XCTestExpectation(description: "startChatContact should complete")
        connectSerivceClient?.startChatContact(startChatContactRequest!).continueWith(block: { (task) -> Any? in
            defer {
                startChatContactExcpectation.fulfill()
            }
            guard let result = task.result else {
                XCTFail("Start chat contact did not return with a result.")
                if let error = task.error {
                    print("Error occured \(error)")
                }
                return nil
            }
            self.participantToken = result.participantToken
            XCTAssertNotNil(self.participantToken, "Participant token should not be nil")
            return nil
        })
        wait(for: [startChatContactExcpectation], timeout: 15)
    }
    
    /// Test to see if createConnectionDetails returns a valid token
    ///
    /// - Given: Valid participantToken
    /// - When:
    ///    - I call createConnectionDetails
    /// - Then:
    ///    - Should return with a valid result with credentials and authentication token
    ///
    func testCreateConnectionDetails() {
        let createConnectionRequest = AWSConnectParticipantCreateParticipantConnectionRequest()
        createConnectionRequest?.participantToken = self.participantToken
        createConnectionRequest?.types = ["CONNECTION_CREDENTIALS"]
        
        let createConnectionExpectation = XCTestExpectation(description: "Create connection expectation")

        connectChatClient?.createParticipantConnection(createConnectionRequest!).continueWith(block: { (task) -> Any? in
            defer {
                createConnectionExpectation.fulfill()
            }
            guard let result = task.result else {
                XCTFail("CreateConnectionDetails did not return with a result.")
                if let error = task.error {
                    print("Error occured \(error)")
                }
                return nil
            }
            XCTAssertNotNil(result.connectionCredentials, "Connection Credentials is nil")
            return nil
        })
        wait(for: [createConnectionExpectation], timeout: 15)
    }
    
    /// Test whether the sendChatMessage is invoke correctly
    ///
    /// - Given: A valid connection token
    /// - When:
    ///    - I invoke sendChatMessage
    /// - Then:
    ///    - Get a response with messageId
    ///
    func testSendChatMessage() {
        var connectionAuthenticationToken: String = ""

        let createConnectionExpectation = XCTestExpectation(description: "Create connection expectation")
        let createConnectionRequest = AWSConnectParticipantCreateParticipantConnectionRequest()
        createConnectionRequest?.participantToken = self.participantToken
        createConnectionRequest?.types = ["CONNECTION_CREDENTIALS"]
        connectChatClient?.createParticipantConnection(createConnectionRequest!).continueWith(block: { (task) -> Any? in
            defer {
                createConnectionExpectation.fulfill()
            }
            guard let result = task.result else {
                XCTFail("CreateConnectionDetails did not return with a result.")
                if let error = task.error {
                    print("Error occured \(error)")
                }
                return nil
            }
            XCTAssertNotNil(result.connectionCredentials?.connectionToken, "Connection Token is nil")
            connectionAuthenticationToken = result.connectionCredentials!.connectionToken!
            return nil
        })
        wait(for: [createConnectionExpectation], timeout: 15)
        XCTAssertNotEqual(connectionAuthenticationToken, "", "Connection authentication token should not be empty")

        let sendChatMessageExpectation = XCTestExpectation(description: "Send chat expectation")
        let sendChatMessageRequest = AWSConnectParticipantSendMessageRequest()
        sendChatMessageRequest?.connectionToken = connectionAuthenticationToken
        sendChatMessageRequest?.content = "Hello"
        sendChatMessageRequest?.contentType = "text/plain"
        connectChatClient?.sendMessage(sendChatMessageRequest!).continueWith(block: { (task) -> Any? in
            defer {
                sendChatMessageExpectation.fulfill()
            }
            guard let result = task.result else {
                XCTFail("sendChatMessage did not return with a result.")
                if let error = task.error {
                    print("Error occured \(error)")
                }
                return nil
            }
            XCTAssertNotNil(result.identifier, "Message Id should not be nil.")
            return nil
        })
        wait(for: [sendChatMessageExpectation], timeout: 15)
    }

}
