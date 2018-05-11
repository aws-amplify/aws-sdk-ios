//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
import AWSIoT

class AWSIoTDataManagerTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        //Constants
        let CertificateSigningRequestCommonName = "AWS IOT Certificate"
        let CertificateSigningRequestCountryName = "US"
        let CertificateSigningRequestOrganizationName = "Amazon.com"
        let CertificateSigningRequestOrganizationalUnitName = "Amazon Web Services"
        let PolicyName = "AWSiOSSDKv2Test"
        
        //Setup Log level
        AWSDDLog.sharedInstance.logLevel = .verbose
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        
        //Setup creds
        AWSTestUtility.setupCognitoCredentialsProvider()
        
        //Setup iOT configuration
        let iotManagerConfiguration = AWSServiceConfiguration(region: .USEast1 ,
                                                                   credentialsProvider:AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider)
        
        print("Endpoint is ", AWSTestUtility.getIoTEndPoint().url.absoluteString)
        let iotDataManagerConfiguration = AWSServiceConfiguration(region: .USEast1,
                                                                endpoint: AWSTestUtility.getIoTEndPoint(),
                                                                credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider)
        
        AWSServiceManager.default().defaultServiceConfiguration = iotManagerConfiguration
        
        AWSIoTDataManager.register(with:iotDataManagerConfiguration!, forKey:"iot-data-manager")
        AWSIoTManager.register(with: iotManagerConfiguration!, forKey: "iot-manager")
        
        
        //Create Cert for authentication if required
        let defaults = UserDefaults.standard
        var certificateID:String? = defaults.string(forKey: "TestCert")
        if (certificateID == nil) {
            //Certificate not found. Create one
            
            let csrDictionary = [ "commonName":CertificateSigningRequestCommonName, "countryName":CertificateSigningRequestCountryName, "organizationName":CertificateSigningRequestOrganizationName, "organizationalUnitName":CertificateSigningRequestOrganizationalUnitName]
            
            let dispatchGroup = DispatchGroup()
            dispatchGroup.enter()
            
            let iotManager:AWSIoTManager = AWSIoTManager(forKey: "iot-manager")
            iotManager.createKeysAndCertificate(fromCsr: csrDictionary, callback: {  (response ) -> Void in
                if (response != nil)
                {
                    defaults.set(response?.certificateId, forKey:"TestCert")
                    defaults.set(response?.certificateArn, forKey:"certificateArn")
                    certificateID = response?.certificateId
                    
                    let attachPrincipalPolicyRequest = AWSIoTAttachPrincipalPolicyRequest()
                    attachPrincipalPolicyRequest?.policyName = PolicyName
                    attachPrincipalPolicyRequest?.principal = response?.certificateArn
                    
                    // Attach the policy to the certificate
                    AWSIoT.default().attachPrincipalPolicy(attachPrincipalPolicyRequest!).continueWith (block: { (task) -> AnyObject? in
                        if let error = task.error {
                            print("failed: [\(error)]")
                            return nil
                        }
                        print("result: [\(String(describing: task.result))]")
                        dispatchGroup.leave()
                        return nil
                    })
                }
                else
                {
                    print("Unable to create keys and/or certificate, check values in Constants.swift")
                    dispatchGroup.leave()
                }
            } )
            dispatchGroup.wait()
        }
    }
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConnectAndDisconnectWithCert() {
        var connected = false
        let hasConnected = self.expectation(description: "MQTT connection has been established")
        let hasDisconnected = self.expectation(description: "Disconnected")
        
        func mqttEventCallback( _ status: AWSIoTMQTTStatus )
        {
            print("connection status = \(status.rawValue)")
            switch(status)
            {
            case .connecting:
                print ("Connecting...")
                
            case .connected:
                print("Connected")
                connected = true
                hasConnected.fulfill()
                
            case .disconnected:
                print("Disconnected")
                connected = false
                hasDisconnected.fulfill()
                
            case .connectionRefused:
                print("Connection Refused")
                hasConnected.fulfill()
                
            case .connectionError:
                print("Connection Error")
                hasConnected.fulfill()
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager")
        let uuid = UUID().uuidString
        print("Calling Connect")
        let defaults = UserDefaults.standard
        let certificateID:String? = defaults.string(forKey: "TestCert")
        
        iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback)
        print("Connect call completed")
        
        wait(for:[hasConnected], timeout: 5)
        XCTAssertTrue(connected, "Successfully established MQTT Connection")
        
        if (connected) {
            iotDataManager.disconnect()
            wait(for:[hasDisconnected], timeout:5)
            XCTAssertFalse(connected)
        }
    }
    
    func testConnectAndDisconnectWithIAMandSIGV4() {
        var connected = false
        let hasConnected = self.expectation(description: "MQTT connection has been established")
        let hasDisconnected = self.expectation(description: "Disconnected")
        
        func mqttEventCallback( _ status: AWSIoTMQTTStatus )
        {
            print("connection status = \(status.rawValue)")
            switch(status)
            {
            case .connecting:
                print ("Connecting...")
                
            case .connected:
                print("Connected")
                connected = true
                hasConnected.fulfill()
                
            case .disconnected:
                print("Disconnected")
                connected = false
                hasDisconnected.fulfill()
                
            case .connectionRefused:
                print("Connection Refused")
                hasConnected.fulfill()
                
            case .connectionError:
                print("Connection Error")
                hasConnected.fulfill()
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager")
        let uuid = UUID().uuidString
        print("Calling Connect")
        
        iotDataManager.connectUsingWebSocket(withClientId: uuid, cleanSession: true, statusCallback: mqttEventCallback)
        print("Connect call completed")
        
        wait(for:[hasConnected], timeout: 5)
        XCTAssertTrue(connected, "Successfully established MQTT Connection")
        
        if (connected) {
            iotDataManager.disconnect()
            wait(for:[hasDisconnected], timeout:5)
            XCTAssertFalse(connected)
        }
    }
    
    func testPublishSubscribe() {
        var messageCount = 0
        var connected = false
        let hasConnected = self.expectation(description: "MQTT connection has been established")
        let hasDisconnected = self.expectation(description: "Disconnected")
        let gotMessage = self.expectation(description: "Got message on subscription")
        
        func mqttEventCallback( _ status: AWSIoTMQTTStatus )
        {
            print("connection status = \(status.rawValue)")
            switch(status)
            {
            case .connecting:
                print ("Connecting...")
                
            case .connected:
                print("Connected")
                connected = true
                hasConnected.fulfill()
                
            case .disconnected:
                print("Disconnected")
                connected = false
                hasDisconnected.fulfill()
                
            case .connectionRefused:
                print("Connection Refused")
                hasConnected.fulfill()
                
            case .connectionError:
                print("Connection Error")
                hasConnected.fulfill()
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager")
        let uuid = UUID().uuidString
        print("Calling Connect")
        let defaults = UserDefaults.standard
        let certificateID:String? = defaults.string(forKey: "TestCert")
        
        iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback)
        print("Connect call completed")
        
        wait(for:[hasConnected], timeout: 5)
        XCTAssertTrue(connected, "Successfully established MQTT Connection")
        if (!connected) {
            return
        }
        
        let testMessage = "Test Message"
        let testTopic = "TestTopic"
        
        //Subscribe to TestTopic
        iotDataManager.subscribe(toTopic: testTopic, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: {
            (payload) ->Void in
            let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
            print("received: \(stringValue)")
            XCTAssertEqual(testMessage, stringValue)
            messageCount = messageCount+1
            if (messageCount >= 5 ) {
                gotMessage.fulfill()
            }
        })
        
        //Publish to TestTopic 5 times
        for _ in 1...5 {
            iotDataManager.publishString(testMessage, onTopic:testTopic, qoS:.messageDeliveryAttemptedAtLeastOnce)
        }
        
        wait(for:[gotMessage], timeout:30)
        
        //Disconnect
        iotDataManager.disconnect()
        wait(for:[hasDisconnected], timeout:5)
        XCTAssertFalse(connected)
        
    }
 
    func testPublishSubscribeWithCallback() {
        var messageCount = 0
        var pubAckCount = 0
        var connected = false
        let hasConnected = self.expectation(description: "MQTT connection has been established")
        let hasDisconnected = self.expectation(description: "Disconnected")
        let gotMessage = self.expectation(description: "Got message on subscription")
        let subscriptionAcknowledged = self.expectation(description: "Subscription acknowledged")
        let publishesAcknowledged = self.expectation(description: "Publishes acknowledged")
        
        func mqttEventCallback( _ status: AWSIoTMQTTStatus )
        {
            print("connection status = \(status.rawValue)")
            switch(status)
            {
            case .connecting:
                print ("Connecting...")
                
            case .connected:
                print("Connected")
                connected = true
                hasConnected.fulfill()
                
            case .disconnected:
                print("Disconnected")
                connected = false
                hasDisconnected.fulfill()
                
            case .connectionRefused:
                print("Connection Refused")
                hasConnected.fulfill()
                
            case .connectionError:
                print("Connection Error")
                hasConnected.fulfill()
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager")
        let uuid = UUID().uuidString
        print("Calling Connect")
        let defaults = UserDefaults.standard
        let certificateID:String? = defaults.string(forKey: "TestCert")
        
        iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback)
        print("Connect call completed")
        
        wait(for:[hasConnected], timeout: 5)
        XCTAssertTrue(connected, "Successfully established MQTT Connection")
        if (!connected) {
            return
        }
        
        let testMessage = "Test Message"
        let testTopic = "TestTopic"
        
        //Subscribe to TestTopic
        iotDataManager.subscribe(toTopic: testTopic, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: { (payload) ->Void in
            let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
            print("received: \(stringValue)")
            XCTAssertEqual(testMessage, stringValue)
            messageCount = messageCount+1
            if (messageCount >= 5 ) {
                gotMessage.fulfill()
            }
        }) {
            subscriptionAcknowledged.fulfill()
        }
        //Wait for subcriptionAcknowledgement to be received.
        wait(for: [subscriptionAcknowledged], timeout: 5)
        
        //Publish to TestTopic 5 times
        for _ in 1...5 {
            iotDataManager.publishString(testMessage, onTopic: testTopic, qoS: .messageDeliveryAttemptedAtLeastOnce, ackCallback: {
                pubAckCount = pubAckCount+1
                if (pubAckCount >= 5 ) {
                    publishesAcknowledged.fulfill()
                }
            })
        }
        //wait for publish acknowledges 
        wait(for:[publishesAcknowledged], timeout: 5)
        
        //Wait for the messages to be received
        wait(for:[gotMessage], timeout:30)
        
        //Disconnect
        iotDataManager.disconnect()
        wait(for:[hasDisconnected], timeout:5)
        XCTAssertFalse(connected)
        
    }
}


