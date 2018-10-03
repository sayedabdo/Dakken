//
//  LoginVC.swift
//  Dakken
//
//  Created by Sayed Abdo on 10/3/18.
//  Copyright © 2018 sayedAbdo. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginBtn.setTitle(NSLocalizedString("log in", comment: ""), for: .normal)
        buttonborder(button_outlet_name:loginBtn)
    }

    
    @IBAction func loginAction(_ sender: Any) {
        
        
        print("sayed : \(UIDevice.current.identifierForVendor!.uuidString)")
        let current_name_email = emailTextField.text!
        let current_password = passwordTextField.text!
        
        
        //check if the email textfield is valid or not
        let EmailAddress = emailTextField.text
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: EmailAddress!)
        if isEmailAddressValid
        {} else {
            displayAlertMessage(title: NSLocalizedString("Error", comment: ""), messageToDisplay: NSLocalizedString("email", comment: ""), titleofaction: NSLocalizedString("Try Again", comment: ""))
            return
        }
        //check if the password textfield is empty or not
        if(passwordTextField.text?.isEmpty)!{
            displayAlertMessage(title: NSLocalizedString("Error", comment: ""), messageToDisplay: NSLocalizedString("password", comment: ""), titleofaction: NSLocalizedString("Try Again", comment: ""))
            return
        }
        let loginurl = "http://cookehome.com/CookApp/User/Login.php"
        let params: [String : String] =
            [   "email"                  : "\(emailTextField.text!)",
                "password"               : "\(passwordTextField.text!)",
                "firebase_token"         : "",
                "device_id"              : "\(UIDevice.current.identifierForVendor!.uuidString)"
                
        ]
        Alamofire.request(loginurl, method: .post, parameters: params)
            .responseJSON { response in
                let result = response.result
                print("the response is 1 : \(result)")
                if let arrayOfDic = result.value as? Dictionary<String, AnyObject> {
                   
                    }
                }
        }
    }
    

}

