//
//  LoginViewController.swift
//  TicTacToe
//
//  Created by Colby Gatte on 12/20/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: FancyTextField!
    @IBOutlet weak var passwordTextField: FancyTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.placeholderText = "Fancy is my name"
    }
    
    @IBAction func loginButtonPressed() {
        print(emailTextField.textField.text!)
    }
}
