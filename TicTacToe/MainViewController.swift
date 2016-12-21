 //
//  MainViewController.swift
//  TicTacToe
//
//  Created by Colby Gatte on 12/20/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.dataSource = self
        tableView.separatorStyle = .none
        title = "Tic Tac Toe"
        
        FIRAuth.auth()?.addStateDidChangeListener({ auth, user in
            if user == nil {
                let sb = UIStoryboard(name: "Login", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "LoginNavigationController")
                self.present(vc, animated: true, completion: nil)
            } else {
                App.loggedInUid = user!.uid
                self.loginSuccesful()
            }
        })
    }
    
    func loginSuccesful() {
        if App.loggedInUid != nil {
            DB.get(user: App.loggedInUid!, completion: { snap in
                let user = TicUser(snapshot: snap)
                App.loggedInUser = user
                self.userDataLoaded()
            })
        } else {
            print("User not logged in")
        }
    }
    
    func userDataLoaded() {
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hi"
        return cell
    }
}
