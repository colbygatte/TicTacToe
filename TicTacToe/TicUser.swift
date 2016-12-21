//
//  TicUser.swift
//  TicTacToe
//
//  Created by Colby Gatte on 12/21/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import Firebase

class TicUser: NSObject {
    var uid: String!
    var username: String!
    var email: String!
    
    init(snapshot: FIRDataSnapshot) {
        uid = snapshot.key
        
        let values = snapshot.value as! [String: String]
        username = values["username"]
        email = values["email"]
    }
    
    func toFirebaseObject() -> Any {
        let object = [
            "email": email,
            "username": username
        ]
        
        return object
    }
}
