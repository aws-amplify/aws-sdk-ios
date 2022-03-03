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

/// `AWSMobileClient` is used for all auth related operations when your app is accessing AWS backend.
final public class AWSMobileClient: _AWSMobileClient {
    
    static var _sharedInstance: AWSMobileClient = AWSMobileClient(setDelegate: true)

    static var serviceConfiguration: CognitoServiceConfiguration? = nil
    
    // MARK: State handler variables
    
    var federationProvider: FederationProvider = .none
    var cachedLoginsMap: [String: String] = [:]
    /// Internal variable used to make sure AWSMobileClient is initialized only once.
    internal var isInitialized: Bool = false

    internal var federationDisabled: Bool = false
    internal var customRoleArnInternal: String? = nil
    
    internal var signInURIQueryParameters: [String: String]? = nil
    internal var tokenURIQueryParameters: [String: String]? = nil
    internal var signOutURIQueryParameters: [String: String]? = nil
    internal var scopes: [String]? = nil
    
    // MARK: Execution Helpers (DispatchQueue, OperationQueue, DispatchGroup)
    
    // Internal DispatchQueue which will be used synchronously to initialize the AWSMobileClient.
    internal let initializationQueue = DispatchQueue(label: "awsmobileclient.credentials.fetch")
    
    /// Operation Queue to make sure there is only 1 active API call which is fetching/ waiting for UserPools token.
    lazy var tokenFetchOperationQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "AWSMobileClient.tokenFetchOperationQueue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

    /// Operation Queue to make sure there is only 1 active API call which is fetching/ waiting for AWS Credentials.
    internal let credentialsFetchOperationQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "AWSMobileClient.credentialsFetchOperationQueue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    /// This token is invoked when the developer explicitly calls the signOut from
    /// AWSMobileClient, thus invalidating all credentials calls.
    var credentialsFetchCancellationSource: AWSCancellationTokenSource = AWSCancellationTokenSource()
    
    /// The internal Cognito Credentials Provider
    var internalCredentialsProvider: AWSCognitoCredentialsProvider?
    
    // Used as lock when AWSCredentials are requested
    internal var pendingAWSCredentialsCompletion: ((AWSCredentials?, Error?) -> Void)? = nil
    
    // Used as lock when waiting for tokens, currently used by hostedUI auth
    internal var pendingGetTokensCompletion: ((Tokens?, Error?) -> Void)? = nil
    
    internal weak var developerNavigationController: UINavigationController? = nil
    
    var keychain: AWSUICKeyChainStore = AWSUICKeyChainStore.init(
        service: "\(String(describing: Bundle.main.bundleIdentifier)).AWSMobileClient")
    
    internal var isCognitoAuthRegistered = false
    internal let CognitoAuthRegistrationKey = "AWSMobileClient"
    
    /// The registered listeners who want to observe change in `UserState`.
    var listeners: [(AnyObject, UserStateChangeCallback)] = []

    /// Holds a reference to the AWSInfo configuration object
    internal lazy var awsInfo: AWSInfo = {
        return AWSInfo.default()
    }()
    
    /// Hold on to user password for custom auth. Password verification can
    /// come as the second step in custom auth.
    var userPassword: String? = nil

    var tokenOperations:[FetchUserPoolTokensOperation] = []

    // MARK: Public API variables
    
    /// Returns the current state of user. If MobileClient is not initialized, it will return `unknown`
    public var currentUserState: UserState = .unknown
    
    public var deviceOperations: DeviceOperations = DeviceOperations.sharedInstance


    /// The singleton instance of `AWSMobileClient`.
    ///
    /// **Deprecation note:** use `AWSMobileClient.default()` since it communicates better the API intent.
    ///
    /// - Returns: The singleton `AWSMobileClient` instance.
    @available(*, deprecated, renamed: "default")
    @objc override public class func sharedInstance() -> AWSMobileClient {
        return self.default()
    }

    /// The default instance of `AWSMobileClient`. The configuration is loaded from the `awsconfiguration.json` file.
    ///
    /// You can manage your own instance of `AWSMobileClient` by constructing it with `AWSMobileClient(configuration)`,
    /// however please note that multiple instances of AWSMobileClient is not supported.
    ///
    /// **Implementation Notes:**
    ///
    /// The `AWSMobileClient` relies on `AWSInfo` for configuration and once that class is initialized, the configuration
    /// cannot be reset and/or re-initialized. Therefore, even though you can instantiate `AWSMobileClient` multiple times,
    /// all instances will have the same configuration reference.
    ///
    /// - Returns: The default `AWSMobileClient` instance
    @objc public class func `default`() -> AWSMobileClient {
        return _sharedInstance
    }
    
