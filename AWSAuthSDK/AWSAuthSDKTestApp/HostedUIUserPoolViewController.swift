//
//  ViewController.swift
//  AWSAuthSDKTestApp
//

import UIKit
import AWSMobileClient
import AWSCore

/// View controller to handle user pool operation with hosted UI.
///
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
    
}

