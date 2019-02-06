//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    
    static var tokenKeyName: String? = nil
    static var tokenValue: String? = nil
    static var tokenSignature: String? = nil
    static var customAuthorizerName: String? = nil
    
    override class func setUp() {
        super.setUp()
        //Constants
        let CertificateSigningRequestCommonName = "AWS IOT Certificate"
        let CertificateSigningRequestCountryName = "US"
        let CertificateSigningRequestOrganizationName = "Amazon.com"
        let CertificateSigningRequestOrganizationalUnitName = "Amazon Web Services"
        let PolicyName = "AWSiOSSDKv2Test"
        
        //Setup Log level
        AWSDDLog.sharedInstance.logLevel = .debug
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        
        //Setup creds
        AWSTestUtility.setupCognitoCredentialsProvider()
        
        //Create MQTT Config
        let lwt = AWSIoTMQTTLastWillAndTestament()
        lwt.topic = "will-topic";
        lwt.qos = AWSIoTMQTTQoS.messageDeliveryAttemptedAtLeastOnce

        let mqttConfig = AWSIoTMQTTConfiguration.init(keepAliveTimeInterval: 30.0,
                                                      baseReconnectTimeInterval: 1.0, minimumConnectionTimeInterval: 20, maximumReconnectTimeInterval: 8, runLoop: RunLoop.current , runLoopMode: RunLoopMode.defaultRunLoopMode.rawValue, autoResubscribe: true, lastWillAndTestament: lwt)

        //Setup iOT Manager for Broker 1
        let iotConfigurationBroker1 = AWSServiceConfiguration(region: .USEast1 ,
                credentialsProvider:AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = iotConfigurationBroker1
        AWSIoTManager.register(with: iotConfigurationBroker1!, forKey: "iot-manager-broker1")
        AWSIoT.register(with: iotConfigurationBroker1!, forKey: "iot-broker1")
        
        //Setup iOT Manager for Broker 2
        let iotConfigurationBroker2 = AWSServiceConfiguration(region: .USEast2 ,
            credentialsProvider:AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = iotConfigurationBroker2
        AWSIoTManager.register(with: iotConfigurationBroker2!, forKey: "iot-manager-broker2")
        AWSIoT.register(with: iotConfigurationBroker2!, forKey: "iot-broker2")
        
        
        //Setup iOT Data Manager for Broker 1
        let endpoint1 = AWSTestUtility.getIoTEndPoint("iot-us-east1-endpoint")
        XCTAssert(endpoint1 != nil, "Could not fetch the iot endpoint from the config file.")
        let iotDataManagerConfigurationBroker1 = AWSServiceConfiguration(region: .USEast1,
                endpoint: AWSEndpoint(urlString: endpoint1!),
                credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider)
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker1!, with: mqttConfig, forKey:"iot-data-manager-broker1")
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker1!, with: mqttConfig, forKey:"iot-data-manager-broker")
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker1!, with: mqttConfig, forKey:"iot-data-manager-broker-test-subscribe-without-connect")
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker1!, with: mqttConfig, forKey:"iot-data-manager-broker-test-without-connect")
        
        
        //Setup iOT Data Manager for Broker 2
        let endpoint2 = AWSTestUtility.getIoTEndPoint("iot-us-east2-endpoint")
        XCTAssert(endpoint2 != nil, "Could not fetch the iot endpoint from the config file.")
        let iotDataManagerConfigurationBroker2 = AWSServiceConfiguration(region: .USEast2,
                endpoint:  AWSEndpoint(urlString: endpoint2!),
                credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider)
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker2!, with: mqttConfig, forKey:"iot-data-manager-broker2")
        
        //Setup iOT Data Manager for Custom Auth using endpoint-1
        func setUpIoTDataManagerWithCustomAuth() -> Void {
            let credentialsJson: [String : String]? = AWSTestUtility.getCredentialsJsonAsDictionary()
            if credentialsJson?["iot-custom-authorizer-name"] != nil {
                AWSIoTDataManagerTests.customAuthorizerName = credentialsJson?["iot-custom-authorizer-name"]
            }
            
            if credentialsJson?["iot-custom-authorizer-token-value"] != nil {
                AWSIoTDataManagerTests.tokenValue = credentialsJson?["iot-custom-authorizer-token-value"]
            }
            
            if credentialsJson?["iot-custom-authorizer-token-key-name"] != nil {
                AWSIoTDataManagerTests.tokenKeyName = credentialsJson?["iot-custom-authorizer-token-key-name"]
            }
            
            if credentialsJson?["iot-custom-authorizer-token-signature"] != nil {
                AWSIoTDataManagerTests.tokenSignature = credentialsJson?["iot-custom-authorizer-token-signature"]
            }
            
            let iotDataManagerConfigurationBrokerForCustomAuth = AWSServiceConfiguration(region: .USEast1,
                                                                                         endpoint: AWSEndpoint(urlString: endpoint1!),
                                                                                         credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider)
            AWSIoTDataManager.register(with: iotDataManagerConfigurationBrokerForCustomAuth!,
                                       with: mqttConfig,
                                       forKey:"iot-data-manager-broker-custom-auth")
        }
        setUpIoTDataManagerWithCustomAuth()
        
        func createCertAndAttachPolicy(certName: String, iotManager:AWSIoTManager, iot:AWSIoT)
        {
            let defaults = UserDefaults.standard
            var certificateID:String? = defaults.string(forKey: certName)
            if (certificateID == nil) {
                //Certificate not found. Create one
                let csrDictionary = [ "commonName":CertificateSigningRequestCommonName,
                                      "countryName":CertificateSigningRequestCountryName,
                                      "organizationName":CertificateSigningRequestOrganizationName,
                                      "organizationalUnitName":CertificateSigningRequestOrganizationalUnitName]
                
                let dispatchGroup = DispatchGroup()
                dispatchGroup.enter()
                iotManager.createKeysAndCertificate(fromCsr: csrDictionary, callback: {  (response ) -> Void in
                    if (response != nil)
                    {
                        defaults.set(response?.certificateId, forKey:certName)
                        defaults.set(response?.certificateArn, forKey:"certificateArn")
                        certificateID = response?.certificateId
                        
                        let attachPrincipalPolicyRequest = AWSIoTAttachPrincipalPolicyRequest()
                        attachPrincipalPolicyRequest?.policyName = PolicyName
                        attachPrincipalPolicyRequest?.principal = response?.certificateArn
                        
                        // Attach the policy to the certificate
                        iot.attachPrincipalPolicy(attachPrincipalPolicyRequest!).continueWith (block: { (task) -> AnyObject? in
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
                        print("Unable to create keys and/or certificate")
                        dispatchGroup.leave()
                    }
                } )
                dispatchGroup.wait()
            }
        }
        
        let iotManagerBroker1:AWSIoTManager = AWSIoTManager(forKey: "iot-manager-broker1")
        let iotBroker1:AWSIoT = AWSIoT(forKey: "iot-broker1")
        createCertAndAttachPolicy(certName: "TestCertBroker1", iotManager: iotManagerBroker1, iot: iotBroker1)
        
        let iotManagerBroker2:AWSIoTManager = AWSIoTManager(forKey: "iot-manager-broker2")
        let iotBroker2:AWSIoT = AWSIoT(forKey: "iot-broker2")
        createCertAndAttachPolicy(certName: "TestCertBroker2", iotManager: iotManagerBroker2, iot: iotBroker2)
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
        var disconnectIssued = false
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
                if (disconnectIssued) {
                    print("Disconnected")
                    connected = false
                    hasDisconnected.fulfill()
                }
                
            case .connectionRefused:
                print("Connection Refused")
                
            case .connectionError:
                print("Connection Error")
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker")
        let uuid = UUID().uuidString
        print("Calling Connect")
        let defaults = UserDefaults.standard
        let certificateID:String? = defaults.string(forKey: "TestCertBroker1")
        
        iotDataManager.connect(withClientId: uuid,
                               cleanSession: true,
                              certificateId: certificateID!,
                             statusCallback: mqttEventCallback)
        print("Connect call completed")
        
        wait(for:[hasConnected], timeout: 30)
        XCTAssertTrue(connected, "Successfully established MQTT Connection")
        
        if (connected) {
            iotDataManager.disconnect()
            disconnectIssued = true
            wait(for:[hasDisconnected], timeout: 30)
            XCTAssertFalse(connected)
        }
        
    }
   
    func testPublishWithoutConnect() {
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker-test-without-connect")
        
        XCTAssertFalse( iotDataManager.publishString("Test", onTopic:"TestTopic", qoS:.messageDeliveryAttemptedAtLeastOnce))
        XCTAssertFalse( iotDataManager.publishString("Test", onTopic:"TestTopic", qoS:.messageDeliveryAttemptedAtLeastOnce, ackCallback: {}))
        
        XCTAssertFalse(iotDataManager.publishData("Test".data(using: .utf8)!, onTopic: "TestTopic", qoS:.messageDeliveryAttemptedAtLeastOnce))
        XCTAssertFalse(iotDataManager.publishData("Test".data(using: .utf8)!, onTopic: "TestTopic", qoS:.messageDeliveryAttemptedAtLeastOnce) {})
        
    }
    
    func testSubscribeWithoutConnect() {
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker-test-without-connect")
        
        var result = iotDataManager.subscribe(toTopic: "testTopic", qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: {
            (payload) ->Void in
            print("")
        },
        ackCallback: {
        })
        XCTAssertFalse(result)
        
        result = iotDataManager.subscribe(toTopic: "testTopic", qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: {
            (payload) ->Void in
            print("")
        })
        XCTAssertFalse(result)
    
        result = iotDataManager.subscribe(toTopic: "testTopic", qoS: .messageDeliveryAttemptedAtLeastOnce) { (object, string, data) in
        }
        XCTAssertFalse(result)
        
        result = iotDataManager.subscribe(toTopic: "testTopic", qoS: .messageDeliveryAttemptedAtLeastOnce, extendedCallback: { (obj, str, data) in
            
        }, ackCallback: {
            
        })
        XCTAssertFalse(result)
    }
    
    func testUnsubscribeWithoutConnect() {
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker-test-without-connect")
        iotDataManager.unsubscribeTopic("Topic")
    }
    
    func testDisconnectWithoutConnect() {
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker-test-without-connect")
        iotDataManager.disconnect()
    }
    
    func testDoubleConnectAndDisconnectWithCert() {
        var connected = false
        let hasConnected = self.expectation(description: "MQTT connection has been established")
        let hasDisconnected = self.expectation(description: "Disconnected")
        var disconnectIssued = false
        
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
                if (disconnectIssued) {
                    print("Disconnected")
                    connected = false
                    hasDisconnected.fulfill()
                }
            case .connectionRefused:
                print("Connection Refused")
                
            case .connectionError:
                print("Connection Error")
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker")
        let uuid = UUID().uuidString
        print("Calling Connect")
        let defaults = UserDefaults.standard
        let certificateID:String? = defaults.string(forKey: "TestCertBroker1")
        
        iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback)
        print("Connect call completed")
        
        wait(for:[hasConnected], timeout: 30)
        XCTAssertTrue(connected, "Successfully established MQTT Connection")
        
        XCTAssertFalse(iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback))
        
        if (connected) {
            iotDataManager.disconnect()
            disconnectIssued = true;
            
            //disconnecting multiple times should have no impact
            iotDataManager.disconnect()
            iotDataManager.disconnect()
            
            
            wait(for:[hasDisconnected], timeout: 30)
            XCTAssertFalse(connected)
        }
        
    }
    
    func testMultiBroker(useWebSocket: Bool, burst:Bool, totalMessages:Int, messagesPerSecond:Int) {
        
        //Variables and Expectations for Broker 1
        var messageCountBroker1 = 0
        var broker1Disconnected = false
        var broker1Connected = false
        let broker1SubConfirmed  = self.expectation(description: "Subscription to broker 1 has been established")
        let hasConnectedBroker1 = self.expectation(description: "MQTT connection has been established with Broker 1 Broker")
        let hasDisconnectedBroker1 = self.expectation(description: "Disconnected from Broker1 Broker")
        var disconnectForBroker1Issued = false
        
        //Variables and Expectations for Broker 2
        var messageCountBroker2 = 0
        var broker2Disconnected = false
        var broker2Connected = false
        let broker2SubConfirmed  = self.expectation(description: "Subscription to broker 2 has been established")
        let hasConnectedBroker2 = self.expectation(description: "MQTT connection has been established with Broker 2 Broker")
        let hasDisconnectedBroker2 = self.expectation(description: "Disconnected from Broker2 Broker")
        var disconnectForBroker2Issued = false
        
        func mqttEventCallbackBroker1( _ status: AWSIoTMQTTStatus )
        {
            print("Broker1 connection status = \(status.rawValue)")
            switch(status)
            {
            case .connecting:
                print ("Connecting...")
                
            case .connected:
                print("Connected")
                if (!broker1Connected) {
                    broker1Connected = true
                    hasConnectedBroker1.fulfill()
                }
            case .disconnected:
                print("Disconnected")
                if (disconnectForBroker1Issued) {
                    broker1Disconnected = true
                    hasDisconnectedBroker1.fulfill()
                }
            case .connectionRefused:
                print("Connection Refused")
                
            case .connectionError:
                print("Connection Error")
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        func mqttEventCallbackBroker2( _ status: AWSIoTMQTTStatus )
        {
            print("Broker 2 connection status = \(status.rawValue)")
            switch(status)
            {
            case .connecting:
                print ("Connecting...")
                
            case .connected:
                print("Connected")
                if (!broker2Connected) {
                    broker2Connected = true
                    hasConnectedBroker2.fulfill()
                }
                
            case .disconnected:
                print("Disconnected")
                if (disconnectForBroker2Issued ) {
                    broker2Disconnected = true
                    hasDisconnectedBroker2.fulfill()
                }
                
            case .connectionRefused:
                print("Connection Refused")
                
            case .connectionError:
                print("Connection Error")
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        //Connect to Broker 1
        let iotDataManagerBroker1:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker1")
        let uuidBroker1 = UUID().uuidString
        print("Calling Connect to Broker1")
        let defaults = UserDefaults.standard
        
        if (useWebSocket) {
            iotDataManagerBroker1.connectUsingWebSocket(withClientId: uuidBroker1, cleanSession: true, statusCallback: mqttEventCallbackBroker1)
             print("Connect call with Broker1 completed")
        }
        else {
            iotDataManagerBroker1.connect( withClientId: uuidBroker1, cleanSession:true, certificateId:defaults.string(forKey: "TestCertBroker1")!, statusCallback: mqttEventCallbackBroker1)
            print("Connect call with Broker1 completed")
        }
        
        wait(for:[hasConnectedBroker1], timeout: 30)
        XCTAssertTrue(broker1Connected, "Successfully established MQTT Connection with Broker1")
        if (!broker1Connected) {
            return
        }
        
        //Connect to Broker 2
        let iotDataManagerBroker2:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker2")
        let uuidBroker2 = UUID().uuidString
        print("Calling Connect to Broker 2")
        
        if (useWebSocket) {
            iotDataManagerBroker2.connectUsingWebSocket(withClientId: uuidBroker2, cleanSession: true, statusCallback: mqttEventCallbackBroker2)
            print("Connect call with Broker2 completed")
        }
        else {
            iotDataManagerBroker2.connect( withClientId: uuidBroker2, cleanSession:true,certificateId:defaults.string(forKey: "TestCertBroker2")!, statusCallback: mqttEventCallbackBroker2)
            print("Connect call with Broker2 completed")
        }
        
        wait(for:[hasConnectedBroker2], timeout: 30)
        XCTAssertTrue(broker2Connected, "Successfully established MQTT Connection with Broker 2")
        if (!broker2Connected) {
            return
        }
        
        let testMessageBroker1 = "Test Message Broker1"
        let testMessageBroker2 = "Test Message Broker2"
        let testTopic = "TestTopic"
        
        //Subscribe to TestTopic on Broker1
        iotDataManagerBroker1.subscribe(toTopic: testTopic, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: {
            (payload) ->Void in
            let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
            XCTAssertEqual(testMessageBroker1, stringValue)
            messageCountBroker1 = messageCountBroker1+1
            //print("Broker1 received: ", messageCountBroker1)
        },  ackCallback: {
            broker1SubConfirmed.fulfill()
        })
        wait(for:[broker1SubConfirmed], timeout: 30)
        
        //Subscribe to TestTopic on Broker 2
        iotDataManagerBroker2.subscribe(toTopic: testTopic, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: {
            (payload) ->Void in
            let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
            XCTAssertEqual(testMessageBroker2, stringValue)
            messageCountBroker2 = messageCountBroker2+1
            //print("Broker2 received: ", messageCountBroker2)
        },  ackCallback: {
            broker2SubConfirmed.fulfill()
        })
        wait(for:[broker2SubConfirmed], timeout: 30)
        
        //Publish to TestTopic n times each at x messages per second
        let outerLoop = (totalMessages/messagesPerSecond)
        let burstSize = 200
        var messagesToSend = totalMessages
        
        if (burst) {
            messagesToSend = totalMessages + burstSize
            for _ in 1...burstSize {
                iotDataManagerBroker1.publishString(testMessageBroker1, onTopic:testTopic, qoS:.messageDeliveryAttemptedAtLeastOnce)
                iotDataManagerBroker2.publishString(testMessageBroker2, onTopic:testTopic, qoS:.messageDeliveryAttemptedAtLeastOnce)
            }
            sleep(1)
        }
        
        if (totalMessages > 1) {
            for _ in 1...outerLoop {
                for _ in 1...messagesPerSecond {
                    iotDataManagerBroker1.publishString(testMessageBroker1, onTopic:testTopic, qoS:.messageDeliveryAttemptedAtLeastOnce)
                    iotDataManagerBroker2.publishString(testMessageBroker2, onTopic:testTopic, qoS:.messageDeliveryAttemptedAtLeastOnce)
                }
                sleep(1)
                print("Published batch of \(messagesPerSecond) to each broker")
                
                print("Received \(messageCountBroker1) so far from Broker1")
                print("Received \(messageCountBroker2) so far from Broker2")
            }
        }
        
        print("Published \(messagesToSend) Messages to each broker")
        
        if (burst) {
            print("sleeping for 90 seconds for the client retry to happen if necessary")
            sleep(90);
        }
        else {
            print("sleeping for 90 seconds for the client retry to happen if necessary")
            sleep(90)
        }
        
        print("Total message count from Broker1:", messageCountBroker1)
        print("Total message count from Broker2:", messageCountBroker2)
        
        XCTAssert(messageCountBroker1 >= (messagesToSend ), "Received \(messagesToSend) plus messages on Broker1")
        XCTAssert(messageCountBroker2 >= (messagesToSend ), "Received \(messagesToSend) plus messages on Broker2")
        
        //Disconnect
        iotDataManagerBroker1.disconnect()
        disconnectForBroker1Issued = true
        wait(for:[hasDisconnectedBroker1], timeout: 30)
        XCTAssertTrue(broker1Disconnected)
        
        
        iotDataManagerBroker2.disconnect()
        disconnectForBroker2Issued = true
        wait(for:[hasDisconnectedBroker2], timeout: 30)
        XCTAssertTrue(broker2Disconnected)
        
    }
    
    func testPubSubWithMultipleMQTTBrokersWithCert() {
        self.testMultiBroker(useWebSocket: false, burst:false, totalMessages: 1000, messagesPerSecond: 50)
    }
    
    func testPubSubWithMultipleMQTTBrokersWithWebSocket() {
        self.testMultiBroker(useWebSocket: true, burst: false, totalMessages: 1000, messagesPerSecond: 50)
    }

    func testConnectAndDisconnectWithWebSocket() {
        var connected = false
        let hasConnected = self.expectation(description: "MQTT connection has been established")
        let hasDisconnected = self.expectation(description: "Disconnected")
        var disconnectIssued = false;
        
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
                if (disconnectIssued ) {
                    print("Disconnected")
                    connected = false
                    hasDisconnected.fulfill()
                }
            case .connectionRefused:
                print("Connection Refused")
                
            case .connectionError:
                print("Connection Error")
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker")
        let uuid = UUID().uuidString
        print("Calling Connect")
        
        iotDataManager.connectUsingWebSocket(withClientId: uuid, cleanSession: true, statusCallback: mqttEventCallback)
        print("Connect call completed")
        
        wait(for:[hasConnected], timeout: 30)
        XCTAssertTrue(connected, "Successfully established MQTT Connection")
        
        if (connected) {
            iotDataManager.disconnect()
            disconnectIssued = true
            wait(for:[hasDisconnected], timeout: 30)
            XCTAssertFalse(connected)
        }
    }
    
    func testPublishSubscribeWithCert() {
        var messageCount = 0
        var connected = false
        let hasConnected = self.expectation(description: "MQTT connection has been established")
        let hasDisconnected = self.expectation(description: "Disconnected")
        let gotMessage = self.expectation(description: "Got message on subscription")
        var disconnectIssued = false
        
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
                if (disconnectIssued) {
                    print("Disconnected")
                    connected = false
                    hasDisconnected.fulfill()
                }
                
            case .connectionRefused:
                print("Connection Refused")
                
            case .connectionError:
                print("Connection Error")
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker")
        let uuid = UUID().uuidString
        print("Calling Connect")
        let defaults = UserDefaults.standard
        let certificateID:String? = defaults.string(forKey: "TestCertBroker1")
        
        iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback)
        print("Connect call completed")
        
        wait(for:[hasConnected], timeout: 30)
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
        disconnectIssued = true
        wait(for:[hasDisconnected], timeout: 30)
        XCTAssertFalse(connected)
    }
    
    func testPublishSubscribeWithCertMultipleConsecutiveConnections() {
        self.publishSubscribeMultipleConsecutiveConnections(useWebSocket: false)
    }
    
    func testPublishSubscribeWithWebSocketMultipleConsecutiveConnections() {
        self.publishSubscribeMultipleConsecutiveConnections(useWebSocket: true)
    }
    
    func publishSubscribeMultipleConsecutiveConnections(useWebSocket: Bool) {
        var messageCount = 0
        var connected = false
        let numberOfAttempts = 50
        var iteration = 0;
        let hasConnected:(NSMutableArray) = NSMutableArray()
        let hasDisconnected:(NSMutableArray) = NSMutableArray()
        let gotMessages:NSMutableArray = NSMutableArray()
        let subConfirmed:NSMutableArray = NSMutableArray()
        var disconnectIssued = false
        
        for i in 1...numberOfAttempts  {
            hasConnected.add(self.expectation(description: "MQTT connection\(i) has been established"))
            hasDisconnected.add(self.expectation(description: "Disconnected\(i)"))
            gotMessages.add(self.expectation(description: "Got message on subscription \(i)"))
            subConfirmed.add(self.expectation(description: "Subscription \(i) confirmed"))
        }
        
        func mqttEventCallback( _ status: AWSIoTMQTTStatus )
        {
            switch(status)
            {
            case .connecting:
                print ("Event Received: Connecting...")
                
            case .connected:
                print("Event Received: Connected")
                connected = true
                (hasConnected[iteration] as! XCTestExpectation).fulfill()
                
            case .disconnected:
                print("Event Received: Disconnected")
                if (disconnectIssued ) {
                    connected = false
                    (hasDisconnected[iteration]  as! XCTestExpectation).fulfill()
                }
            case .connectionRefused:
                print("Event Received: Connection Refused")
                
            case .connectionError:
                print("Event Received: Connection Error")
                
            case .protocolError:
                print("Event Received: Protocol Error")
                
            default:
                print("Event Received: Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker")
        print("Calling Connect")
        let defaults = UserDefaults.standard
        let certificateID:String? = defaults.string(forKey: "TestCertBroker1")
        
        while (iteration < numberOfAttempts ) {
            disconnectIssued = false
            messageCount = 0
            connected = false
            if (useWebSocket) {
                iotDataManager.connectUsingWebSocket(withClientId: UUID().uuidString, cleanSession: true, statusCallback: mqttEventCallback)
            }
            else {
                iotDataManager.connect( withClientId: UUID().uuidString, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback)
            }
            print("Connect call completed")
        
            wait(for:[hasConnected[iteration] as! XCTestExpectation], timeout: 90)
            if (!connected) {
                return
            }
            XCTAssertTrue(connected, "Successfully established MQTT Connection")
            
            let testMessage = "Test Message\(iteration)"
            let testTopic = "TestTopic\(iteration)"
        
            //Subscribe to TestTopic
            iotDataManager.subscribe(toTopic: testTopic, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: {
                (payload) ->Void in
                    let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
                    print("received: \(stringValue)")
                    XCTAssertEqual(testMessage, stringValue)
                    messageCount = messageCount+1
            
                    if (messageCount == 5 ) {
                        (gotMessages[iteration]  as! XCTestExpectation).fulfill()
                    }
                },
                ackCallback: {
                    (subConfirmed[iteration]  as! XCTestExpectation).fulfill()
                })
            
            wait(for: [subConfirmed[iteration] as! XCTestExpectation], timeout:90)
            //Publish to TestTopic 5 times
            for _ in 1...5 {
                iotDataManager.publishString(testMessage, onTopic:testTopic, qoS:.messageDeliveryAttemptedAtLeastOnce)
            }
        
            wait(for:[gotMessages[iteration] as! XCTestExpectation], timeout:90)
        
            //Disconnect
            iotDataManager.disconnect()
            disconnectIssued = true
            wait(for:[hasDisconnected[iteration] as! XCTestExpectation], timeout:90)
            XCTAssertFalse(connected)
            sleep(1)
            iteration = iteration + 1
        }
        
    }
  
    //These two tests  are intended to be run by starting the test and dropping the WiFi connection midway and then turning it back on.
    //Has to be done manually - the connection drop should't last longer than 1 minute ( as the test waits for no more than 2 m
    //The tests will pass even if the network is not interrupted, but that doesn't give any more information than the other tests
    // in this suite.
    
    func testPublishSubscribeWithCertMultipleConsecutiveConnectionsWithManualDisconnect() {
        self.publishSubscribeMultipleConsecutiveConnectionsWithManualDisconnect(useWebSocket: false)
    }
    
    func testPublishSubscribeWithWebSocketMultipleConsecutiveConnectionsWithManualDisconnect() {
        self.publishSubscribeMultipleConsecutiveConnectionsWithManualDisconnect(useWebSocket: true)
    }
    
    func publishSubscribeMultipleConsecutiveConnectionsWithManualDisconnect(useWebSocket: Bool) {
        var messageCount = 0
        var connected = false
        var disconnected = false
        let numberOfAttempts = 50
        var iteration = 0;
        let hasConnected:(NSMutableArray) = NSMutableArray()
        let hasDisconnected:(NSMutableArray) = NSMutableArray()
        let gotMessages:NSMutableArray = NSMutableArray()
        let subConfirmed:NSMutableArray = NSMutableArray()
        var disconnectIssued = false
        
        for i in 1...numberOfAttempts  {
            hasConnected.add(self.expectation(description: "MQTT connection\(i) has been established"))
            hasDisconnected.add(self.expectation(description: "Disconnected\(i)"))
            gotMessages.add(self.expectation(description: "Got message on subscription \(i)"))
            subConfirmed.add(self.expectation(description: "Subscription \(i) confirmed"))
        }
        
        func mqttEventCallback( _ status: AWSIoTMQTTStatus )
        {
            switch(status)
            {
            case .connecting:
                print ("Event Received: Connecting...")
                
            case .connected:
                print("Event Received: Connected")
                if ( !connected) {
                    connected = true
                    (hasConnected[iteration] as! XCTestExpectation).fulfill()
                }
                
            case .disconnected:
                 print("Event Received: Disconnected")
                if (disconnectIssued && !disconnected) {
                    connected = false
                    disconnected = true
                    (hasDisconnected[iteration]  as! XCTestExpectation).fulfill()
                }
                
            case .connectionRefused:
                print("Event Received: Connection Refused")
                
            case .connectionError:
                print("Event Received: Connection Error")
                
            case .protocolError:
                print("Event Received: Protocol Error")
                
            default:
                print("Event Received: Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker")
        print("Calling Connect")
        let defaults = UserDefaults.standard
        let certificateID:String? = defaults.string(forKey: "TestCertBroker1")
        
        while (iteration < numberOfAttempts ) {
            //Set state
            connected = false
            disconnected = false
            disconnectIssued = false

            messageCount = 0
            var subscriptionVerified = false
            connected = false
            print ("Test: Issued connect")
            if (useWebSocket) {
                iotDataManager.connectUsingWebSocket(withClientId: UUID().uuidString, cleanSession: true, statusCallback: mqttEventCallback)
            }
            else {
                iotDataManager.connect( withClientId: UUID().uuidString, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback)
            }
            
            wait(for:[hasConnected[iteration] as! XCTestExpectation], timeout: 120)
            if (!connected) {
                return
            }
            print("Test: Connected Successfully")
            XCTAssertTrue(connected, "Successfully established MQTT Connection")
            
            let testMessage = "Test Message\(iteration)"
            let testTopic = "TestTopic\(iteration)"
            
            //Subscribe to TestTopic
            iotDataManager.subscribe(toTopic: testTopic, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: {
                (payload) ->Void in
                let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
                print("received: \(stringValue)")
                XCTAssertEqual(testMessage, stringValue)
                messageCount = messageCount+1
                
                DispatchQueue.main.async {
                    if (!subscriptionVerified) {
                        subscriptionVerified = true
                        (gotMessages[iteration]  as! XCTestExpectation).fulfill()
                    }
                }
            },
             ackCallback: {
                (subConfirmed[iteration]  as! XCTestExpectation).fulfill()
            })
            
            wait(for: [subConfirmed[iteration] as! XCTestExpectation], timeout:120)
            //Publish to TestTopic 5 times
            for _ in 1...5 {
                iotDataManager.publishString(testMessage, onTopic:testTopic, qoS:.messageDeliveryAttemptedAtLeastOnce)
            }
            
            wait(for:[gotMessages[iteration] as! XCTestExpectation], timeout:120)
            
            //Disconnect
            disconnectIssued = true
            iotDataManager.disconnect()
            print("Test: Issued Disconnect")
            wait(for:[hasDisconnected[iteration] as! XCTestExpectation], timeout:120)
            XCTAssertTrue(disconnected)
            print("Test: Disconnected successfully" )
            iteration = iteration + 1
            sleep(2)
        }
        
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
        var disconnectIssued = false
        
        func mqttEventCallback( _ status: AWSIoTMQTTStatus )
        {
            switch(status)
            {
            case .connecting:
                print ("Connecting...")
                
            case .connected:
                print("Connected")
                connected = true
                hasConnected.fulfill()
                
            case .disconnected:
                if (disconnectIssued) {
                    print("Disconnected")
                    connected = false
                    hasDisconnected.fulfill()
                }
            case .connectionRefused:
                print("Connection Refused")
                
            case .connectionError:
                print("Connection Error")
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker")
        let uuid = UUID().uuidString
        print("Calling Connect")
        let defaults = UserDefaults.standard
        let certificateID:String? = defaults.string(forKey: "TestCertBroker1")
        
        iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback)
        print("Connect call completed")
        
        wait(for:[hasConnected], timeout: 30)
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
        }, ackCallback: {
            subscriptionAcknowledged.fulfill()
        })
        
        //Wait for subcriptionAcknowledgement to be received.
        wait(for: [subscriptionAcknowledged], timeout: 30)
        
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
        wait(for:[publishesAcknowledged], timeout: 30)
        
        //Wait for the messages to be received
        wait(for:[gotMessage], timeout:30)
        
        //Disconnect
        iotDataManager.disconnect()
        disconnectIssued = true
        wait(for:[hasDisconnected], timeout: 30)
        XCTAssertFalse(connected)

    }
    
    
    
    
    
    // ---------- CUSTOM AUTH TESTS ----------
    /**
     * For the following tests on `CustomAuth` to work, please setup the `Custom Authorizer` workflow
     * involving AWS IoT Core and AWS Lambda Functions in your AWS account. Once the setup is complete,
     * add the following key-value pairs in `AWSCoreTests/Resources/credentials.json` file locally.
     *
     * {
     *    "iot-custom-authorizer-name":"<my-custom-authorizer>",
     *    "iot-custom-authorizer-token-key-name":"<key-name-for-http-header>",
     *    "iot-custom-authorizer-token-value":"<token>",
     *    "iot-custom-authorizer-token-signature":"<base64-encoded-signature>"
     * }
     *
     * See: https://aws.amazon.com/blogs/security/how-to-use-your-own-identity-and-access-management-systems-to-control-access-to-aws-iot-resources/
     * for setting up the Custom Authorizer and Lambda function.
     **/
    // This test creates a WebSocket connection with Custom Auth, asserts the status is `Connected`
    // and disconnects the connection.
    func testCustomAuthConnectAndDisconnect() {
        print("testConnectAndDisconnectWithCustomAuth: Calling Connect using Custom Auth.")
        
        var connected = false
        let hasConnected = self.expectation(description: "MQTT connection has been established")
        var disconnectIssued = false
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
                if (disconnectIssued) {
                    print("Disconnected")
                    connected = false
                    hasDisconnected.fulfill()
                }
                
            case .connectionRefused:
                print("Connection Refused")
                
            case .connectionError:
                print("Connection Error")
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        // Use the MQTT broker from the `endpoint1`
        let iotDataManager: AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker-custom-auth")
        let uuid = UUID().uuidString
        
        let connectedWS: Bool = iotDataManager.connectUsingWebSocket(withClientId: uuid,
                                                                     cleanSession: true,
                                                                     customAuthorizerName: AWSIoTDataManagerTests.customAuthorizerName!,
                                                                     tokenKeyName: AWSIoTDataManagerTests.tokenKeyName!,
                                                                     tokenValue: AWSIoTDataManagerTests.tokenValue!,
                                                                     tokenSignature: AWSIoTDataManagerTests.tokenSignature!,
                                                                     statusCallback: mqttEventCallback)
        print("Calling connect completed. Waiting for 30 seconds to see if the connection is established.")
        XCTAssertTrue(connectedWS, "Successfully established MQTT Connection using Custom Auth.")
        
        wait(for:[hasConnected], timeout: 30)
        XCTAssertTrue(connected, "Successfully established MQTT Connection using Custom Auth.")
        
        if (connected) {
            iotDataManager.disconnect()
            disconnectIssued = true
            wait(for:[hasDisconnected], timeout: 30)
            XCTAssertFalse(connected)
        }
    }
    
    // This test creates a WebSocket connection with Custom Auth, but passes an invalid token,
    // asserts the status is `ConnectionError`
    func testCustomAuthConnectAndDisconnectInvalidToken() {
        print("testConnectAndDisconnectWithCustomAuth: Calling Connect using Custom Auth.")
        
        let hasConnectionError = self.expectation(description: "Connection Error")
        
        func mqttEventCallback( _ status: AWSIoTMQTTStatus )
        {
            print("connection status = \(status.rawValue)")
            switch(status)
            {
            case .connecting:
                print ("Connecting...")
                
            case .connected:
                print("Connected")

            case .disconnected:
                print("Disconnected")
                
            case .connectionRefused:
                print("Connection Refused")
                
            case .connectionError:
                print("Connection Error")
                hasConnectionError.fulfill()
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        // Use the MQTT broker from the `endpoint1`
        let iotDataManager: AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker-custom-auth")
        let uuid = UUID().uuidString
        
        let connectedWS: Bool = iotDataManager.connectUsingWebSocket(withClientId: uuid,
                                                                     cleanSession: true,
                                                                     customAuthorizerName: AWSIoTDataManagerTests.customAuthorizerName!,
                                                                     tokenKeyName: AWSIoTDataManagerTests.tokenKeyName!,
                                                                     tokenValue: "Deny",
                                                                     tokenSignature: "Deny",
                                                                     statusCallback: mqttEventCallback)
        print("Calling connect completed. Waiting for 30 seconds to see if the connection errors out.")
        
        wait(for:[hasConnectionError], timeout: 30)
        print("Expected the MQTT Connection using Custom Auth to fail due to invalid token and signature.")
        
        iotDataManager.disconnect()
    }
    
    // This test opens a WebSocket connection with CustomAuth and publishes
    // and subscribes to the topic and asserts subscribe works and disconnects.
    func testCustomAuthPublishSubscribe() {
        print("testCustomAuthPublishSubscribe: Publish and subscribe with CustomAuth.")
        var connected = false
        let hasConnected = self.expectation(description: "MQTT connection has been established")
        var disconnectIssued = false
        let hasDisconnected = self.expectation(description: "Disconnected")
        
        var messageCount = 0
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
                if (disconnectIssued) {
                    print("Disconnected")
                    connected = false
                    hasDisconnected.fulfill()
                }
                
            case .connectionRefused:
                print("Connection Refused")
                
            case .connectionError:
                print("Connection Error")
                
            case .protocolError:
                print("Protocol Error")
                
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }
        
        // Use the MQTT broker from the `endpoint1`
        let iotDataManager: AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker-custom-auth")
        let uuid = UUID().uuidString
        
        let connectedWS: Bool = iotDataManager.connectUsingWebSocket(withClientId: uuid,
                                                                     cleanSession: true,
                                                                     customAuthorizerName: AWSIoTDataManagerTests.customAuthorizerName!,
                                                                     tokenKeyName: AWSIoTDataManagerTests.tokenKeyName!,
                                                                     tokenValue: AWSIoTDataManagerTests.tokenValue!,
                                                                     tokenSignature: AWSIoTDataManagerTests.tokenSignature!,
                                                                     statusCallback: mqttEventCallback)
        print("Calling connect completed. Waiting for 30 seconds to see if the connection is established.")
        XCTAssertTrue(connectedWS, "Successfully established MQTT Connection using Custom Auth.")
        
        wait(for:[hasConnected], timeout: 30)
        XCTAssertTrue(connected, "Successfully established MQTT Connection using Custom Auth.")
        
        if (!connected) {
            print ("Connection not established.")
            return
        }
        
        let testMessage = "Test Message"
        let testTopic = "customauthtesting"
        
        //Subscribe to TestTopic
        iotDataManager.subscribe(toTopic: testTopic, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: {
            (payload) ->Void in
            let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
            print("received: \(stringValue)")
            XCTAssertEqual(testMessage, stringValue)
            messageCount = messageCount + 1
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
        disconnectIssued = true
        wait(for:[hasDisconnected], timeout: 30)
        XCTAssertFalse(connected)
    }
    
    // This test creates multiple WebSocket connections with Custom Auth, ensures the status is `Connected`
    // Publishes and subscribes to a topic. The number of connections is controlled by `numberOfAttempts`.
    func testCustomAuthPublishSubscribeMultipleConsecutiveConnections() {
        var messageCount = 0
        var connected = false
        let numberOfAttempts = 5
        var iteration = 0;
        let hasConnected:(NSMutableArray) = NSMutableArray()
        let hasDisconnected:(NSMutableArray) = NSMutableArray()
        let gotMessages:NSMutableArray = NSMutableArray()
        let subConfirmed:NSMutableArray = NSMutableArray()
        var disconnectIssued = false
        
        for i in 1...numberOfAttempts  {
            hasConnected.add(self.expectation(description: "MQTT connection\(i) has been established"))
            hasDisconnected.add(self.expectation(description: "Disconnected\(i)"))
            gotMessages.add(self.expectation(description: "Got message on subscription \(i)"))
            subConfirmed.add(self.expectation(description: "Subscription \(i) confirmed"))
        }
        
        func mqttEventCallback( _ status: AWSIoTMQTTStatus )
        {
            switch(status)
            {
            case .connecting:
                print ("Event Received: Connecting...")
                
            case .connected:
                print("Event Received: Connected")
                connected = true
                (hasConnected[iteration] as! XCTestExpectation).fulfill()
                
            case .disconnected:
                print("Event Received: Disconnected")
                if (disconnectIssued ) {
                    connected = false
                    (hasDisconnected[iteration]  as! XCTestExpectation).fulfill()
                }
            case .connectionRefused:
                print("Event Received: Connection Refused")
                
            case .connectionError:
                print("Event Received: Connection Error")
                
            case .protocolError:
                print("Event Received: Protocol Error")
                
            default:
                print("Event Received: Unknown state: \(status.rawValue)")
            }
        }
        
        let iotDataManager:AWSIoTDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker-custom-auth")
        print("Calling Connect")
        
        while (iteration < numberOfAttempts ) {
            disconnectIssued = false
            messageCount = 0
            connected = false
            let uuid = UUID().uuidString
            print("Calling Connect using Custom Auth.")
            
            let tokenValue: String? = "allow"
            let tokenSignature: String? = tokenValue?.data(using: .utf8)?.base64EncodedString()
            
            connected = iotDataManager.connectUsingWebSocket(withClientId: uuid,
                                                             cleanSession: true,
                                                             customAuthorizerName: AWSIoTDataManagerTests.customAuthorizerName!,
                                                             tokenKeyName: AWSIoTDataManagerTests.tokenKeyName!,
                                                             tokenValue: AWSIoTDataManagerTests.tokenValue!,
                                                             tokenSignature: AWSIoTDataManagerTests.tokenSignature!,
                                                             statusCallback: mqttEventCallback)
            wait(for:[hasConnected[iteration] as! XCTestExpectation], timeout: 90)
            if (!connected) {
                return
            }
            XCTAssertTrue(connected, "Successfully established MQTT Connection")
            
            let testMessage = "Test Message\(iteration)"
            let testTopic = "TestTopic\(iteration)"
            
            //Subscribe to TestTopic
            iotDataManager.subscribe(toTopic: testTopic,
                                     qoS: .messageDeliveryAttemptedAtLeastOnce,
                                     messageCallback: {
                                        (payload) ->Void in
                                        let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
                                        print("received: \(stringValue)")
                                        XCTAssertEqual(testMessage, stringValue)
                                        messageCount = messageCount+1
                                        
                                        if (messageCount == 5 ) {
                                            (gotMessages[iteration]  as! XCTestExpectation).fulfill()
                                        }
                                    },
                                    ackCallback: {
                                        (subConfirmed[iteration]  as! XCTestExpectation).fulfill()
                                    })
            wait(for: [subConfirmed[iteration] as! XCTestExpectation], timeout:90)
            
            //Publish to TestTopic 5 times
            for _ in 1...5 {
                iotDataManager.publishString(testMessage, onTopic:testTopic, qoS:.messageDeliveryAttemptedAtLeastOnce)
            }
            
            wait(for:[gotMessages[iteration] as! XCTestExpectation], timeout:90)
            
            //Disconnect
            iotDataManager.disconnect()
            disconnectIssued = true
            wait(for:[hasDisconnected[iteration] as! XCTestExpectation], timeout:90)
            XCTAssertFalse(connected)
            sleep(1)
            iteration = iteration + 1
        }
    }
}
