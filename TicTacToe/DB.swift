//
//  DB.swift
//  TicTacToe
//
//  Created by Colby Gatte on 12/20/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import Firebase

class DB: NSObject {
    static var baseRef: FIRDatabaseReference!
    static var usersRef: FIRDatabaseReference!
    static var gamesRef: FIRDatabaseReference!
    
    static func signIn(username: String, password: String, completion: @escaping FirebaseAuth.FIRAuthResultCallback) {
        FIRAuth.auth()?.signIn(withEmail: username, password: password, completion: completion)
    }
    
    static func signOut(completion: (()->())? = nil) {
        try! FIRAuth.auth()?.signOut() // @@@@ handle the throw better
        
        if completion != nil {
            completion!()
        }
    }
    // this logs in user automatically (firebase does when creating a user)
    static func createUser(username: String, email: String, password: String, completion: FIRAuthResultCallback?) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { user, error in
            if error == nil && user != nil {
                let userObject = [
                    "username": username
                ]
                
                DB.baseRef.child("users").child(user!.uid).setValue(userObject)
            }
            
            if completion != nil {
                completion!(user, error)
            }
        })
    }
    
    static func get(user: String, completion: @escaping (FIRDataSnapshot)->()) {
        DB.usersRef.child(user).observeSingleEvent(of: .value, with: { snap in
            completion(snap)
        })
    }
    
    static func getGamesFor(user: String) {
        DB.gamesRef.child(user).observeSingleEvent(of: .value, with: { snap in
            
        })
    }
}
