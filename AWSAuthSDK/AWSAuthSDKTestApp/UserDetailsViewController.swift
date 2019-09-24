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
    
    @IBOutlet weak var attribute1Label: UILabel!
    @IBOutlet weak var attribute2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
    }
    
    @IBAction func updateUserAttributeAction(_ sender: Any) {
        resetData()
        updateUserAttributes()
    }
    
    func refreshData() {
        fetchUserAttributes()
        fetchToken()
        fetchCredentials()
    }
    
    func resetData() {
        DispatchQueue.main.async {
            self.idTokenLabel.text = "NA"
            self.accessTokenLabel.text = "NA"
            self.refreshTokenLabel.text = "NA"
            self.tokenExpirationLabel.text = "NA"
            self.accessTokenLabel.text = "NA"
            self.secretKeyLabel.text = "NA"
            self.sessionKeyLabel.text = "NA"
            self.credentialExpirationLabel.text = "NA"
            self.attribute1Label.text = "NA"
            self.attribute2Label.text = "NA"
        }
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
                
                if let idTokenString = result.idToken?.tokenString {
                    let subIndex = idTokenString.index(idTokenString.startIndex, offsetBy: 20)
                    self.idTokenLabel.text = String(idTokenString[..<subIndex])
                }
                
                if let accessTokenString = result.accessToken?.tokenString {
                    let subIndex = accessTokenString.index(accessTokenString.startIndex, offsetBy: 20)
                    self.accessTokenLabel.text = String(accessTokenString[..<subIndex])
                }
                
                if let refreshTokenString = result.refreshToken?.tokenString {
                    let subIndex = refreshTokenString.index(refreshTokenString.startIndex, offsetBy: 20)
                    self.refreshTokenLabel.text = String(refreshTokenString[..<subIndex])
                }
                
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd hh:mm:ss"
                self.tokenExpirationLabel.text = df.string(from: result.expiration!)
            }
        }
    }
    
    func fetchCredentials() {
        AWSMobileClient.default().getAWSCredentials { (credentials, error) in
            DispatchQueue.main.async {
                guard let result = credentials else {

                    self.accessTokenLabel.text = "NA"
                    self.secretKeyLabel.text = "NA"
                    self.sessionKeyLabel.text = "NA"
                    self.credentialExpirationLabel.text = "NA"
                    return
                }
                
                self.accesKeyLabel.text = result.accessKey
                
                let subIndex = result.secretKey.index(result.secretKey.startIndex, offsetBy: 20)
                self.secretKeyLabel.text = String(result.secretKey[..<subIndex])
                self.sessionKeyLabel.text = String(result.sessionKey![..<subIndex])
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd hh:mm:ss"
                self.credentialExpirationLabel.text = df.string(from: result.expiration!)
            }
            
        }
    }
    
    func fetchUserAttributes() {
        AWSMobileClient.default().getUserAttributes { attributes, error in
            DispatchQueue.main.async {
                guard let attributes = attributes else {
                    self.attribute1Label.text = "NA"
                    self.attribute2Label.text = "NA"
                    return
                }
                self.attribute1Label.text = attributes["custom:mutableStringAttr1"]
                self.attribute2Label.text = String(attributes["custom:mutableStringAttr2"]!)
            }
        }
    }
    
    func updateUserAttributes() {
        let newUserAttributes = [
            "custom:mutableStringAttr1": UUID().uuidString,
            "custom:mutableStringAttr2": UUID().uuidString
        ]
        
        AWSMobileClient.default().updateUserAttributes(attributeMap: newUserAttributes) { result, error in
            self.refreshData()
        }
    }
}
