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
import AWSIoT

class AWSIoTDataManagerTests: XCTestCase {
    static let certificateSigningRequestCommonName = "AWS IOT Integration Test Certificate"
    static let certificateSigningRequestCountryName = "US"
    static let certificateSigningRequestOrganizationName = "Amazon.com"
    static let certificateSigningRequestOrganizationalUnitName = "Amazon Web Services"
    static let iotDataManagerBrokerCustomAuthEnhanced = "iot-data-manager-broker-custom-auth-enhanced"

    var policyName: String? = nil

    var customAuthorizerName: String? = nil
    var tokenKeyName: String? = nil
    var tokenSignature: String? = nil
    var tokenValue: String? = nil

    var customAuthorizerName_customAuthUserPass: String? = nil
    var tokenKeyName_customAuthUserPass: String? = nil
    var tokenSignature_customAuthUserPass: String? = nil
    var tokenValue_customAuthUserPass: String? = nil
    var username_customAuthUserPass: String? = nil
    var password_customAuthUserPass: String? = nil

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        //Setup Log level
        AWSDDLog.sharedInstance.logLevel = .info
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)

        //Setup creds
        AWSTestUtility.setupCognitoCredentialsProviderForDefaultRegion()
        let region = AWSTestUtility.getRegionFromTestConfiguration()

        //Create MQTT Config
        let lwt = AWSIoTMQTTLastWillAndTestament()
        lwt.topic = "will-topic";
        lwt.qos = AWSIoTMQTTQoS.messageDeliveryAttemptedAtLeastOnce

        let mqttConfig = AWSIoTMQTTConfiguration.init(keepAliveTimeInterval: 30.0,
                                                      baseReconnectTimeInterval: 1.0,
                                                      minimumConnectionTimeInterval: 20,
                                                      maximumReconnectTimeInterval: 8,
                                                      runLoop: RunLoop.current,
                                                      runLoopMode: RunLoop.Mode.default.rawValue,
                                                      autoResubscribe: true,
                                                      lastWillAndTestament: lwt)

        //Setup iOT Manager for Broker 1
        let iotConfigurationBroker1 = AWSServiceConfiguration(
            region: region ,
            credentialsProvider:AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider
        )
        AWSServiceManager.default().defaultServiceConfiguration = iotConfigurationBroker1
        AWSIoTManager.register(with: iotConfigurationBroker1!, forKey: "iot-manager-broker1")
        AWSIoT.register(with: iotConfigurationBroker1!, forKey: "iot-broker1")

        //Setup iOT Manager for Broker 2
        let iotConfigurationBroker2 = AWSServiceConfiguration(
            region: region,
            credentialsProvider:AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider
        )
        AWSIoTManager.register(with: iotConfigurationBroker2!, forKey: "iot-manager-broker2")
        AWSIoT.register(with: iotConfigurationBroker2!, forKey: "iot-broker2")

        //Setup iOT Data Manager for Broker 1
        guard let endpoint1 = AWSTestUtility.getIoTEndPoint("iot_endpoint_address") else {
            XCTFail("Could not fetch the iot endpoint from the config file.")
            return
        }
        let iotDataManagerConfigurationBroker1 = AWSServiceConfiguration(
            region: region,
            endpoint: AWSEndpoint(urlString: endpoint1),
            credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider
        )
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker1!,
                                   with: mqttConfig,
                                   forKey:"iot-data-manager-broker1")
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker1!,
                                   with: mqttConfig,
                                   forKey:"iot-data-manager-broker")
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker1!,
                                   with: mqttConfig,
                                   forKey:"iot-data-manager-broker-test-subscribe-without-connect")
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker1!,
                                   with: mqttConfig,
                                   forKey:"iot-data-manager-broker-test-without-connect")

        //Setup iOT Data Manager for Broker 2
        guard let endpoint2 = AWSTestUtility.getIoTEndPoint("iot_endpoint_address") else {
            XCTFail("Could not fetch the iot endpoint from the config file.")
            return
        }
        let iotDataManagerConfigurationBroker2 = AWSServiceConfiguration(
            region: region,
            endpoint: AWSEndpoint(urlString: endpoint2),
            credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider
        )
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker2!,
                                   with: mqttConfig,
                                   forKey:"iot-data-manager-broker2")

        setUpCustomValues()

        //Setup iOT Data Manager for Custom Auth using endpoint-1
        if customAuthorizerName != nil {
            let iotDataManagerConfigurationBrokerForCustomAuth = AWSServiceConfiguration(
                region: region,
                endpoint: AWSEndpoint(urlString: endpoint1),
                credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider
            )
            AWSIoTDataManager.register(with: iotDataManagerConfigurationBrokerForCustomAuth!,
                                       with: mqttConfig,
                                       forKey:"iot-data-manager-broker-custom-auth")
        }

        let iotManagerBroker1:AWSIoTManager = AWSIoTManager(forKey: "iot-manager-broker1")
        let iotBroker1:AWSIoT = AWSIoT(forKey: "iot-broker1")
        let broker1CertIsSuccessful = createCertAndAttachPolicy(certName: "TestCertBroker1",
                                                                iotManager: iotManagerBroker1,
                                                                iot: iotBroker1)

        let iotManagerBroker2:AWSIoTManager = AWSIoTManager(forKey: "iot-manager-broker2")
        let iotBroker2:AWSIoT = AWSIoT(forKey: "iot-broker2")
        let broker2CertIsSuccessful = createCertAndAttachPolicy(certName: "TestCertBroker2",
                                                                iotManager: iotManagerBroker2,
                                                                iot: iotBroker2)
        setupCustomAuthBroker(region: region)

        let classSetUpSuccessful = broker1CertIsSuccessful && broker2CertIsSuccessful
        guard classSetUpSuccessful else {
            XCTFail("setUp was unsuccessful. See console log for details")
            return
        }
    }

    func setupCustomAuthBroker(region: AWSRegionType) {
        guard let endpoint = AWSTestUtility.getIoTEndPoint("iot_beta_endpoint_address") else {
            XCTFail("Could not fetch 'iot_beta_endpoint_address' from the config file.")
            return
        }
        let iotConfigurationBroker = AWSServiceConfiguration(
            region: region,
            endpoint: AWSEndpoint(urlString: endpoint),
            credentialsProvider: AWSServiceManager.default()?.defaultServiceConfiguration.credentialsProvider
        )
        guard let iotConfiguration = iotConfigurationBroker else {
            XCTFail("Failed on creating IoTConfigurationBroker")
            return
        }
        
        let mqttConfigUserNamePassword = AWSIoTMQTTConfiguration()
        mqttConfigUserNamePassword.username = username_customAuthUserPass!
        mqttConfigUserNamePassword.password = password_customAuthUserPass!
        
        AWSIoTDataManager.register(with: iotConfiguration,
                                   with: mqttConfigUserNamePassword,
                                   forKey: AWSIoTDataManagerTests.iotDataManagerBrokerCustomAuthEnhanced)
    }

    func setUpCustomValues() {
        guard let packageConfig = AWSTestUtility.getIntegrationTestConfiguration(forPackageId: "iot") as? [String: String] else {
            return
        }
        policyName = packageConfig["policy_name"]
        customAuthorizerName = packageConfig["custom_authorizer_name"]
        tokenKeyName = packageConfig["custom_authorizer_token_key_name"]
        tokenSignature = packageConfig["custom_authorizer_token_signature"]
        tokenValue = packageConfig["custom_authorizer_token_value"]
        
        customAuthorizerName_customAuthUserPass = packageConfig["custom_authorizer_user_pass_name"]
        tokenKeyName_customAuthUserPass = packageConfig["custom_authorizer_user_pass_token_key_name"]
        tokenSignature_customAuthUserPass = packageConfig["custom_authorizer_user_pass_token_signature"]
        tokenValue_customAuthUserPass = packageConfig["custom_authorizer_user_pass_token_value"]

        username_customAuthUserPass = packageConfig["custom_authorizer_user_pass_username"]
        password_customAuthUserPass = packageConfig["custom_authorizer_user_pass_password"]
    }

    override func tearDown() {
        super.tearDown()
    }

    func testConnectAndDisconnectWithCert() {
        connectAndDisconnectWithCert(useALPN: false)
    }

    func testConnectAndDisconnectWithCertUsingALPN() {
        if #available(iOS 11, *) {
            connectAndDisconnectWithCert(useALPN: true)
        }
    }

    func connectAndDisconnectWithCert(useALPN: Bool) {
//        var success: Bool = false
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
        let userMetaData: [String: String] = ["Key1": "value1", "key2": "value2", "key3":"value3"]
        iotDataManager.updateUserMetaData(userMetaData)

        let uuid = UUID().uuidString
        print("Calling Connect")
        let defaults = UserDefaults.standard
        let certificateID:String? = defaults.string(forKey: "TestCertBroker1")

        if (useALPN) {
            if #available(iOS 11, *) {
                iotDataManager.connectUsingALPN(withClientId: uuid,
                                                cleanSession: true,
                                                certificateId: certificateID!,
                                                statusCallback: mqttEventCallback)
            }
        } else {
            iotDataManager.connect(withClientId: uuid,
                                   cleanSession: true,
                                   certificateId: certificateID!,
                                   statusCallback: mqttEventCallback)
        }

        wait(for:[hasConnected], timeout: 5)
        XCTAssertTrue(connected, "Successfully established MQTT Connection")

        if (connected) {
            iotDataManager.disconnect()
            disconnectIssued = true
            wait(for:[hasDisconnected], timeout: 5)
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
        doubleConnectAndDisconnectWithCert(useALPN: false)
    }

    func testDoubleConnectAndDisconnectWithCertUsingAPLN() {
        if #available(iOS 11, *) {
            doubleConnectAndDisconnectWithCert(useALPN: true)
        }
    }

    func doubleConnectAndDisconnectWithCert(useALPN:Bool) {
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


        if (useALPN ) {
            if #available(iOS 11, *) {
                iotDataManager.connectUsingALPN(withClientId: uuid,
                                                cleanSession: true,
                                                certificateId: certificateID!,
                                                statusCallback: mqttEventCallback)
            }
        }
        else {
            iotDataManager.connect(withClientId: uuid,
                                   cleanSession: true,
                                   certificateId: certificateID!,
                                   statusCallback: mqttEventCallback)
        }

        iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback)
        print("Connect call completed")

        wait(for:[hasConnected], timeout: 5)
        XCTAssertTrue(connected, "Successfully established MQTT Connection")

        XCTAssertFalse(iotDataManager.connect( withClientId: uuid, cleanSession:true, certificateId:certificateID!, statusCallback: mqttEventCallback))

        if (connected) {
            iotDataManager.disconnect()
            disconnectIssued = true;

            //disconnecting multiple times should have no impact
            iotDataManager.disconnect()
            iotDataManager.disconnect()


            wait(for:[hasDisconnected], timeout: 5)
            XCTAssertFalse(connected)
        }

    }

    func testMultiBroker(useWebSocket: Bool, burst: Bool, totalMessages: Int, messagesPerSecond: Int) {

        //Variables and Expectations for Broker 1
        var messageCountBroker1 = Counter()
        var broker1Disconnected = false
        var broker1Connected = false
        let broker1SubConfirmed  = self.expectation(description: "Subscription to broker 1 has been established")
        let hasConnectedBroker1 = self.expectation(description: "MQTT connection has been established with Broker 1 Broker")
        let hasDisconnectedBroker1 = self.expectation(description: "Disconnected from Broker1 Broker")
        var disconnectForBroker1Issued = false

        //Variables and Expectations for Broker 2
        var messageCountBroker2 = Counter()
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
        let testTopicBroker1 = "TestTopicBroker1"
        let testTopicBroker2 = "TestTopicBroker2"

        //Subscribe to TestTopic on Broker1
        iotDataManagerBroker1.subscribe(toTopic: testTopicBroker1, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: {
            (payload) ->Void in
            let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
            XCTAssertEqual(testMessageBroker1, stringValue)
            messageCountBroker1.increment()
            print("Broker1 received: ", messageCountBroker1)
        },  ackCallback: {
            broker1SubConfirmed.fulfill()
        })
        wait(for:[broker1SubConfirmed], timeout: 30)

        //Subscribe to TestTopic on Broker 2
        iotDataManagerBroker2.subscribe(toTopic: testTopicBroker2, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: {
            (payload) ->Void in
            let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
            XCTAssertEqual(testMessageBroker2, stringValue)
            messageCountBroker2.increment()
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
                iotDataManagerBroker1.publishString(testMessageBroker1, onTopic:testTopicBroker1, qoS:.messageDeliveryAttemptedAtLeastOnce)
                iotDataManagerBroker2.publishString(testMessageBroker2, onTopic:testTopicBroker2, qoS:.messageDeliveryAttemptedAtLeastOnce)
            }
            sleep(1)
        }

        if (totalMessages > 1) {
            for _ in 1...outerLoop {
                for _ in 1...messagesPerSecond {
                    iotDataManagerBroker1.publishString(testMessageBroker1, onTopic:testTopicBroker1, qoS:.messageDeliveryAttemptedAtLeastOnce)
                    iotDataManagerBroker2.publishString(testMessageBroker2, onTopic:testTopicBroker2, qoS:.messageDeliveryAttemptedAtLeastOnce)
                }
                sleep(1)
                print("Published batch of \(messagesPerSecond) to each broker")

                print("Received \(messageCountBroker1.count) so far from Broker1")
                print("Received \(messageCountBroker2.count) so far from Broker2")
            }
        }

        print("Published \(messagesToSend) Messages to each broker")

        print("sleeping for 30 seconds for the client retry to happen if necessary")
        sleep(30)

        print("Total message count from Broker1:", messageCountBroker1.count)
        print("Total message count from Broker2:", messageCountBroker2.count)

        XCTAssertGreaterThanOrEqual(messageCountBroker1.count, messagesToSend, "Received \(messagesToSend) plus messages on Broker1")
        // allows for some leeway since some messages could be delayed
        XCTAssertGreaterThanOrEqual(messageCountBroker2.count, messagesToSend - 3, "Received \(messagesToSend) plus messages on Broker2")

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

        let userMetaData: [String: String] = ["Key1": "value1", "key2": "value2", "key3":"value3"]
        iotDataManager.updateUserMetaData(userMetaData)
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
        publishSubscribeWithCert(useALPN: false)
    }

    func testPublishSubscribeWithCertUsingALPN() {
        if #available(iOS 11, *) {
            publishSubscribeWithCert(useALPN: true)
        }
    }

    func publishSubscribeWithCert(useALPN:Bool) {
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

        if (useALPN ) {
            if #available(iOS 11, *) {
                iotDataManager.connectUsingALPN(withClientId: uuid,
                                                cleanSession: true,
                                                certificateId: certificateID!,
                                                statusCallback: mqttEventCallback)
            }
        }
        else {
            iotDataManager.connect(withClientId: uuid,
                                   cleanSession: true,
                                   certificateId: certificateID!,
                                   statusCallback: mqttEventCallback)
        }
        print("Connect call completed")

        wait(for:[hasConnected], timeout: 30)
        XCTAssertTrue(connected, "Successfully established MQTT Connection")
        if (!connected) {
            return
        }

        let testMessage = "Test Message"
        let testTopic = "TestTopic"
        gotMessage.expectedFulfillmentCount = 5
        gotMessage.assertForOverFulfill = false
        let subAckExpectation = self.expectation(description: "Subscription should be acknowledged")
        let ackCallback: AWSIoTMQTTAckBlock = {
            subAckExpectation.fulfill()
        }

        //Subscribe to TestTopic
        let subStatus = iotDataManager.subscribe(toTopic: testTopic,
                                                 qoS: .messageDeliveryAttemptedAtLeastOnce,
                                                 messageCallback: {
                                                    (payload) ->Void in
                                                    let stringValue:String = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
                                                    print("received: \(stringValue)")
                                                    XCTAssertEqual(testMessage, stringValue)
                                                    gotMessage.fulfill()
        },
                                                 ackCallback: ackCallback)
        XCTAssertTrue(subStatus, "Subscription should be successful. Connection Status - \(iotDataManager.getConnectionStatus().rawValue)")
        wait(for:[subAckExpectation], timeout:10)

        //Publish to TestTopic 5 times
        for _ in 1...gotMessage.expectedFulfillmentCount {
            let publishStatus = iotDataManager.publishString(testMessage,
                                                             onTopic:testTopic,
                                                             qoS:.messageDeliveryAttemptedAtLeastOnce,
                                                             ackCallback: {
                                                                print("Message published in topic \(testTopic))")
            })
            XCTAssertTrue(publishStatus, "Publish should be successful. Connection Status - \(iotDataManager.getConnectionStatus().rawValue)")
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
            let expectation = self.expectation(description: "Got message on subscription \(i)")
            expectation.assertForOverFulfill = false
            gotMessages.add(expectation)
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
            let expectation = self.expectation(description: "Got message on subscription \(i)")
            expectation.assertForOverFulfill = false
            gotMessages.add(expectation)
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

        guard let certificateID = UserDefaults.standard.string(forKey: "TestCertBroker1") else {
            XCTFail("Unable to retrieve certificateID from UserDefaults")
            return
        }

        iotDataManager.connect(withClientId: uuid,
                               cleanSession: true,
                               certificateId: certificateID,
                               statusCallback: mqttEventCallback)

        print("Connect call completed")

        wait(for: [hasConnected], timeout: 30)

        XCTAssertTrue(connected, "Successfully established MQTT Connection")
        guard connected else {
            return
        }

        let testMessage = "Test Message"
        let testTopic = "TestTopic"

        //Subscribe to TestTopic
        let messageCallback: AWSIoTMQTTNewMessageBlock = { payload in
            let stringValue = NSString(data: payload, encoding: String.Encoding.utf8.rawValue)! as String
            print("received: \(stringValue)")
            XCTAssertEqual(testMessage, stringValue)
            gotMessage.fulfill()
        }

        let ackCallback: AWSIoTMQTTAckBlock = {
            subscriptionAcknowledged.fulfill()
        }

        iotDataManager.subscribe(toTopic: testTopic,
                                 qoS: .messageDeliveryAttemptedAtLeastOnce,
                                 messageCallback: messageCallback,
                                 ackCallback: ackCallback)

        // Wait for subcriptionAcknowledgement to be received.
        wait(for: [subscriptionAcknowledged], timeout: 30)

        // Publish to TestTopic 5 times
        let pubAckCallback: AWSIoTMQTTAckBlock = {
            publishesAcknowledged.fulfill()
        }

        publishesAcknowledged.expectedFulfillmentCount = 5
        gotMessage.expectedFulfillmentCount = 5
        for _ in 1...publishesAcknowledged.expectedFulfillmentCount {
            iotDataManager.publishString(testMessage,
                                         onTopic: testTopic,
                                         qoS: .messageDeliveryAttemptedAtLeastOnce,
                                         ackCallback: pubAckCallback)
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

    // MARK: - Custom Auth Tests

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
                                                                     customAuthorizerName: customAuthorizerName!,
                                                                     tokenKeyName: tokenKeyName!,
                                                                     tokenValue: tokenValue!,
                                                                     tokenSignature: tokenSignature!,
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

    func testCustomAuthUserNamePasswordConnectAndDisconnect() {
        var connected = false
        let hasConnected = self.expectation(description: "MQTT connection has been established")
        var disconnectIssued = false
        let hasDisconnected = self.expectation(description: "Disconnected")

        func mqttEventCallback( _ status: AWSIoTMQTTStatus){
            switch(status) {
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

        let iotDataManager = AWSIoTDataManager(forKey: AWSIoTDataManagerTests.iotDataManagerBrokerCustomAuthEnhanced)
        let uuid = UUID().uuidString
        let connectedWS: Bool = iotDataManager.connectUsingWebSocket(withClientId: uuid,
                                                                     cleanSession: true,
                                                                     customAuthorizerName: customAuthorizerName_customAuthUserPass!,
                                                                     tokenKeyName: tokenKeyName_customAuthUserPass!,
                                                                     tokenValue: tokenValue_customAuthUserPass!,
                                                                     tokenSignature: tokenSignature_customAuthUserPass!,
                                                                     statusCallback: mqttEventCallback)
        XCTAssertTrue(connectedWS, "Successfully established MQTT Connection using Custom Auth.")
        
        wait(for:[hasConnected], timeout: 5)
        XCTAssertTrue(connected, "Successfully established MQTT Connection using Custom Auth.")

        iotDataManager.disconnect()
        disconnectIssued = true
        wait(for:[hasDisconnected], timeout: 5)
        XCTAssertFalse(connected)
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
        let iotDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker-custom-auth")
        let uuid = UUID().uuidString

        let connectedWS = iotDataManager.connectUsingWebSocket(withClientId: uuid,
                                                               cleanSession: true,
                                                               customAuthorizerName: customAuthorizerName!,
                                                               tokenKeyName: tokenKeyName!,
                                                               tokenValue: "allow",
                                                               tokenSignature: "INVALID_SIGNATURE",
                                                               statusCallback: mqttEventCallback)

        XCTAssert(connectedWS)
        print("Calling connect completed. Waiting for 30 seconds to see if the connection errors out.")

        wait(for:[hasConnectionError], timeout: 30)
        print("Expected the MQTT Connection using Custom Auth to fail due to invalid token and signature.")

        iotDataManager.disconnect()
    }

    // This test opens a WebSocket connection with CustomAuth and publishes
    // and subscribes to the topic and asserts subscribe works and disconnects.
    func testCustomAuthPublishSubscribe() {
        print("testCustomAuthPublishSubscribe: Publish and subscribe with CustomAuth.")
        continueAfterFailure = false

        let hasConnected = expectation(description: "MQTT connection has been established")

        // We expect a disconnect message only after we explicitly invoke `disconnect`
        var isDisconnectExpected = false
        let disconnectedAtExpectedTime = expectation(description: "MQTT connection disconnected at expected time")
        let disconnectedUnexpectedly = expectation(description: "MQTT connection was unexpectedly disconnected")
        disconnectedUnexpectedly.isInverted = true

        // We expect the "message received" callback to be invoked at least 5 times, but
        // we won't fail for receiving it more, since we're specifying "at least once" QOS
        let gotMessage = expectation(description: "Got message on subscription")
        gotMessage.expectedFulfillmentCount = 5
        gotMessage.assertForOverFulfill = false

        func mqttEventCallback( _ status: AWSIoTMQTTStatus ) {
            print("connection status = \(status.rawValue)")
            switch status {
            case .connecting:
                print ("Connecting...")

            case .connected:
                print("Connected")
                hasConnected.fulfill()

            case .disconnected:
                print("Disconnected")
                if isDisconnectExpected {
                    disconnectedAtExpectedTime.fulfill()
                } else {
                    disconnectedUnexpectedly.fulfill()
                }

            case .connectionRefused:
                XCTFail("Unexpected status: connectionRefused")
            case .connectionError:
                XCTFail("Unexpected status: connectionError")
            case .protocolError:
                XCTFail("Unexpected status: protocolError")
            default:
                print("Unknown state: \(status.rawValue)")
            }
        }

        // Use the MQTT broker from the `endpoint1`
        let iotDataManager = AWSIoTDataManager(forKey: "iot-data-manager-broker-custom-auth")
        let uuid = UUID().uuidString

        let isWebSocketConnected = iotDataManager.connectUsingWebSocket(withClientId: uuid,
                                                                        cleanSession: true,
                                                                        customAuthorizerName: customAuthorizerName!,
                                                                        tokenKeyName: tokenKeyName!,
                                                                        tokenValue: tokenValue!,
                                                                        tokenSignature: tokenSignature!,
                                                                        statusCallback: mqttEventCallback)

        XCTAssertTrue(isWebSocketConnected, "Successfully established MQTT Connection using Custom Auth.")

        wait(for: [hasConnected], timeout: 30)

        let testMessage = "Test Message"
        let testTopic = "customauthtesting"

        //Subscribe to TestTopic
        let messageCallback: AWSIoTMQTTNewMessageBlock = { payload in
            let payloadString = String(data: payload, encoding: .utf8)!
            print("received payload: \(payloadString)")
            XCTAssertEqual(testMessage, payloadString)
            gotMessage.fulfill()
        }
        iotDataManager.subscribe(toTopic: testTopic, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: messageCallback)

        // Wait a moment to let the subscription be established
        sleep(2)

        // Publish to TestTopic 5 times
        for _ in 1 ... gotMessage.expectedFulfillmentCount {
            iotDataManager.publishString(testMessage, onTopic:testTopic, qoS:.messageDeliveryAttemptedAtLeastOnce)
        }

        wait(for: [gotMessage], timeout:30)

        // Disconnect
        isDisconnectExpected = true
        iotDataManager.disconnect()
        wait(for: [disconnectedAtExpectedTime], timeout: 30)

        // Ensure we never got an unexpected disconnect. Don't include this in the main
        // flow of the test, since we don't want to wait 30 seconds to assert that we
        // *didn't* receive a disconnect message
        wait(for: [disconnectedUnexpectedly], timeout: 0.01)
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
            let expectation = self.expectation(description: "Got message on subscription \(i)")
            expectation.assertForOverFulfill = false
            gotMessages.add(expectation)
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

            connected = iotDataManager.connectUsingWebSocket(withClientId: uuid,
                                                             cleanSession: true,
                                                             customAuthorizerName: customAuthorizerName!,
                                                             tokenKeyName: tokenKeyName!,
                                                             tokenValue: tokenValue!,
                                                             tokenSignature: tokenSignature!,
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

    // MARK: - Utilities

    func createCertAndAttachPolicy(certName: String, iotManager:AWSIoTManager, iot:AWSIoT) -> Bool {
        let defaults = UserDefaults.standard
        var certificateID = defaults.string(forKey: certName)

        if let certificateID = certificateID {
            print("Found certificate ID \(certificateID) in keychain")
            return true
        }

        let csrDictionary = ["commonName": AWSIoTDataManagerTests.certificateSigningRequestCommonName,
                             "countryName": AWSIoTDataManagerTests.certificateSigningRequestCountryName,
                             "organizationName": AWSIoTDataManagerTests.certificateSigningRequestOrganizationName,
                             "organizationalUnitName": AWSIoTDataManagerTests.certificateSigningRequestOrganizationalUnitName]

        var certCreated = false
        var policyAttached = false

        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()

        iotManager.createKeysAndCertificate(fromCsr: csrDictionary) { response in
            defer {
                dispatchGroup.leave()
            }

            guard let response = response else {
                print("Response unexpectedly nil creating keys and/or certificate")
                return
            }

            defaults.set(response.certificateId, forKey: certName)
            defaults.set(response.certificateArn, forKey: "certificateArn")
            certificateID = response.certificateId
            certCreated = true

            // Attach the policy to the certificate
            guard let attachPrincipalPolicyRequest = AWSIoTAttachPrincipalPolicyRequest() else {
                print("attachPrincipalPolicyRequest unexpectedly nil")
                return
            }
            attachPrincipalPolicyRequest.policyName = self.policyName
            attachPrincipalPolicyRequest.principal = response.certificateArn

            dispatchGroup.enter()
            iot.attachPrincipalPolicy(attachPrincipalPolicyRequest).continueWith { task -> AnyObject? in
                defer {
                    dispatchGroup.leave()
                }

                if let error = task.error {
                    print("failed: [\(error)]")
                    return nil
                }

                // task.result will be nil or empty on successful execution
                print("result: [\(String(describing: task.result))]")

                policyAttached = true
                return nil
            }
        }

        dispatchGroup.wait()

        if let certificateID = certificateID {
            print("Created certificateID \(certificateID) in keychain")
        } else {
            print("Unable to create certificate in keychain")
        }

        if policyAttached {
            print("Attached policy to certificate")
        } else {
            print("Unable to attach policy to certificate")
        }

        return certCreated && policyAttached
    }

}

fileprivate class Counter {
    private let queue = DispatchQueue(label: "atomic-counter")
    private (set) var count: Int = 0

    public func increment() {
        queue.sync {
            self.count += 1
        }
    }

    public func decrement() {
        queue.sync {
            self.count -= 1
        }
    }

}
