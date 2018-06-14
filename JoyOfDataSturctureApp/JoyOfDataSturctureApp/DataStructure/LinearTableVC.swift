//
//  LinearTableVC.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/6/13.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class LinearTableVC: UIViewController, Sequence {
    let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = textBlack
        textField.textAlignment = .left
        textField.placeholder = "请输入账号"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let textField2: UITextField = {
        let textField = UITextField()
        textField.textColor = textBlack
        textField.textAlignment = .left
        textField.placeholder = "请输入密码"
        textField.borderStyle = .roundedRect
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        
        self.view.addSubview(textField)
        self.view.addSubview(textField2)        
    }
}
