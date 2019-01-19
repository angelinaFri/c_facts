//
//  LoginVC.swift
//  cats_facts
//
//  Created by Angelina on 1/13/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit



class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginEmailFld: UITextField!
    @IBOutlet weak var loginPassFld: UITextField!

    let defaults = UserDefaults.standard

    var userIsLoggedIn: Bool = false

    
    var savedEmail: String?
    var savedPSW: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        loginEmailFld.delegate = self
        loginPassFld.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backToRegPressed(_ sender: Any) {

        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        UIApplication.shared.keyWindow?.rootViewController = viewController

    }
    @IBAction func loginBtn(_ sender: Any) {

        // MARK: - Assign data to saved permanently 

        if let email = defaults.object(forKey: "email") as? String {
            savedEmail = email

        }
        if let password = defaults.object(forKey: "password") as? String {
            savedPSW = password

            }
        var inputPassword = isValidPassword(passStr: loginPassFld.text!)
        var inputEmail = isValidEmail(testStr: loginEmailFld.text!)

        if inputEmail == false {
            showAlert(title: "Invalid email", message: "Please enter a valid email address!")
        } else if inputPassword == false {
            showAlert(title: "Wrong password", message: "Please check the password")
        } else if loginEmailFld.text != savedEmail || loginPassFld.text != savedPSW {
            showAlert(title: "Wrong data", message: "Your email or password is incorrect")
        } else if loginEmailFld.text == savedEmail && loginPassFld.text == savedPSW {
            defaults.set(true, forKey: "userLoggedIn")
            navigateToMainInterface()
        }
    }
}









