//
//  LoginVC.swift
//  cats_facts
//
//  Created by Angelina on 1/13/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginEmailFld: UITextField!
    @IBOutlet weak var loginPassFld: UITextField!

    let defaults = UserDefaults.standard

    var savedEmail: String?
    var savedPSW: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToRegPressed(_ sender: Any) {

        performSegue(withIdentifier: "backToRegister", sender: self)
    }
    @IBAction func loginBtn(_ sender: Any) {

        // MARK: - Check if inputs are saved

        if let email = defaults.object(forKey: "email") as? String {
            savedEmail = email
            print(email)
            if let password = defaults.object(forKey: "password") as? String {
            savedPSW = password
            print(password)
            }
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
            print("Registration successful")
            navigateToMainInterface()
        }

    }

}