    /// Check if there was a previous configuration with different values for user pool and identity pool. If we find that there is a previous configuration
    /// and the configuration are different from the present, clear all keychain values. Exception is the case where the previous configuration was only
    /// identity pool and developer decide to add user pool configuration with the same identitypool, in this case we do not clear keychain.
    ///
    func cleanupPreviousInstall() {
        let userpoolInfo = self.awsInfo.rootInfoDictionary["CognitoUserPool"] as? [String: [String: Any]]
        let userpoolDefault: [String: Any]? = userpoolInfo?["Default"]
        let userPoolClientId = userpoolDefault?["AppClientId"] ?? ""
        let userPooldId = userpoolDefault?["PoolId"] ?? ""
        
        let identityPoolInfo = self.awsInfo.rootInfoDictionary["CredentialsProvider"] as? [String: [String: Any]]
        let identityPoolDefault: [String: Any]? = identityPoolInfo?["CognitoIdentity"]?["Default"] as? [String: Any]
        let identityPoolId: String = identityPoolDefault?["PoolId"] as? String ?? ""
        
        let configValue = "\(userPooldId)#\(userPoolClientId)#\(identityPoolId)"
        if let existingConfigValue = self.keychain.string(forKey: AWSMobileClientConstants.ConfigurationKey),
           !existingConfigValue.isEmpty,
           !previousWasSameIdentityPool(previousConfig: existingConfigValue, currentIdentityPool: identityPoolId),
           configValue != existingConfigValue {
            
            let infoObject = AWSInfo.default().defaultServiceInfo("IdentityManager")
            if let credentialsProvider = infoObject?.cognitoCredentialsProvider {
                credentialsProvider.clearKeychain()
            }
            self.keychain.removeAllItems()
            self.clearKeychain()
            self.signOut()
        }
        self.keychain.setString(configValue, forKey: AWSMobileClientConstants.ConfigurationKey)
    }
    
    func previousWasSameIdentityPool(previousConfig: String, currentIdentityPool: String) -> Bool {
        
        let parts = previousConfig.split(separator: "#", omittingEmptySubsequences: false)
        if (parts[0].isEmpty && parts[1].isEmpty &&
            parts[2] == currentIdentityPool) {
            return true
        }
        return false
    }
    
    func saveConfig(userPoolID: String = "",
                    appClientID: String = "",
                    identityPoolID: String = "") {
        let configValue = "\(userPoolID)#\(appClientID)#\(identityPoolID)"
        self.keychain.setString(configValue, forKey: "configurationKey")
    }
    
