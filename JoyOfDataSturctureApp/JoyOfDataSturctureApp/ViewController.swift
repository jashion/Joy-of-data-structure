//
//  ViewController.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/5/27.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    let structData: [String] = ["数据结构概述", "线性表", "栈与队列", "串", "树", "图"];
    let algorithmData: [String] = ["算法概述", "查找", "排序"]
    let titles: [String] = ["数据结构", "算法"];

    var tableView: UITableView {
        get {
            let table = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
            table.dataSource = self
            table.delegate = self
            return table
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "数据结构与算法"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy), NSAttributedStringKey.foregroundColor: textBlack]
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.tableView)
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
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
        if section == 0, row == 0 {
            let dataStructureVC = DataStructureVC.init()
            self.navigationController?.pushViewController(dataStructureVC, animated: true)
            return;
        }
        
        if section == 1,row == 0 {
            let algorithmVC = AlgorithmVC.init()
            self.navigationController?.pushViewController(algorithmVC, animated: true)
        }
    }
}

