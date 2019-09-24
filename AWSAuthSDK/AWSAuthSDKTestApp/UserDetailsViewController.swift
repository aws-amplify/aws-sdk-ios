//
//  ViewController.swift
//  AWSAuthSDKTestApp
//

import UIKit
import AWSMobileClient
import AWSCore

class UserDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var idTokenLabel: UILabel!
    @IBOutlet weak var accessTokenLabel: UILabel!
    @IBOutlet weak var refreshTokenLabel: UILabel!
    @IBOutlet weak var tokenExpirationLabel: UILabel!
    
    @IBOutlet weak var accesKeyLabel: UILabel!
    @IBOutlet weak var secretKeyLabel: UILabel!
    @IBOutlet weak var sessionKeyLabel: UILabel!
    @IBOutlet weak var credentialExpirationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchToken()
        fetchCredentials()

    }
    
    func fetchToken() {
        AWSMobileClient.default().getTokens { (token, error) in
            
            DispatchQueue.main.async {
                guard let result = token else {
                
                    self.idTokenLabel.text = "NA"
                    self.accessTokenLabel.text = "NA"
                    self.refreshTokenLabel.text = "NA"
                    self.tokenExpirationLabel.text = "NA"
                    return
                }
                self.idTokenLabel.text = result.idToken!.tokenString
                self.accessTokenLabel.text = result.accessToken!.tokenString
                self.refreshTokenLabel.text = result.refreshToken!.tokenString
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd hh:mm:ss"
                self.tokenExpirationLabel.text = df.string(from: result.expiration!)
            }
        }
    }
    
    func fetchCredentials() {
        AWSMobileClient.default().getAWSCredentials { (credentials, error) in
            guard let result = credentials else {
                
                DispatchQueue.main.async {
                    self.accessTokenLabel.text = "NA"
                    self.secretKeyLabel.text = "NA"
                    self.sessionKeyLabel.text = "NA"
                    self.credentialExpirationLabel.text = "NA"
                }
                return
                
            }
            DispatchQueue.main.async {
                self.accesKeyLabel.text = result.accessKey
                self.secretKeyLabel.text = result.secretKey
                self.sessionKeyLabel.text = result.sessionKey
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd hh:mm:ss"
                self.credentialExpirationLabel.text = df.string(from: result.expiration!)
            }
            
        }
    }
    
    func fetchUserAttributes() {
        
    }
}
