//
//  RegisterViewController.swift
//  TicTacToe
//
//  Created by Colby Gatte on 12/20/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        title = "Registration"
        
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.placeholder = "email"
        usernameTextField.placeholder = "username"
        passwordTextField.placeholder = "password"
    }
    
    @IBAction func registerButtonPressed() {
        if let username = usernameTextField.text, let password = passwordTextField.text, let email = emailTextField.text {
            DB.createUser(username: username, email: email, password: password, completion: { user, error in
                if error == nil {
                    _ = self.navigationController?.popViewController(animated: true)
                } else {
                    self.errorLabel.text = error.debugDescription
                }
            })
        } else {
            errorLabel.text = "Fill out those fields!"
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
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
