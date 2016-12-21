//
//  AppDelegate.swift
//  TicTacToe
//
//  Created by Colby Gatte on 12/20/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()
        
        DB.baseRef = FIRDatabase.database().reference()
        DB.usersRef = DB.baseRef.child("users").ref
        DB.gamesRef = DB.baseRef.child("games").ref
        
        App.setupColors()
        
        return true
    }
}

