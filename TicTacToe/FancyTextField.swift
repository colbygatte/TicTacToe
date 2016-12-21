//
//  FancyTextField.swift
//  TicTacToe
//
//  Created by Colby Gatte on 12/20/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit

class FancyTextField: UIView {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var fancyView: UIView!
    
    var placeholderText: String? {
        didSet {
            textField.attributedPlaceholder = NSAttributedString(string: placeholderText!, attributes: [NSForegroundColorAttributeName: UIColor.white])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        Bundle.main.loadNibNamed("FancyTextField", owner: self, options: nil)
        addSubview(fancyView)
        
        textField.tintColor = UIColor.lightGray
        textField.textColor = UIColor.gray
    }
}
