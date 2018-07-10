//
//  OrderLinearTableController.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/6/27.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit

class OrderLinearTableController: UIViewController {
    var linearTable: ListTable<String>? = nil {
        didSet {
            self.buildLinearLayout()
        }
    }
    let originalY: CGFloat = 100
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let titles = ["创建", "添加", "插入", "删除", "清空"]
        for (index, value) in titles.enumerated() {
            let button = self.createButton(title: value)
            button.tag = index
            let frame = button.frame
            button.frame = CGRect(x: space*CGFloat(index+1)+frame.size.width*CGFloat(index), y: frame.origin.y, width: frame.size.width, height: frame.size.height)
            self.view.addSubview(button)
        }
        
        label.frame = CGRect(x: padding, y: originalY+50, width: contentWidth, height: 40)
        label.font = regularFont
        label.textColor = textBlack
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        self.view.addSubview(label)
    }
    
    func buildLinearLayout() {
        var content: String = ""
        if linearTable != nil {
            if (linearTable?.length())! > 0 {
                let length: Int = (linearTable?.length())!
                for index in 0..<length {
                    let value = linearTable?.getElem(index: index)
                    content.append(value!)
                    if index != length-1 {
                        content.append(" -> ")
                    }
                }
            }
        }

        label.text = content
    }
    
        
    @objc func tapButton(button: UIButton) {
        self.showAlert(title: (button.titleLabel?.text)!, index: button.tag)
    }
    
    func showAlert(title: String, index: Int) {
        let alert = UIAlertController.init(title: title, message: nil, preferredStyle: .alert)
        let confirm = UIAlertAction.init(title: "确定", style: .default) { (action: UIAlertAction) in
            let inputField = alert.textFields?.first
            let indexField = alert.textFields?.last
            switch index {
                case 0:
                    if let textField = inputField {
                        self.linearTable = ListTable<String>()
                        if (textField.text?.count)! > 0 {
                            self.linearTable?.append(item: (textField.text)!)
                        }
                    }
                case 1:
                    if let textField = inputField, (textField.text?.count)! > 0 {
                        self.linearTable?.append(item: (textField.text)!)
                    }
                case 2:
                    if let textFieldInput = inputField, (textFieldInput.text?.count)! > 0, let textFieldIndex = indexField, (textFieldIndex.text?.count)! > 0 {
                        let insertIndex = Int(textFieldIndex.text!)
                        if insertIndex! >= 0, insertIndex! <= (self.linearTable?.length())!{
                            self.linearTable?.insert(item: textFieldInput.text!, index: insertIndex!)
                        }
                    }
                case 3:
                    if let textFieldIndex = indexField, (textFieldIndex.text?.count)! > 0 {
                        let deleteIndex = Int(textFieldIndex.text!)
                        if deleteIndex! >= 0, deleteIndex! < (self.linearTable?.length())!{
                            _ = self.linearTable?.delete(index: deleteIndex!)
                        }
                }
                case 4:
                    if self.linearTable != nil {
                        self.linearTable?.clearList()
                    }
                default:
                    print("HaHa")
            }
        }
        let cancel = UIAlertAction.init(title: "取消", style: .cancel) { (cancel: UIAlertAction) in
        }
        alert.addAction(confirm)
        alert.addAction(cancel)
        if linearTable != nil {
            switch index {
            case 0:
                alert.message = "你已经创建了列表"
            case 1, 3:
                alert.addTextField { (textField: UITextField) in
                    
                }
            case 2:
                alert.addTextField { (inputField: UITextField) in
                    
                }
                alert.addTextField { (indexField: UITextField) in
                    
                }
            case 4:
                alert.message = "确定需要清空该列表？"
            default:
                print("HeiHei")
            }
        } else {
            switch index {
            case 0:
                alert.addTextField { (textField: UITextField) in
                    
                }
            default:
                alert.message = "你需要创建一个列表"
            }
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    private func createButton(title: String) -> UIButton {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.white
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 4
        button.layer.borderColor = textBlack.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = regularFont
        button.setTitle(title, for: .normal)
        button.setTitleColor(textBlack, for: .normal)
        button.addTarget(self, action: #selector(OrderLinearTableController.tapButton(button:)), for: .touchUpInside)
        button.sizeToFit()
        let size = CGSize(width: button.frame.size.width+padding*2, height: button.frame.size.height)
        button.frame = CGRect(x: 0, y: originalY, width: size.width, height: size.height)
        return button
    }
}
