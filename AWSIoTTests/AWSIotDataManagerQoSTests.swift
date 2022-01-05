//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

class AWSIoTDataManagerQoSTests: XCTestCase {
    let defaultTimeout: Double = 3.0

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        AWSDDLog.sharedInstance.logLevel = .info
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        
        AWSTestUtility.setupCognitoCredentialsProviderForDefaultRegion()
        let region = AWSTestUtility.getRegionFromTestConfiguration()
        
        let mqttConfig1 = AWSIoTMQTTConfiguration(keepAliveTimeInterval: 30.0,
                                                  baseReconnectTimeInterval: 1.0,
                                                  minimumConnectionTimeInterval: 20,
                                                  maximumReconnectTimeInterval: 8,
                                                  runLoop: RunLoop.current,
                                                  runLoopMode: RunLoop.Mode.default.rawValue,
                                                  autoResubscribe: true,
                                                  lastWillAndTestament: AWSIoTMQTTLastWillAndTestament())
        
        let mqttConfig2 = AWSIoTMQTTConfiguration(keepAliveTimeInterval: 30.0,
                                                  baseReconnectTimeInterval: 1.0,
                                                  minimumConnectionTimeInterval: 20,
                                                  maximumReconnectTimeInterval: 8,
                                                  runLoop: RunLoop.current,
                                                  runLoopMode: RunLoop.Mode.default.rawValue,
                                                  autoResubscribe: true,
                                                  lastWillAndTestament: AWSIoTMQTTLastWillAndTestament())
        
