//
//  DataStructureVC.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/5/27.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit

class DataStructureVC: UIViewController {
    
    var scrollView: UIScrollView!
    let padding:CGFloat = 15
    var size: CGSize!
    var width: CGFloat!
    var height: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.navigationItem.title = "数据结构概述"
        size = self.view.frame.size
        width = size.width
        height = size.height
        
        var totalHeight: CGFloat!
        
        scrollView = UIScrollView.init(frame: self.view.bounds)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = true
        scrollView.alwaysBounceVertical = true
        self.view.addSubview(scrollView)
        
        //数据结构概述
        let titleLabel = self.createLabel(frame: CGRect.init(x: padding, y: padding, width: width-padding*2, height: 0), text: "数据结构：一门研究非数值计算的程序设计问题中的操作对象，以及它们之间的关系和操作等相关问题的科学", textAlignment: .left)
        scrollView.addSubview(titleLabel)
        
        totalHeight = titleLabel.frame.maxY
        
        let introductLabel = self.createLabel(frame: CGRect.init(x: padding, y: totalHeight+padding, width: width-padding*2, height: 0), text: "基本概念和术语", textAlignment: .center)
        scrollView.addSubview(introductLabel)
        
        totalHeight = introductLabel.frame.maxY
        
        //图像
        let margin: CGFloat = 5
        let dataWidth: CGFloat = width-padding*2
        let dataLabel = self.createDataLabel(frame: CGRect.init(x: padding, y: totalHeight+padding, width: dataWidth, height: 0), text: "数据", font: 20)
        scrollView.addSubview(dataLabel)
        totalHeight = dataLabel.frame.maxY
        
        let objectWidth:CGFloat = (dataWidth-margin)/2
        var currentHeight: CGFloat = 0.0;
        for index in 0..<2{
            let frame = CGRect(x: padding + (margin+objectWidth)*CGFloat(index), y: totalHeight+margin, width: objectWidth, height: 0)
            let objectLabel = self.createDataLabel(frame: frame, text: "数据对象", font: 16)
            scrollView.addSubview(objectLabel)
            currentHeight = objectLabel.frame.maxY
        }
        totalHeight = currentHeight;
        
        let metaWidth = (objectWidth-margin)/2
        for index in 0..<4 {
            let metaLabel = self.createDataLabel(frame: CGRect.init(x: padding+(margin+metaWidth)*CGFloat(index), y: totalHeight+margin, width: metaWidth, height: 0), text: "数据元素", font: 14)
            scrollView.addSubview(metaLabel)
            currentHeight = metaLabel.frame.maxY
        }
        totalHeight = currentHeight;
        
        let itemWidth = (metaWidth-margin)/2
        for index in 0..<8 {
            let itemLabel = self.createDataLabel(frame: CGRect(x: padding+(margin+itemWidth)*CGFloat(index), y: totalHeight+margin, width: itemWidth, height: 0), text: "数据项", font: 10)
            scrollView.addSubview(itemLabel)
            currentHeight = itemLabel.frame.maxY
        }
        totalHeight = currentHeight;
    }
    
    // Private methods
    private func createLabel(frame: CGRect, text: String, textAlignment: NSTextAlignment) -> UILabel {
        let originalX = frame.origin.x
        let originalY = frame.origin.y
        let width = frame.width
        let label = UILabel.init(frame: frame)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        label.text = text;
        label.sizeToFit()
        label.frame = CGRect.init(x: originalX, y: originalY, width: width, height: label.frame.size.height)
        return label
    }
    
    private func createDataLabel(frame: CGRect, text: String, font: CGFloat) -> UILabel {
        let label = self.createLabel(frame: frame, text: text, textAlignment: .center)
        label.frame = CGRect.init(origin: label.frame.origin, size: CGSize(width: label.frame.width, height: 40))
        label.font = UIFont.systemFont(ofSize: font)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.init(red: 103.0/255.0, green: 192.0/255.0, blue: 1.0, alpha: 1.0)
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        return label
    }
}
