//
//  DropInUIUserPoolViewController.swift
//  AWSAuthSDKTestApp
//

import UIKit
import AWSMobileClient
import AWSCore

class DropInUIUserPoolViewController: UIViewController {

    @IBOutlet weak var signInStateLabel: UILabel!
    
    @IBOutlet weak var newUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AWSMobileClient.default().addUserStateListener(self) { (userState, info) in
            DispatchQueue.main.async {
                self.signInStateLabel.text = (userState.rawValue)
            }
            print("Status changed: \(userState.rawValue)")
        }
    }

    @IBAction func adminCreateUserClicked(_ sender: Any) {
    }
    
    @IBAction func onLaunchCognitoAuthSignIn(_ sender: Any) {
        
        AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, { (userState, error) in
            if let error = error as? AWSMobileClientError {
                print(error.localizedDescription)
            }
            if let userState = userState {
                print("Status: \(userState.rawValue)")
            }
        })
    }
    
    func adminCreateUser() {
        
    }

}
