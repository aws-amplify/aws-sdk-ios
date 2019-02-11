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
//  AWSMobileClientSwift.swift
//  AWSMobileClient
//

import Foundation

/// Indicates the user state.
///
/// - signedIn: The user is signed in through Cognito User Pools or a federation provider like Google, Facebook, etc.
/// - signedOut: The user is signed out and does not have guest access.
/// - signedOutFederatedTokensInvalid: The tokens associated with the federation provider like Google or Facebook have expired and need to re-submitted to `AWSMobileClient`. You can do that by calling the `federatedSignIn` method or by showing the drop in UI. If the end user is unable to sign in, call `releaseSignInWait` method to return an error to the calling API.
/// - signedOutUserPoolsTokenInvalid: The Cognito User Pools tokens have expired and the end-user needs to sign in again. You can complete the sign in process using the `signIn` method or by showing the drop in UI. If the end user is unable to sign in, call `releaseSignInWait` method to return an error to the calling API.
/// - guest: The user is signed out, but has guest access in the app.
/// - unknown: The initial user state before `AWSMobileClient` is initialized.
public enum UserState: String {
    case signedIn, signedOut, signedOutFederatedTokensInvalid, signedOutUserPoolsTokenInvalid, guest, unknown
}


/// Callback type when registered to notifications for change in `UserState`. The dictionary contains information like `provider` which the user signed in with.
public typealias UserStateChangeCallback = (UserState, [String: String]) -> Void

/// Internal type to track what type of federation is active.
enum FederationProvider {
    case none, userPools, oidcFederation
}


/// `AWSMobileClient` is used for all auth related operations when your app is accessing AWS backend.
public class AWSMobileClient: _AWSMobileClient {
    
    static var _sharedInstance: AWSMobileClient = AWSMobileClient(setDelegate: true)
    
    // MARK: Feature availability variables
    
    /// Determines if there is any Cognito Identity Pool available to federate against it.
    internal var isAuthorizationAvailable: Bool = false
    
    /// Should be set to true if using AWSAuthUI / AWSIdentityManager-AWSSignInManager
    internal var operateInLegacyMode: Bool = false
    
    // MARK: State handler variables
    
    var federationProvider: FederationProvider = .none
    var cachedLoginsMap: [String: String] = [:]
    /// Internal variable used to make sure AWSMobileClient is initialized only once.
    internal var isInitialized: Bool = false
    
    
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
    internal let tokenFetchLock = DispatchGroup()
    
    /// Operation Queue to make sure there is only 1 active API call which is fetching/ waiting for AWS Credentials.
    internal let credentialsFetchOperationQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "AWSMobileClient.credentialsFetchOperationQueue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    internal let credentialsFetchLock = DispatchGroup()
    
    // MARK: AWSMobileClient helpers
    
    let ProviderKey: String = "provider"
    let TokenKey: String = "token"
    
    /// The internal Cognito Credentials Provider
    var internalCredentialsProvider: AWSCognitoCredentialsProvider?
    
    internal var pendingAWSCredentialsCompletion: ((AWSCredentials?, Error?) -> Void)? = nil
    
    var keychain: AWSUICKeyChainStore = AWSUICKeyChainStore.init(service: "\(String(describing: Bundle.main.bundleIdentifier)).AWSMobileClient")
    
    /// The registered listeners who want to observe change in `UserState`.
    var listeners: [(AnyObject, UserStateChangeCallback)] = []
    
    
    // MARK: Public API variables
    
    /// Returns the current state of user. If MobileClient is not initialized, it will return `unknown`
    public var currentUserState: UserState = .unknown
    
    
    /// Returns the username of the logged in user, nil otherwise.
    public var username: String? {
        return self.userpoolOpsHelper.currentActiveUser?.username
    }
    
    
    /// The identity id associated with this provider. This value will be fetched from the keychain at startup. If you do not want to reuse the existing identity id, you must call the clearKeychain method. If the identityId is not fetched yet, it will return nil. Use `getIdentityId()` method to force a server fetch when identityId is not available.
    override public var identityId: String? {
        return self.internalCredentialsProvider?.identityId
    }
    
