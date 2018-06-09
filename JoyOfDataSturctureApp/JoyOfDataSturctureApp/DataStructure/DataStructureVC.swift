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
    let lightMaxFont: UIFont = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.light)
    let heavyMaxFont: UIFont = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
    let lightFont: UIFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.light)
    let regularFont: UIFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
    let boldFont: UIFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
    let heavyFont: UIFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.heavy)
    var size: CGSize!
    var width: CGFloat!
    var height: CGFloat!
    var contentWidth: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor;
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
        
        let paragraph = NSMutableParagraphStyle.init()
        paragraph.lineSpacing = 8
        
        var totalHeight: CGFloat!
        
        scrollView = UIScrollView.init(frame: self.view.bounds)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = true
        scrollView.alwaysBounceVertical = true
        self.view.addSubview(scrollView)
        
        //数据结构概述
        let titleAttr = NSMutableAttributedString.init(string:
        """
        数据结构：
            一门研究非数值计算的程序设计问题中的操作对象，以及它们之间的关系和操作等相关问题的科学
        """)
        titleAttr.convinceAddAttributes(font: lightFont, color: textGray, kern: 1, paragraph: paragraph, range: NSMakeRange(0, titleAttr.length))
        titleAttr.attributesWithRanges(attributes: [NSAttributedStringKey.font: heavyMaxFont, NSAttributedStringKey.foregroundColor: textBlack], ranges: [NSMakeRange(0, 5)])
        
        let titleLabel = self.createAttributedLabel(frame: CGRect.init(x: padding, y: padding, width: contentWidth, height: 0), attributedStr: titleAttr)
        scrollView.addSubview(titleLabel)
        
        totalHeight = titleLabel.frame.maxY
        
        let introductAttr = NSMutableAttributedString(string: "基本概念和术语")
        introductAttr.addAttributes([NSAttributedStringKey.font: heavyMaxFont, NSAttributedStringKey.foregroundColor: textBlack, NSAttributedStringKey.kern: 1], range: NSMakeRange(0, introductAttr.length))
        let introductLabel = self.createAttributedLabel(frame: CGRect.init(x: padding, y: totalHeight+padding*2, width: contentWidth, height: 0), attributedStr: introductAttr)
        introductLabel.textAlignment = .center
        scrollView.addSubview(introductLabel)
        totalHeight = introductLabel.frame.maxY
        
        //图像
        let structureImage = UIImage(named: "DataStructure")
        let structureImageSize = structureImage?.size
        let structureRatio = (structureImageSize?.height)!/(structureImageSize?.width)!
        let structureImageView = UIImageView(frame: CGRect(x: padding, y: totalHeight+space, width: contentWidth, height: contentWidth*structureRatio))
        structureImageView.image = structureImage
        structureImageView.contentMode = .scaleToFill
        scrollView.addSubview(structureImageView)
        totalHeight = structureImageView.frame.maxY
        
        //数据
        let dataTitleAttr = NSMutableAttributedString(string: """
        数据：
            是描述客观事物的符号，是计算机中可以操作的对象，是能被计算机识别，并输入给计算机处理的符号集合
        """)
        dataTitleAttr.convinceAddAttributes(font: lightFont, color: textBlack, kern: 1, paragraph: paragraph, range: NSMakeRange(0, dataTitleAttr.length))
        dataTitleAttr.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSMakeRange(0, 3))
        let dataTitle = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: dataTitleAttr)
        scrollView.addSubview(dataTitle)
        totalHeight = dataTitle.frame.maxY
        
        //特征
        let dataFeatureAttr = NSMutableAttributedString(string: "—>可以输入到计算机中")
        dataFeatureAttr.convinceAddAttributes(font: boldFont, color: textGray, kern: 1, paragraph: paragraph, range: NSMakeRange(0, dataFeatureAttr.length))
        let dataFeature = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+space, width: contentWidth, height: 0), attributedStr: dataFeatureAttr)
        scrollView.addSubview(dataFeature)
        totalHeight = dataFeature.frame.maxY
        
        let dataFeatureAttr2 = NSMutableAttributedString(string: "—>能被计算机程序处理")
        dataFeatureAttr2.convinceAddAttributes(font: boldFont, color: textGray, kern: 1, paragraph: paragraph, range: NSMakeRange(0, dataFeatureAttr2.length))
        let dataFeature2 = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight, width: contentWidth, height: 0), attributedStr: dataFeatureAttr2)
        scrollView.addSubview(dataFeature2)
        totalHeight = dataFeature2.frame.maxY
        
        let dateMetaAttr = NSMutableAttributedString(string: """
        数据元素：
            是组成数据的，有一定意义的基本单位，在计算机中通常作为整体处理，也被称为记录。
        """)
        dateMetaAttr.convinceAddAttributes(font: lightFont, color: textBlack, kern: 1, paragraph: paragraph, range: NSMakeRange(0, dateMetaAttr.length))
        dateMetaAttr.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSMakeRange(0, 5))
        let dataMeta = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: dateMetaAttr)
        scrollView.addSubview(dataMeta)
        totalHeight = dataMeta.frame.maxY
        
        let dataItemAttr = NSMutableAttributedString(string:
            """
            数据项：
                一个数据元素可以有若干个数据项组成（数据项是数据不可分割的最小单位）。
            """)
        dataItemAttr.convinceAddAttributes(font: lightFont, color: textBlack, kern: 1, paragraph: paragraph, range: NSMakeRange(0, dataItemAttr.length))
        dataItemAttr.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSMakeRange(0, 4))
        let dataItem = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: dataItemAttr)
        scrollView.addSubview(dataItem)
        totalHeight = dataItem.frame.maxY
        
        let dataObjectAttr = NSMutableAttributedString(string:
            """
            数据对象：
                是性质相同的数据元素的集合，是数据的子集。
            """)
        dataObjectAttr.convinceAddAttributes(font: lightFont, color: textBlack, kern: 1, paragraph: paragraph, range: NSMakeRange(0, dataObjectAttr.length))
        dataObjectAttr.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSMakeRange(0, 5))
        let dataObject = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: dataObjectAttr)
        scrollView.addSubview(dataObject)
        totalHeight = dataObject.frame.maxY
        
        let conclusionAttr = NSMutableAttributedString(string:
            """
            总结：
                数据结构是互相之间存在一种或多种特定关系的数据元素的集合。
            """)
        conclusionAttr.convinceAddAttributes(font: lightFont, color: textBlack, kern: 1, paragraph: paragraph, range: NSMakeRange(0, conclusionAttr.length))
        conclusionAttr.addAttributes([NSAttributedStringKey.font: heavyMaxFont], range: NSMakeRange(0, 3))
        let conclusion = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: conclusionAttr)
        scrollView.addSubview(conclusion)
        totalHeight = conclusion.frame.maxY
        
        let structLabelAttr = NSMutableAttributedString(string: "逻辑结构与物理结构")
        structLabelAttr.addAttributes([NSAttributedStringKey.font: heavyMaxFont, NSAttributedStringKey.foregroundColor: textBlack, NSAttributedStringKey.kern: 1], range: NSMakeRange(0, structLabelAttr.length))
        let structLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding*2, width: contentWidth, height: 0), attributedStr: structLabelAttr)
        structLabel.textAlignment = .center
        scrollView.addSubview(structLabel)
        totalHeight = structLabel.frame.maxY
        
        let image = UIImage(named: "Structure")
        let ratio = (image?.size.height)!/(image?.size.width)!
        let imageView = UIImageView(frame: CGRect(x: padding, y: totalHeight+margin, width: contentWidth, height: ratio*contentWidth))
        imageView.image = image
        imageView.contentMode = .scaleToFill
        scrollView.addSubview(imageView)
        totalHeight = imageView.frame.maxY
        
        let logicStructLabelAttr = NSMutableAttributedString(string:
            """
            逻辑结构：
                是指数据对象中的数据元素之间的相互关系。
            """)
        logicStructLabelAttr.convinceAddAttributes(font: lightFont, color: textBlack, kern: 1, paragraph: paragraph, range: NSMakeRange(0, logicStructLabelAttr.length))
        logicStructLabelAttr.attributesWithRanges(attributes: [NSAttributedStringKey.font: heavyMaxFont], ranges: [NSMakeRange(0, 5)])
        let logicStructLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: logicStructLabelAttr)
        scrollView.addSubview(logicStructLabel)
        totalHeight = logicStructLabel.frame.maxY
        
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
