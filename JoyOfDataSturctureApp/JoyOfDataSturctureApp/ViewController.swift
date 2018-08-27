//
//  ViewController.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/5/27.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    let structData: [String] = ["定义", "线性表", "栈与队列", "串", "树", "图"];
    let algorithmData: [String] = ["定义", "查找", "排序"]
    let titles: [String] = ["数据结构", "算法"];

    var tableView: UITableView = {
        let table = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "数据结构与算法"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy), NSAttributedStringKey.foregroundColor: textBlack]
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.tableView)
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func createController(indexPath: IndexPath) -> UIViewController {
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            switch row {
            case 0:
                return DataStructureVC()
            case 1:
                return LinearTableVC()
            case 2:
                return UIViewController()
            case 3:
                return UIViewController()
            case 4:
                return UIViewController()
            default:
                return UIViewController()
            }
        } else {
            switch row {
            case 0:
                return AlgorithmVC()
            case 1:
                return UIViewController()
            case 2:
                return UIViewController()
            default:
                return UIViewController();
            }
        }
    }
    
    //Delegate
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.navigationController?.viewControllers.count == 1 {
            return false
        }
        return true
    }

    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return structData.count
        } else {
            return algorithmData.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if (cell == nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.backgroundColor = UIColor.white
        if indexPath.section == 0 {
            cell?.textLabel?.text = structData[indexPath.row]
        } else {
            cell?.textLabel?.text = algorithmData[indexPath.row]
        }
        return cell!
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = [tableView .deselectRow(at: indexPath, animated: true)];
        let section = indexPath.section
        let row = indexPath.row
        var title: String
        let controller = self.createController(indexPath: indexPath)
        if section == 0 {
            title = structData[row]
        } else {
            title = algorithmData[row]
        }
        
        controller.navigationItem.title = title
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