    @objc override public func interceptApplication(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return _AWSMobileClient.sharedInstance().interceptApplication(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    /// Returns true if there is a user currently signed in.
    @objc public var isSignedIn: Bool {
        get {
            if (operateInLegacyMode) {
                return _AWSMobileClient.sharedInstance().isLoggedIn
            } else {
                return self.cachedLoginsMap.count > 0
            }
        }
    }
    
    
    /// The singleton instance of `AWSMobileClient`.
    ///
    /// - Returns: The singleton `AWSMobileClient` instance.
    @objc override public class func sharedInstance() -> AWSMobileClient {
        return _sharedInstance
    }
    
    
    /// Initializes `AWSMobileClient` and determines the `UserState` for current user using cache.
    ///
    /// - Parameter completionHandler: Callback which describes current user's state.
    public func initialize(_ completionHandler: @escaping (UserState?, Error?) -> Void) {
        // Read awsconfiguration.json and set the credentials provider here
        initializationQueue.sync {
            
            if (operateInLegacyMode) {
                completionHandler(nil, AWSMobileClientError.invalidState(message: "The AWSMobileClient is being used in the legacy mode. To use this initialize method please refer to the documentation."))
                return
            }
            
            if (isInitialized) {
                completionHandler(self.currentUserState, nil)
                return
            }
            
            self.loadLoginsMapFromKeychain()
            if self.cachedLoginsMap.count > 0 {
                if self.userPoolClient?.currentUser()?.isSignedIn == true {
                    self.federationProvider = .userPools
                } else {
                    self.federationProvider = .oidcFederation
                }
            }
            
            let infoObject = AWSInfo.default().defaultServiceInfo("IdentityManager")
            if let credentialsProvider = infoObject?.cognitoCredentialsProvider {
                
                self.isAuthorizationAvailable = true
                self.internalCredentialsProvider = credentialsProvider
                _AWSMobileClient.sharedInstance().update(self)
                self.internalCredentialsProvider?.setIdentityProviderManagerOnce(self)
                _AWSMobileClient.sharedInstance().registerConfigSignInProviders()
                
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
    ///   - object: The object who intends to receive notification. A strong reference is held to the object and the developer is required to call `removeUserStateListener` to stop getting notifications and release the object.
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
        for listener in listeners {
            listener.1(userState, additionalInfo)
        }
    }
    
    
    /// Shows a fully managed sign in screen which allows users to sign up and sign in.
    ///
    /// - Parameters:
    ///   - navigationController: The navigation controller which would act as the anchor for this UI.
    ///   - signInUIOptions: The options object which allows changing logo, background color and if the user can cancel the sign in operation.
    ///   - completionHandler: The completion handler to be called when user finishes the sign in action.
    public func showSignIn(navigationController: UINavigationController, signInUIOptions: SignInUIOptions = SignInUIOptions(), _ completionHandler: @escaping(UserState?, Error?) -> Void) {
        
        switch self.currentUserState {
        case .signedIn:
            completionHandler(nil, AWSMobileClientError.invalidState(message: "There is already a user which is signed in. Please log out the user before calling showSignIn."))
            return
        default:
            break
        }
        
        _AWSMobileClient.sharedInstance().showSign(inScreen: navigationController, signInUIConfiguration: signInUIOptions, completionHandler: { providerName, token, error in
            if error == nil {
                if (providerName == IdentityProvider.facebook.rawValue) || (providerName == IdentityProvider.google.rawValue) {
                    self.federatedSignIn(providerName: providerName!, token: token!, completionHandler: completionHandler)
                } else {
                    self.currentUser?.getSession().continueWith(block: { (task) -> Any? in
                        if let session = task.result {
                            self.performUserPoolSuccessfulSignInTasks(session: session)
                            completionHandler(.signedIn, nil)
                        } else {
                            completionHandler(nil, task.error)
                        }
                        return nil
                    })
                }
            } else {
                if ((error! as NSError).domain == "AWSMobileClientError") {
                    if error!._code == -1 {
                        completionHandler(nil, AWSMobileClientError.invalidState(message: "AWSAuthUI dependency is required to show the signIn screen. Please import the dependency before using this API."))
                        return
                    } else if error!._code == -2 {
                        completionHandler(nil, AWSMobileClientError.userCancelledSignIn(message: "The user cancelled the sign in operation."))
                        return
                    }
                }
                completionHandler(nil, error)
            }
        })
    }
}

// MARK: Inherited methods from AWSCognitoCredentialsProvider

extension AWSMobileClient {
    
    
    /// Asynchronously returns a valid AWS credentials or an error object if it cannot retrieve valid credentials. It should cache valid credentials as much as possible and refresh them when they are invalid.
    ///
    /// - Returns: A valid AWS credentials or an error object describing the error.
    override public func credentials() -> AWSTask<AWSCredentials> {
        let credentialsTaskCompletionSource: AWSTaskCompletionSource<AWSCredentials> = AWSTaskCompletionSource()
        
        self.getAWSCredentials { (credentials, error) in
            if let credentials = credentials {
                credentialsTaskCompletionSource.set(result: credentials)
            } else if let error = error {
                credentialsTaskCompletionSource.set(error: error)
            }
        }
        return credentialsTaskCompletionSource.task
    }
    
    
    /// Invalidates the cached temporary AWS credentials. If the credentials provider does not cache temporary credentials, this operation is a no-op.
    override public func invalidateCachedTemporaryCredentials() {
        self.internalCredentialsProvider?.invalidateCachedTemporaryCredentials()
    }
    
    
    /// Get/retrieve the identity id for this provider. If an identity id is already set on this provider, no remote call is made and the identity will be returned as a result of the AWSTask (the identityId is also available as a property). If no identityId is set on this provider, one will be retrieved from the service.
    ///
    /// - Returns: Asynchronous task which contains the identity id or error.
    override public func getIdentityId() -> AWSTask<NSString> {
        guard self.internalCredentialsProvider != nil else {
            return AWSTask(error: AWSMobileClientError.cognitoIdentityPoolNotConfigured(message: "Cannot get identityId since cognito credentials configuration is not available."))
        }
        let identityFetchTaskCompletionSource: AWSTaskCompletionSource<NSString> = AWSTaskCompletionSource()
        self.internalCredentialsProvider?.getIdentityId().continueWith(block: { (task) -> Any? in
            if let error = task.error {
                if error._domain == AWSCognitoCredentialsProviderHelperErrorDomain
                    && error._code == AWSCognitoCredentialsProviderHelperErrorType.identityIsNil.rawValue {
                    identityFetchTaskCompletionSource.set(error: AWSMobileClientError.identityIdUnavailable(message: "Fetching identity id on another thread failed. Please retry by calling `getIdentityId()` method."))
                } else {
                    identityFetchTaskCompletionSource.set(error: error)
                }
            } else if let result = task.result {
                identityFetchTaskCompletionSource.set(result: result)
            }
            return nil
        })
        
        return identityFetchTaskCompletionSource.task
    }
    
    
    /// Clear the cached AWS credentials for this provider.
    override public func clearCredentials() {
        self.internalCredentialsProvider?.clearCredentials()
    }
    
    
    /// Clear ALL saved values for this provider (identityId, credentials, logins).
    override public func clearKeychain() {
        self.internalCredentialsProvider?.clearKeychain()
    }
    
}

// MARK: Deprecated AWSMobileClient methods

extension AWSMobileClient {
    
    @available(*, deprecated: 2.7, message: "This method will be removed in the next minor version. Please update to use AWSMobileClient using `initialize`. Please visit https://aws-amplify.github.io for the latest iOS documentation.")
    override public func interceptApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [AnyHashable : Any]? = nil) -> Bool {
        return _AWSMobileClient.sharedInstance().interceptApplication(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    @available(*, deprecated: 2.7, message: "This method will be removed in the next minor version. Please update to use AWSMobileClient using `initialize`. Please visit https://aws-amplify.github.io for the latest iOS documentation.")
    @objc override public func interceptApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [AnyHashable : Any]? = nil, resumeSessionWithCompletionHandler completionHandler: @escaping (Any, Error) -> Void) -> Bool {
        operateInLegacyMode = true
        return _AWSMobileClient.sharedInstance().interceptApplication(application,
                                                                      didFinishLaunchingWithOptions: launchOptions,
                                                                      resumeSessionWithCompletionHandler: completionHandler)
    }
    
    @available(*, deprecated: 2.7, message: "This method will be removed in the next minor version. Please update to use AWSMobileClient in the updated manner. Please visit https://aws-amplify.github.io for the latest iOS documentation")
    @objc override public func setSignInProviders(_ signInProviderConfig: [AWSSignInProviderConfig]?) {
        _AWSMobileClient.sharedInstance().setSignInProviders(signInProviderConfig)
    }
    
    /// Get the credentials provider object which provides `AWSCredentials`.
    ///
    /// - Returns: An object which implements `AWSCredentialsProvider`.
    @available(*, deprecated: 2.7, message: "This method will be removed in the next minor version. AWSMobileClient itself is a credentials provider now and should be passed directly where required. Please visit https://aws-amplify.github.io for the latest iOS documentation.")
    @objc override public func getCredentialsProvider() -> AWSCognitoCredentialsProvider {
        if (operateInLegacyMode) {
            return _AWSMobileClient.sharedInstance().getCredentialsProvider()
        } else {
            return self
        }
    }
    
}
