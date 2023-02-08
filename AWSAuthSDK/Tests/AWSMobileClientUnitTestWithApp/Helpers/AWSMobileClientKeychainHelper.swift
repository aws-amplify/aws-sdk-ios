//
//  AWSMobileClientKeychainHelper.swift
//  AWSMobileClientUnitTestWithApp

import Foundation
@testable import AWSMobileClient

struct AWSMobileClientKeychainHelper {

    let mobileClientKeychain: AWSUICKeyChainStore
    let userPoolSDKKeychain: AWSUICKeyChainStore
    let identityPoolSDKKeychain: AWSUICKeyChainStore

    init(identityPoolId: String = "") {
        let serviceName = "\(String(describing: Bundle.main.bundleIdentifier)).AWSMobileClient"
        mobileClientKeychain =  AWSUICKeyChainStore.init(service: serviceName)

        let serviceName2 = "\(Bundle.main.bundleIdentifier ?? "").AWSCognitoIdentityUserPool"
        userPoolSDKKeychain = AWSUICKeyChainStore.init(service: serviceName2)

        let serviceName3 = "\(Bundle.main.bundleIdentifier ?? "").AWSCognitoCredentialsProvider.\(identityPoolId)"
        identityPoolSDKKeychain = AWSUICKeyChainStore.init(service: serviceName3)
    }

    func removeAllItems() {
        mobileClientKeychain.removeAllItems()
        userPoolSDKKeychain.removeAllItems()
        identityPoolSDKKeychain.removeAllItems()
    }

    func mockUserPoolSignedInUser(appClientID: String = "") throws {
        let jsonLoginsMap = try JSONEncoder().encode(["test": "data"]).base64EncodedData()
        let data = Data.init(base64Encoded: jsonLoginsMap)
        self.mobileClientKeychain.setData(data, forKey: "loginsMap")
        self.mobileClientKeychain.setString("userPools", forKey: "federationProvider")
        self.userPoolSDKKeychain.setString("someUserName", forKey: "\(appClientID).currentUser")
    }

    func mockPreviousInstall(userPoolID: String = "",
                             appClientID: String = "",
                             identityPoolID: String = "") {
        let configValue = "\(userPoolID)#\(appClientID)#\(identityPoolID)"
        self.mobileClientKeychain.setString(
            configValue,
            forKey: AWSMobileClientConstants.ConfigurationKey)
    }
}
