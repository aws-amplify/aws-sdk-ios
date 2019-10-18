//
//  ViewController.swift
//  AWSAuthSDKTestApp
//

import UIKit
import AWSMobileClient
import AWSCore

class ViewController: UIViewController {

    @IBOutlet weak var awsCredentialsLabel: UILabel!
    @IBOutlet weak var signInStateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AWSMobileClient.default().initialize { (userState, error) in
            if let userState = userState {
                print("Userstate is \(userState.rawValue)")
                DispatchQueue.main.async {
                    self.signInStateLabel.text = userState.rawValue
                }
            }
            if let error = error as? AWSMobileClientError {
                print(error.localizedDescription)
            }
        }
        
        AWSMobileClient.default().addUserStateListener(self) { (userState, info) in
            DispatchQueue.main.async {
                self.signInStateLabel.text = userState.rawValue
            }
            print("Status changed: \(userState.rawValue)")
        }
    }
    
    @IBAction func onLaunchCognitoAuthFacebookSignIn(_ sender: Any) {
        // Note: the scopes provided here will override options provided in the app's awsconfiguration.json
        let hostedUIOptions = HostedUIOptions(scopes: ["openid", "email"], identityProvider: "Facebook")
        
        AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, hostedUIOptions: hostedUIOptions) { (userState, error) in
            if let error = error as? AWSMobileClientError {
                print(error.localizedDescription)
            }
            if let userState = userState {
                print("Status: \(userState.rawValue)")
            }
        }
    }
    @IBAction func onLaunchCognitoAuthGoogleSignIn(_ sender: Any) {
        // Note: the scopes provided here will override options provided in the app's awsconfiguration.json
        let hostedUIOptions = HostedUIOptions(scopes: ["openid", "email"], identityProvider: "Google")
        
        AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, hostedUIOptions: hostedUIOptions) { (userState, error) in
            if let error = error as? AWSMobileClientError {
                print(error.localizedDescription)
            }
            if let userState = userState {
                print("Status: \(userState.rawValue)")
            }
        }
    }
    
    @IBAction func onLaunchAuth0SignIn(_ sender: Any) {
        // Note: the scopes provided here will override options provided in the app's awsconfiguration.json
        let hostedUIOptions = HostedUIOptions(scopes: ["openid", "email"], federationProviderName: AWSInfo.default().rootInfoDictionary["Auth0FederationProviderName"] as? String)
        
        AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, hostedUIOptions: hostedUIOptions) { (userState, error) in
            if let error = error as? AWSMobileClientError {
                print(error.localizedDescription)
            }
            if let userState = userState {
                print("Status: \(userState.rawValue)")
            }
        }
    }
    
    @IBAction func onLaunchCognitoAuthSignIn(_ sender: Any) {
        let hostedUIOptions = HostedUIOptions(scopes: ["openid", "email"])
        
        AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, hostedUIOptions: hostedUIOptions) { (userState, error) in
            if let error = error as? AWSMobileClientError {
                print(error.localizedDescription)
            }
            if let userState = userState {
                print("Status: \(userState.rawValue)")
            }
        }
    }
    
    @IBAction func onSignOutClicked(_ sender: Any) {
        AWSMobileClient.default().signOut(options: SignOutOptions(signOutGlobally: false, invalidateTokens: true)) { (error) in
            print("Error: \(error.debugDescription)")
        }
    }
    
    @IBAction func onGetAWSCredentials(_ sender: Any) {
        AWSMobileClient.default().getAWSCredentials { (credentials, error) in
            DispatchQueue.main.async {
                if let error = error {
                    self.awsCredentialsLabel.text = "ERROR: \(error.localizedDescription)"
                }
                if let credentials = credentials {
                    self.awsCredentialsLabel.text = credentials.accessKey
                }
            }
        }
    }
}

