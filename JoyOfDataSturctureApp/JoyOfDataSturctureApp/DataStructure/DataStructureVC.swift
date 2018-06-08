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
    let margin:CGFloat = 5
    let space:CGFloat = 10
    let lightMaxFont: UIFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.light)
    let heavyMaxFont: UIFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
    let lightFont: UIFont = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
    let heavyFont: UIFont = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.heavy)
    var size: CGSize!
    var width: CGFloat!
    var height: CGFloat!
    var contentWidth: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.navigationItem.title = "数据结构概述"

        self.navigationItem.hidesBackButton = true
        let backButton = UIButton(type: .custom)
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        backButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10)
        backButton.addTarget(self, action: #selector(handleClickEvent), for: .touchUpInside)
        let backBarItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarItem
        
        size = self.view.frame.size
        width = size.width
        height = size.height
        contentWidth = width-padding*2
        
        var totalHeight: CGFloat!
        
        scrollView = UIScrollView.init(frame: self.view.bounds)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = true
        scrollView.alwaysBounceVertical = true
        self.view.addSubview(scrollView)
        
        //数据结构概述
        let attributedStr = NSMutableAttributedString.init(string:
        """
        数据结构：
            一门研究非数值计算的程序设计问题中的操作对象，以及它们之间的关系和操作等相关问题的科学
        """)
        let paragraph = NSMutableParagraphStyle.init()
        paragraph.lineSpacing = 4
        attributedStr.addAttributes([NSAttributedStringKey.font: lightFont, NSAttributedStringKey.foregroundColor: textBlack, NSAttributedStringKey.paragraphStyle: paragraph], range: NSRange(location: 0, length: attributedStr.length))
        attributedStr.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSRange(location: 0, length: 5))
        attributedStr.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSRange(location: 14, length: 3))
        attributedStr.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSRange(location: 28, length: 4))
        attributedStr.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSRange(location: 40, length: attributedStr.length-40))
        let titleLabel = self.createAttributedLabel(frame: CGRect.init(x: padding, y: padding, width: contentWidth, height: 0), attributedStr: attributedStr)
        scrollView.addSubview(titleLabel)
        
        totalHeight = titleLabel.frame.maxY
        
        let introductLabel = self.createLabel(frame: CGRect.init(x: padding, y: totalHeight+padding*2, width: contentWidth, height: 0), text: "基本概念和术语", font: heavyMaxFont, textAlignment: .center)
        scrollView.addSubview(introductLabel)
        
        totalHeight = introductLabel.frame.maxY
        
        //图像
        let margin: CGFloat = 5
        let dataWidth: CGFloat = contentWidth
        let dataLabel = self.createDataLabel(frame: CGRect.init(x: padding, y: totalHeight+space, width: dataWidth, height: 0), text: "数据", font: 20)
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
        
        //数据
        let attributedStr2 = NSMutableAttributedString(string: """
        数据：
            是描述客观事物的符号，是计算机中可以操作的对象，是能被计算机识别，并输入给计算机处理的符号集合
        """)
        let paragraph2 = NSMutableParagraphStyle.init()
        paragraph2.lineSpacing = 4
        attributedStr2.addAttributes([NSAttributedStringKey.font: lightFont, NSAttributedStringKey.foregroundColor: textBlack, NSAttributedStringKey.paragraphStyle: paragraph2], range: NSRange(location: 0, length: attributedStr2.length))
        attributedStr2.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSRange(location: 0, length: 3))
        attributedStr2.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSRange(location: 9, length: 9))
        let dataTitle = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: attributedStr2)
        scrollView.addSubview(dataTitle)
        totalHeight = dataTitle.frame.maxY
        
        //特征
        let dataFeature = self.createLabel(frame: CGRect(x: padding, y: totalHeight+margin, width: contentWidth, height: 0), text: "——>可以输入到计算机中", font: heavyFont, textAlignment: .left)
        scrollView.addSubview(dataFeature)
        totalHeight = dataFeature.frame.maxY
        
        let dataFeature2 = self.createLabel(frame: CGRect(x: padding, y: totalHeight+margin, width: contentWidth, height: 0), text: "——>能被计算机程序处理", font: heavyFont, textAlignment: .left)
        scrollView.addSubview(dataFeature2)
        totalHeight = dataFeature2.frame.maxY
        
        let attributedStr3 = NSMutableAttributedString(string: """
        数据元素：
            是组成数据的，有一定意义的基本单位，在计算机中通常作为整体处理，也被称为记录。
        """)
        let paragraph3 = NSMutableParagraphStyle.init()
        paragraph3.lineSpacing = 4
        attributedStr3.addAttributes([NSAttributedStringKey.font: lightFont, NSAttributedStringKey.foregroundColor: textBlack, NSAttributedStringKey.paragraphStyle: paragraph3], range: NSRange(location: 0, length: attributedStr3.length))
        attributedStr3.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSRange(location: 0, length: 5))
        attributedStr3.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSRange(location: 17, length: 10))
        let dataMeta = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: attributedStr3)
        scrollView.addSubview(dataMeta)
        totalHeight = dataMeta.frame.maxY
        
        let attributedStr4 = NSMutableAttributedString(string:
            """
            数据项：
                一个数据元素可以有若干个数据项组成（数据项是数据不可分割的最小单位）。
            """)
        let paragraph4 = NSMutableParagraphStyle.init()
        paragraph4.lineSpacing = 4
        attributedStr4.addAttributes([NSAttributedStringKey.font: lightFont, NSAttributedStringKey.foregroundColor: textBlack, NSAttributedStringKey.paragraphStyle: paragraph4], range: NSRange(location: 0, length: attributedStr4.length))
        attributedStr4.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSRange(location: 0, length: 4))
        attributedStr4.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSRange(location: attributedStr4.length-11, length: 9))
        let dataItem = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: attributedStr4)
        scrollView.addSubview(dataItem)
        totalHeight = dataItem.frame.maxY
        
        let attributedStr5 = NSMutableAttributedString(string:
            """
            数据对象：
                是性质相同的数据元素的集合，是数据的子集。
            """)
        let paragraph5 = NSMutableParagraphStyle.init()
        paragraph5.lineSpacing = 4
        attributedStr5.addAttributes([NSAttributedStringKey.font: lightFont, NSAttributedStringKey.foregroundColor: textBlack, NSAttributedStringKey.paragraphStyle: paragraph5], range: NSRange(location: 0, length: attributedStr5.length))
        attributedStr5.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSRange(location: 0, length: 5))
        let dataObject = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: attributedStr5)
        scrollView.addSubview(dataObject)
        totalHeight = dataObject.frame.maxY
        
        let attributedStr6 = NSMutableAttributedString(string:
            """
            总结：
                数据结构是互相之间存在一种或多种特定关系的数据元素的集合。
            """)
        let paragraph6 = NSMutableParagraphStyle.init()
        paragraph6.lineSpacing = 4
        attributedStr6.addAttributes([NSAttributedStringKey.font: lightFont, NSAttributedStringKey.foregroundColor: textBlack, NSAttributedStringKey.paragraphStyle: paragraph6], range: NSRange(location: 0, length: attributedStr6.length))
        attributedStr6.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSRange(location: 0, length: 3))
        attributedStr6.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSRange(location: 8, length: 4))
        attributedStr6.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSRange(location: attributedStr6.length-13, length: 12))
        let conclusion = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: attributedStr6)
        scrollView.addSubview(conclusion)
        totalHeight = conclusion.frame.maxY
        
        totalHeight = totalHeight + padding
        scrollView.contentSize = CGSize(width: width, height: totalHeight)
    }
    
    //Event response
    @objc func handleClickEvent(button: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Private methods
    private func createLabel(frame: CGRect, text: String, font: UIFont, textAlignment: NSTextAlignment) -> UILabel {
        let originalX = frame.origin.x
        let originalY = frame.origin.y
        let width = frame.width
        let label = UILabel.init(frame: frame)
        label.font = font
        label.textColor = textBlack
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        label.text = text;
        label.sizeToFit()
        label.frame = CGRect.init(x: originalX, y: originalY, width: width, height: label.frame.size.height)
        return label
    }
    
    private func createAttributedLabel(frame: CGRect, attributedStr: NSMutableAttributedString) -> UILabel {
        let originalX = frame.origin.x
        let originalY = frame.origin.y
        let width = frame.width
        let label = UILabel.init(frame: frame)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.attributedText = attributedStr;
        label.sizeToFit()
        label.frame = CGRect.init(x: originalX, y: originalY, width: width, height: label.frame.size.height)
        return label
    }
    
    private func createDataLabel(frame: CGRect, text: String, font: CGFloat) -> UILabel {
        let label = self.createLabel(frame: frame, text: text, font: UIFont.systemFont(ofSize: font), textAlignment: .center)
        label.frame = CGRect.init(origin: label.frame.origin, size: CGSize(width: label.frame.width, height: 40))
        label.font = UIFont.systemFont(ofSize: font, weight: UIFont.Weight.light)
        label.textColor = textWhite
        label.backgroundColor = textGreen
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        return label
    }
}
