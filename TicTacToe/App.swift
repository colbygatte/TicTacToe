//
//  App.swift
//  TicTacToe
//
//  Created by Colby Gatte on 12/20/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit

class App: NSObject {
    static var loggedInUid: String?
    static var loggedInUser: TicUser!
    
    struct Colors {
        static var greenLight = UIColor.hexString(hex: "9ECAA5")
        static var greenDark = UIColor.hexString(hex: "73A07A")
        static var redLight = UIColor.hexString(hex: "BB9898")
        static var redDark = UIColor.hexString(hex: "896363")
        static var grayLight = UIColor.hexString(hex: "C2C2C2")
        static var grayDark = UIColor.hexString(hex: "6B6B6B")
    }
    
    static func setupColors() {
        
        
        UIApplication.shared.delegate?.window??.tintColor = App.Colors.grayDark
        
        UINavigationBar.appearance().barTintColor = App.Colors.redDark
        
        UITextField.appearance().backgroundColor = App.Colors.grayDark
        
        UITableView.appearance().separatorStyle = .none
    }
}

extension UIViewController {
    func setupView() {
        view.backgroundColor = App.Colors.grayLight
    }
}

extension UITextField {
    func selected() {
        backgroundColor = App.Colors.redLight
    }
    
    func deselected() {
        backgroundColor  = App.Colors.grayDark
    }
}

// below from http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
extension UIColor {
    static func hexString(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
