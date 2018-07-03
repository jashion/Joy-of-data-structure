//
//  LinearTableVC.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/6/13.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit

class LinearTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView {
        get {
            let table = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
            table.dataSource = self
            table.delegate = self
            return table
        }
    }
    let titles: [String] = ["线性表定义", "线性表的顺序储存结构", "线性表的链式储存结构", "单链表", "静态链表", "循环链表"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        self.view.addSubview(tableView)
    }
    
    func createController(indexPath: IndexPath) -> UIViewController {
        let row = indexPath.row
        switch row {
        case 0:
            return LinearTableDefineController()
        case 1:
            return OrderLinearTableController()
        case 2:
            return LinkLinearTableController()
        case 3:
            return SingleLinearTableController()
        case 4:
            return StaticLinkLinearTableController()
        case 5:
            return CycleLinkLinearTableController()
        default:
            return UIViewController()
        }
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if (cell == nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.backgroundColor = UIColor.white
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(self.createController(indexPath: indexPath), animated: true)
    }
}
