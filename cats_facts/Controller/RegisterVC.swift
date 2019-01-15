//
//  ViewController.swift
//  cats_facts
//
//  Created by Angelina on 1/13/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var emailFld: UITextField!
    @IBOutlet weak var passwordFld: UITextField!
    @IBOutlet weak var confirmPassFld: UITextField!

    let defaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func alreadyAccBtn(_ sender: Any) {

        performSegue(withIdentifier: "goToLoginPage", sender: self)
    }
    

    @IBAction func registerBtn(_ sender: Any) {

        let enterPassword = isValidPassword(passStr: passwordFld.text!)
        let confirmPassword = isValidPassword(passStr: confirmPassFld.text!)
        let email = isValidEmail(testStr: emailFld.text!)

        if email == false {
            showAlert(title: "Invalid email", message: "Please enter a valid email address!")
        } else if enterPassword == false {
            showAlert(title: "Invalid password", message: "Please check Password field. Minimum 5 characters at least 1 Alphabet and 1 Number!")
        } else if (passwordFld.text != confirmPassFld.text) {
            showAlert(title: "Re-check password", message: "Password does not match the confirm password!")
        } else {
            // MARK: - Save permanent data
            defaults.set(emailFld.text, forKey: "email")
            defaults.set(confirmPassFld.text, forKey: "password")
            navigateToMainInterface()
            print("Registration successful")
        }

    }
}


