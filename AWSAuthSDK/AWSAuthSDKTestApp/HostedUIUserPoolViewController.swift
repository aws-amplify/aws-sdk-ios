//
//  ViewController.swift
//  AWSAuthSDKTestApp
//

import UIKit
import AWSMobileClient
import AWSCore
import AWSTestResources

/// View controller to handle user pool operation with hosted UI.
///
@available(iOS 10.0, *)
class HostedUIUserPoolViewController: UIViewController {
    
    @IBOutlet weak var signInStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AWSMobileClient.default().addUserStateListener(self) { (userState, info) in
            DispatchQueue.main.async {
                self.signInStateLabel.text = (userState.rawValue)
            }
            print("Status changed: \(userState.rawValue)")
        }
    }
    
    @IBAction func onLaunchCognitoAuthSignIn(_ sender: Any) {
        let hostedUIOptions = HostedUIOptions(scopes: ["openid", "email", "aws.cognito.signin.user.admin"])
        AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, hostedUIOptions: hostedUIOptions) { (userState, error) in
            if let error = error as? AWSMobileClientError {
                print(error.localizedDescription)
            }
            if let userState = userState {
                print("Status: \(userState.rawValue)")
            }
        }
    }
    
    @IBAction func invalidateAccessToken(_ sender: Any) {
        invalidateAccessToken()
    }

    @IBAction func invalidateRefreshToken(_ sender: Any) {
        invalidateRefreshToken()
    }

    private func invalidateRefreshToken() {
        let key = getTokenKeychain()
        getKeychain().removeItem(forKey: key)
    }

    private func invalidateAccessToken() {
        let key = getTokenKeychain()
        let pastDate = Date(timeIntervalSinceNow: -1)
        let formattedDate = ISO8601DateFormatter().string(from: pastDate)
        let dateData = formattedDate.data(using: .utf8)
        getKeychain().setData(dateData, forKey: key)
    }

    private func getKeychain() -> AWSUICKeyChainStore {
        let bundleID = Bundle.main.bundleIdentifier
        let keychain = AWSUICKeyChainStore(service: "\(bundleID!).\(AWSCognitoIdentityUserPool.self)")
        return keychain
    }

    private func getTokenKeychain() -> String {
        let mobileClientConfig = AWSTestConfiguration.getIntegrationTestConfiguration(forPackageId: "mobileclient")
        let awsconfiguration = mobileClientConfig["awsconfiguration"] as! [String: Any]
        let userPoolConfig = awsconfiguration["CognitoUserPool"] as! [String: [String: Any]]
        let appClientId = (userPoolConfig["Default"]!["AppClientId"] as! String)
        let namespace = "\(appClientId).\(AWSMobileClient.default().username ?? "")"
        let key = "\(namespace).tokenExpiration"
        return key
    }
}

