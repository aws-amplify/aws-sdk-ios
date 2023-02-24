//
//  AWSMobileClientHelper.swift
//  AWSMobileClientUnitTestWithApp

import Foundation
@testable import AWSMobileClient
@testable import AWSCore

enum AWSMobileClientHelper {

    static func createAWSMobileClient(_ configuration: [String: Any]) -> AWSMobileClient {

        // There are three singleton used when you initialize AWSMobileClient, making it hard to
        // recreate them for testing. These are AWSMobileClient, AWSInfo and AWSCognitoIdentityUserPool.
        // Below code tries to overcome these by overriding some key information inside these
        // singleton, so that it appears to be a fresh initialization.

        // Override the existing AWSInfo configuration and the credentialprovider.
        // Existing configuration needs to be overriden to test different configuration on each test,
        // credentials provider needs to be overriden because AWSMobileClient init had this overriden
        // to self instance.
        AWSInfo.default().resetCredentialProvider(configuration)
        AWSInfo.default().resetConfiguration(configuration)

        // Start a new instance of AWSMobileClient with the new configuration
        let mobileClient = AWSMobileClient(configuration: configuration)

        // Override the configuration used userpool and identity pool
        let userPoolConfig = AWSServiceConfiguration(region: .USEast2, credentialsProvider: nil)
        let anonymousCredentialProvider = AWSAnonymousCredentialsProvider()
        let idpConfig = AWSServiceConfiguration(region: .USEast2,
                                                credentialsProvider: anonymousCredentialProvider)
        AWSMobileClient.updateCognitoService(userPoolConfiguration: userPoolConfig,
                                             identityPoolConfiguration: idpConfig)

        // Remove any existing AWSCognitoIdentityUserPool so that it is recreated
        AWSCognitoIdentityUserPool.remove(forKey: "CognitoUserPoolKey")
        return mobileClient
    }

    static func createConfiguration(
        userPoolID: String? = nil,
        appClientID: String? = nil,
        identityPoolID: String? = nil) ->  [String: Any]  {

            var configuration = [
                "IdentityManager": [
                    "Default": [:]
                ]
            ]
            if let userPoolID = userPoolID,
               let appClientID = appClientID {
                configuration["CognitoUserPool"] = [
                    "Default": [
                        "PoolId": userPoolID,
                        "AppClientId": appClientID,
                        "Region": "us-east-1"
                    ]]
            }
            if let identityPoolID = identityPoolID {
                configuration["CredentialsProvider"] = [
                    "CognitoIdentity": [
                        "Default": [
                            "PoolId": identityPoolID,
                            "Region": "us-east-1"
                        ]
                    ]
                ]
            }

            return configuration

        }
}

extension AWSInfo {

    func resetConfiguration(_ configuration: [String: Any]) {
        self.setValue(configuration, forKey: "_rootInfoDictionary")
    }

    func resetCredentialProvider(_ configuration: [String: Any]) {

        // We should use the same identityPoolId for keychain to work
        let keyPath = "CredentialsProvider.CognitoIdentity.Default.PoolId"
        let poolId = (configuration as NSDictionary).value(forKeyPath: keyPath) as? String
        let provider = AWSCognitoCredentialsProvider(
            regionType: .USEast1,
            identityPoolId: poolId ?? "someid")
        self.setValue(provider, forKey: "_defaultCognitoCredentialsProvider")
    }
}