        setupIoTDataManager(region: region, mqttConfig: mqttConfig1, key: "iot-data-manager-broker1")
        setupIoTDataManager(region: region, mqttConfig: mqttConfig2, key: "iot-data-manager-broker2")
    }
    
    func setupIoTDataManager(region: AWSRegionType, mqttConfig: AWSIoTMQTTConfiguration, key: String) {
        guard let endpoint = AWSTestUtility.getIoTEndPoint("iot_endpoint_address") else {
            XCTFail("Could not fetch the iot endpoint from the config file.")
            return
        }
        guard let iotDataManagerConfigurationBroker = AWSServiceConfiguration(
            region: region,
            endpoint: AWSEndpoint(urlString: endpoint),
            credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider) else {
                XCTFail("Failed to create configuration broker")
                return
        }
        AWSIoTDataManager.register(with:iotDataManagerConfigurationBroker,
                                   with: mqttConfig,
                                   forKey: key)
    }

    #if MQTT_QOS2_ENABLED
    func testSubscribeQos2_SendQoS2Message() {
        let topicName = "SubscribeQoS2_SendQoS2"
        let messageToSend = "This is a message we send once and only once"
        let messageToSendData = messageToSend.data(using: .utf8)!

        // Broker 1:
        // * Connect
        // * Subscribes to topic
        let hasConnectedBroker1 = expectation(description: "Connect, Broker 1")
        let hasDisconnectedBroker1 = expectation(description: "Disconnect, Broker 1")
        let iotDataManagerBroker1 = AWSIoTDataManager(forKey: "iot-data-manager-broker1")
        let callbackWrapper1 = MQTTStatusCallBackWrapper(
            onConnected: {
                hasConnectedBroker1.fulfill()
        }, onDisconnected: {
            hasDisconnectedBroker1.fulfill()
        })
        
        iotDataManagerBroker1.connectUsingWebSocket(withClientId: UUID().uuidString, cleanSession: true, statusCallback: callbackWrapper1.mqttStatusCallback(_:))
        wait(for: [hasConnectedBroker1], timeout: defaultTimeout)
        
        let broker1ReceivedData = expectation(description: "Should get retained message")
        let messageCallback: AWSIoTMQTTNewMessageBlock = { data in
            XCTAssertEqual(data.toUTF8String(), "This is a message we send once and only once")
            broker1ReceivedData.fulfill()
        }
        iotDataManagerBroker1.subscribe(toTopic: topicName, qoS: .messageDeliveryAttemptedExactlyOnce, messageCallback: messageCallback)

        // Broker 2:
        // * Connects
        // * Sends QoS2 message to the topic that was subscribed (and wait to make sure Broker1 gets it)
        let hasConnectedBroker2 = expectation(description: "Connect, Broker 2")
        let hasDisconnectedBroker2 = expectation(description: "Disconnect, Broker 2")
        let iotDataManagerBroker2 = AWSIoTDataManager(forKey: "iot-data-manager-broker2")
        let callbackWrapper2 = MQTTStatusCallBackWrapper(
            onConnected: {
                hasConnectedBroker2.fulfill()
        }, onDisconnected: {
            hasDisconnectedBroker2.fulfill()
        })
        iotDataManagerBroker2.connectUsingWebSocket(withClientId: UUID().uuidString, cleanSession: true, statusCallback: callbackWrapper2.mqttStatusCallback(_:))
        wait(for: [hasConnectedBroker2], timeout: defaultTimeout)
        
        let qos2AckFinished = expectation(description: "ACK of message being sent")
        iotDataManagerBroker2.publishData(messageToSendData, onTopic: topicName, qoS: .messageDeliveryAttemptedExactlyOnce) {
            qos2AckFinished.fulfill()
        }
        wait(for: [qos2AckFinished, broker1ReceivedData], timeout: defaultTimeout)
        
        // Broker 1 & Broker 2
        // * Gracefully disconnect
        iotDataManagerBroker1.disconnect()
        iotDataManagerBroker2.disconnect()
        wait(for: [hasDisconnectedBroker1, hasDisconnectedBroker2], timeout: defaultTimeout)
    }

    func testSubscribeQos1_SendQoS2Message() {
        let topicName = "SubscribeQoS1_SendQoS2"
        let messageToSend = "This is a message, sent once"
        let messageToSendData = messageToSend.data(using: .utf8)!

        // Broker 1:
        // * Connect
        // * Subscribes to topic
        let hasConnectedBroker1 = expectation(description: "Connect, Broker 1")
        let hasDisconnectedBroker1 = expectation(description: "Disconnect, Broker 1")
        let iotDataManagerBroker1 = AWSIoTDataManager(forKey: "iot-data-manager-broker1")
        let callbackWrapper1 = MQTTStatusCallBackWrapper(
            onConnected: {
                hasConnectedBroker1.fulfill()
        }, onDisconnected: {
            hasDisconnectedBroker1.fulfill()
        })
        
        iotDataManagerBroker1.connectUsingWebSocket(withClientId: UUID().uuidString, cleanSession: true, statusCallback: callbackWrapper1.mqttStatusCallback(_:))
        wait(for: [hasConnectedBroker1], timeout: defaultTimeout)
        
        let broker1ReceivedData = expectation(description: "Should get retained message")
        let messageCallback: AWSIoTMQTTNewMessageBlock = { data in
            XCTAssertEqual(data.toUTF8String(), "This is a message, sent once")
            broker1ReceivedData.fulfill()
        }
        iotDataManagerBroker1.subscribe(toTopic: topicName, qoS: .messageDeliveryAttemptedAtLeastOnce, messageCallback: messageCallback)
        
        // Broker 2:
        // * Connects
        // * Sends QoS2 message to the topic that was subscribed (and wait to make sure Broker1 gets it)
        let hasConnectedBroker2 = expectation(description: "Connect, Broker 2")
        let hasDisconnectedBroker2 = expectation(description: "Disconnect, Broker 2")
        let iotDataManagerBroker2 = AWSIoTDataManager(forKey: "iot-data-manager-broker2")
        let callbackWrapper2 = MQTTStatusCallBackWrapper(
            onConnected: {
                hasConnectedBroker2.fulfill()
        }, onDisconnected: {
            hasDisconnectedBroker2.fulfill()
        })
        iotDataManagerBroker2.connectUsingWebSocket(withClientId: UUID().uuidString, cleanSession: true, statusCallback: callbackWrapper2.mqttStatusCallback(_:))
        wait(for: [hasConnectedBroker2], timeout: defaultTimeout)
        
        let qos2AckFinished = expectation(description: "ACK of message being sent")
        iotDataManagerBroker2.publishData(messageToSendData, onTopic: topicName, qoS: .messageDeliveryAttemptedExactlyOnce) {
            qos2AckFinished.fulfill()
        }
        wait(for: [qos2AckFinished, broker1ReceivedData], timeout: defaultTimeout)
        
        // Broker 1 & Broker 2
        // * Gracefully disconnect
        iotDataManagerBroker1.disconnect()
        iotDataManagerBroker2.disconnect()
        wait(for: [hasDisconnectedBroker1, hasDisconnectedBroker2], timeout: defaultTimeout)
    }
    #endif
}


