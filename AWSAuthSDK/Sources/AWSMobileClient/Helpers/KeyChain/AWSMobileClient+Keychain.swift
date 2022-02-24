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

/// Extension to hold the keychain methods
extension AWSMobileClient {

    internal func setLoginProviderMetadataAndSaveInKeychain(provider: FederationProvider) {
        self.federationProvider = provider
        self.keychain.setString(
            provider.rawValue,
            forKey: AWSMobileClientConstants.FederationProviderKey)
        if let customRoleArn = self.customRoleArnInternal {
            self.keychain.setString(
                customRoleArn,
                forKey: AWSMobileClientConstants.CustomRoleArnKey)
        } else {
            self.keychain.removeItem(forKey: AWSMobileClientConstants.CustomRoleArnKey)
        }
        if federationDisabled {
            self.keychain.setString("true", forKey: AWSMobileClientConstants.FederationDisabledKey)
        }
    }

    internal func saveOAuthURIQueryParametersInKeychain() {
        self.keychain.setData(JSONHelper.dataFromDictionary(self.signInURIQueryParameters), forKey: AWSMobileClientConstants.SignInURIQueryParametersKey)
        self.keychain.setData(JSONHelper.dataFromDictionary(self.tokenURIQueryParameters), forKey: AWSMobileClientConstants.TokenURIQueryParametersKey)
        self.keychain.setData(JSONHelper.dataFromDictionary(self.signOutURIQueryParameters), forKey: AWSMobileClientConstants.SignOutURIQueryParametersKey)
    }

    internal func loadOAuthURIQueryParametersFromKeychain() {
        self.signInURIQueryParameters = JSONHelper.dictionaryFromData(self.keychain.data(forKey: AWSMobileClientConstants.SignInURIQueryParametersKey))
        self.tokenURIQueryParameters = JSONHelper.dictionaryFromData(self.keychain.data(forKey: AWSMobileClientConstants.TokenURIQueryParametersKey))
        self.signOutURIQueryParameters = JSONHelper.dictionaryFromData(self.keychain.data(forKey: AWSMobileClientConstants.SignOutURIQueryParametersKey))
    }

    internal func loadHostedUIScopesFromKeychain() {
        self.scopes = JSONHelper.arrayFromData(self.keychain.data(forKey: AWSMobileClientConstants.HostedUIOptionsScopesKey))
    }

    internal func saveHostedUIOptionsScopesInKeychain() {
        self.keychain.setData(JSONHelper.dataFromArray(self.scopes), forKey: AWSMobileClientConstants.HostedUIOptionsScopesKey)
    }

    internal func clearHostedUIOptionsScopesFromKeychain() {
        self.keychain.removeItem(forKey: AWSMobileClientConstants.HostedUIOptionsScopesKey)
    }

    internal func saveLoginsMapInKeychain() {
        if self.cachedLoginsMap.count == 0 {
            self.keychain.removeItem(forKey: AWSMobileClientConstants.LoginsMapKey)
            self.keychain.removeItem(forKey: AWSMobileClientConstants.FederationDisabledKey)
        } else {
            do {
                let data = try Data.init(base64Encoded: JSONEncoder().encode(self.cachedLoginsMap).base64EncodedData())
                self.keychain.setData(data, forKey: AWSMobileClientConstants.LoginsMapKey)
            } catch {
                print("could not save login map in cache")
            }
        }
    }

    internal func loadLoginsMapFromKeychain() {
        let data = self.keychain.data(forKey: AWSMobileClientConstants.LoginsMapKey)
        if data != nil {
            do {
                let dict = try JSONDecoder().decode([String: String].self, from: data!)
                self.cachedLoginsMap = dict
            } catch {
                print("Could not load login map from cache")
            }
        } else {
            self.cachedLoginsMap = [:]
        }
    }

    internal func loadFederationProviderMetadataFromKeychain() {
        if let federationProviderString = self.keychain.string(forKey: AWSMobileClientConstants.FederationProviderKey),
            let federationProvider = FederationProvider(rawValue: federationProviderString) {
            self.federationProvider = federationProvider
        }
        if let customRoleArnString = self.keychain.string(forKey: AWSMobileClientConstants.CustomRoleArnKey) {
            self.customRoleArnInternal = customRoleArnString
        }
        if let _ = self.keychain.string(forKey: AWSMobileClientConstants.FederationDisabledKey) {
            self.federationDisabled = true
        }
    }
}