    /// Initializes `AWSMobileClient` and determines the `UserState` for current user using cache.
    ///
    /// - Parameter completionHandler: Callback which describes current user's state.
    public func initialize(_ completionHandler: @escaping (UserState?, Error?) -> Void) {
        // Read awsconfiguration.json and set the credentials provider here
        initializationQueue.sync {
            
            if (isInitialized) {
                completionHandler(self.currentUserState, nil)
                return
            }
            cleanupPreviousInstall()
            self.loadLoginsMapFromKeychain()
            // Updated logic to determine federation provider from keychain.
            self.loadFederationProviderMetadataFromKeychain()
            
            DeviceOperations.sharedInstance.mobileClient = self
            
            // legacy fallback logic to determine federation provider for AWSMobileClient
            if self.federationProvider == .none && self.cachedLoginsMap.count > 0 {
                if self.userPoolClient?.currentUser()?.isSignedIn == true {
                    self.federationProvider = .userPools
                } else {
                    self.federationProvider = .oidcFederation
                }
            }
            
            if self.federationProvider == .hostedUI {
                loadHostedUIScopesFromKeychain()
                loadOAuthURIQueryParametersFromKeychain()
                
                let infoDictionaryMobileClient = self.awsInfo.rootInfoDictionary["Auth"] as? [String: [String: Any]]
                let infoDictionary: [String: Any]? = infoDictionaryMobileClient?["Default"]?["OAuth"] as? [String: Any]
                
                let clientId = infoDictionary?["AppClientId"] as? String
                let secret = infoDictionary?["AppClientSecret"] as? String
                let webDomain = infoDictionary?["WebDomain"] as? String
                let hostURL = "https://\(webDomain!)"
                
                if self.scopes == nil {
                    self.scopes = infoDictionary?["Scopes"] as? [String]
                }
                
                let signInRedirectURI = infoDictionary?["SignInRedirectURI"] as? String
                let signInURI = infoDictionary?["SignInURI"] as? String
                if self.signInURIQueryParameters == nil {
                    self.signInURIQueryParameters = infoDictionary?["SignInURIQueryParameters"] as? [String: String]
                }
                
                let signOutRedirectURI = infoDictionary?["SignOutRedirectURI"] as? String
                let signOutURI = infoDictionary?["SignOutURI"] as? String
                if self.signOutURIQueryParameters == nil {
                    self.signOutURIQueryParameters = infoDictionary?["SignOutURIQueryParameters"] as? [String: String]
                }
                
                let tokensURI = infoDictionary?["TokenURI"] as? String
                if self.tokenURIQueryParameters == nil {
                    self.tokenURIQueryParameters = infoDictionary?["TokenURIQueryParameters"] as? [String: String]
                }
                
                if (clientId == nil || scopes == nil || signInRedirectURI == nil || signOutRedirectURI == nil) {
                    completionHandler(nil, AWSMobileClientError.invalidConfiguration(message: "Please provide all configuration parameters to use the hosted UI feature."))
                }
                
                let cognitoAuthConfig = AWSCognitoAuthConfiguration.init(appClientId: clientId!,
                                                                         appClientSecret: secret,
                                                                         scopes: Set<String>(self.scopes!.map { $0 }),
                                                                         signInRedirectUri: signInRedirectURI!,
                                                                         signOutRedirectUri: signOutRedirectURI!,
                                                                         webDomain: hostURL,
                                                                         identityProvider: nil,
                                                                         idpIdentifier: nil,
                                                                         signInUri: signInURI,
                                                                         signOutUri: signOutURI,
                                                                         tokensUri: tokensURI,
                                                                         signInUriQueryParameters: self.signInURIQueryParameters,
                                                                         signOutUriQueryParameters: self.signOutURIQueryParameters,
                                                                         tokenUriQueryParameters: self.tokenURIQueryParameters,
                                                                         userPoolServiceConfiguration: AWSMobileClient.serviceConfiguration?.userPoolServiceConfiguration,
                                                                         signInPrivateSession: false)
                
                if (isCognitoAuthRegistered) {
                    AWSCognitoAuth.remove(forKey: CognitoAuthRegistrationKey)
                }
                AWSCognitoAuth.registerCognitoAuth(with: cognitoAuthConfig, forKey: CognitoAuthRegistrationKey)
                isCognitoAuthRegistered = true
                let cognitoAuth = AWSCognitoAuth.init(forKey: CognitoAuthRegistrationKey)
                cognitoAuth.delegate = self
            }
            
            let infoDictionaryMobileClient = self.awsInfo.rootInfoDictionary["Auth"] as? [String: [String: Any]]
            if let authFlowType = infoDictionaryMobileClient?["Default"]?["authenticationFlowType"] as? String,
               authFlowType == "CUSTOM_AUTH" {
                self.userPoolClient?.isCustomAuth = true
            }
            
            let infoObject = AWSInfo.default().defaultServiceInfo("IdentityManager")
            if let credentialsProvider = infoObject?.cognitoCredentialsProvider {

                self.internalCredentialsProvider = credentialsProvider
                self.update(self)
                self.internalCredentialsProvider?.setIdentityProviderManagerOnce(self)
                self.registerConfigSignInProviders()
                
                if (self.internalCredentialsProvider?.identityId != nil) {
                    if (federationProvider == .none) {
                        currentUserState = .guest
                        completionHandler(.guest, nil)
                    } else {
                        currentUserState = .signedIn
                        completionHandler(.signedIn, nil)
                    }
                } else  if (self.cachedLoginsMap.count > 0) {
                    currentUserState = .signedIn
                    completionHandler(.signedIn, nil)
                } else {
                    currentUserState = .signedOut
                    completionHandler(.signedOut, nil)
                }
            } else if self.cachedLoginsMap.count > 0 {
                currentUserState = .signedIn
                completionHandler(.signedIn, nil)
            } else {
                currentUserState = .signedOut
                completionHandler(.signedOut, nil)
            }
            isInitialized = true
        }
    }
    
    /// Adds a listener who receives notifications on user state change.
    ///
    /// - Parameters:
    ///   - object: The object who intends to receive notification. A strong reference is held to the object and the developer is
    ///   required to call `removeUserStateListener` to stop getting notifications and release the object.
    ///   - callback: Callback describing the new user state.
    public func addUserStateListener(_ object: AnyObject, _ callback: @escaping UserStateChangeCallback)  {
        listeners.append((object, callback))
    }
    
    /// Removes a registered listener. If no listener exists, call is ignored.
    ///
    /// - Parameter object: The object to be de-registered from receiving notifications.
    public func removeUserStateListener(_ object: AnyObject) {
        listeners = listeners.filter { return !($0.0 === object)}
    }
    
    internal func mobileClientStatusChanged(userState: UserState, additionalInfo: [String: String]) {
        self.currentUserState = userState
        tokenOperations.forEach { op in
            op.authStateChanged(currentUserState)
        }
        for listener in listeners {
            listener.1(userState, additionalInfo)
        }
    }
}

// MARK:- AWSMobileClient Cognito configuration

public extension AWSMobileClient {

    /// Updates the service configuration for the Cognito Services
    ///
    /// - Warning: This method is intended for internal use only.
    static func updateCognitoService(userPoolConfiguration: AWSServiceConfiguration?,
                                     identityPoolConfiguration: AWSServiceConfiguration?) {
        let configuration = CognitoServiceConfiguration(userPoolServiceConfiguration: userPoolConfiguration,
                                                        identityPoolServiceConfiguration: identityPoolConfiguration)
        self.serviceConfiguration = configuration
        UserPoolOperationsHandler.serviceConfiguration = configuration
        AWSInfo.configureIdentityPoolService(configuration.identityPoolServiceConfiguration)
    }
}

struct CognitoServiceConfiguration {

    let userPoolServiceConfiguration: AWSServiceConfiguration?

    let identityPoolServiceConfiguration: AWSServiceConfiguration?
}
