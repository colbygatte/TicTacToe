//
//  LoginViewController.swift
//  TicTacToe
//
//  Created by Colby Gatte on 12/20/16.
//  Copyright © 2016 colbyg. All rights reserved.
//
// 23.24

import UIKit
import Firebase


class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        title = "Login"
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        usernameTextField.placeholder = "email"
        passwordTextField.placeholder = "password"
        
        FIRAuth.auth()?.addStateDidChangeListener({ auth, user in
            if user != nil {
                _ = self.navigationController?.popViewController(animated: true)
            }
        })
    }
    
    @IBAction func loginButtonPressed() {
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: TimeInterval(0.7), animations: {
            textField.selected()
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: TimeInterval(0.7), animations: {
            textField.deselected()
        })
    }
}
