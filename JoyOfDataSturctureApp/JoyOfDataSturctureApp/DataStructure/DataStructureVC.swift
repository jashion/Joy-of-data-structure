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
    let lightFont: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
    let regularFont: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
    let boldFont: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
    let heavyFont: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.heavy)
    var size: CGSize!
    var width: CGFloat!
    var height: CGFloat!
    var contentWidth: CGFloat!
    var totalHeight: CGFloat!

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
        self.setCommonAttrs(attr: titleAttr, boldRange: NSMakeRange(0, 5))
        let titleLabel = self.createAttributedLabel(frame: CGRect.init(x: padding, y: padding, width: contentWidth, height: 0), attributedStr: titleAttr)
        self.scrollViewAddSubView(subView: titleLabel)
        
        let introductAttr = NSMutableAttributedString(string: "基本概念和术语")
        self.setCommonAttrs(attr: introductAttr, boldRange: NSMakeRange(0, introductAttr.length))
        let introductLabel = self.createAttributedLabel(frame: CGRect.init(x: padding, y: totalHeight+padding*2, width: contentWidth, height: 0), attributedStr: introductAttr)
        introductLabel.textAlignment = .center
        self.scrollViewAddSubView(subView: introductLabel)

        //图像
        let dataImage = UIImage(named: "DataStructure")
        self.scrollViewAddImage(image: dataImage)

        //数据
        let dataTitleAttr = NSMutableAttributedString(string: """
        数据：
            是描述客观事物的符号，是计算机中可以操作的对象，是能被计算机识别，并输入给计算机处理的符号集合
        """)
        self.setCommonAttrs(attr: dataTitleAttr, boldRange: NSMakeRange(0, 3))
        let dataTitle = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: dataTitleAttr)
        self.scrollViewAddSubView(subView: dataTitle)

        //特征
        let dataFeatureAttr = NSMutableAttributedString(string: "—>可以输入到计算机中")
        self.setCommonAttrs(attr: dataFeatureAttr, boldRange: NSMakeRange(0, 0))
        dataFeatureAttr.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSMakeRange(0, dataFeatureAttr.length))
        let dataFeature = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+space, width: contentWidth, height: 0), attributedStr: dataFeatureAttr)
        self.scrollViewAddSubView(subView: dataFeature)

        let dataFeatureAttr2 = NSMutableAttributedString(string: "—>能被计算机程序处理")
        self.setCommonAttrs(attr: dataFeatureAttr2, boldRange: NSMakeRange(0, 0))
        dataFeatureAttr2.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSMakeRange(0, dataFeatureAttr2.length))
        let dataFeature2 = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight, width: contentWidth, height: 0), attributedStr: dataFeatureAttr2)
        self.scrollViewAddSubView(subView: dataFeature2)

        let dateMetaAttr = NSMutableAttributedString(string: """
        数据元素：
            是组成数据的，有一定意义的基本单位，在计算机中通常作为整体处理，也被称为记录。
        """)
        self.setCommonAttrs(attr: dateMetaAttr, boldRange: NSMakeRange(0, 5))
        let dataMeta = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: dateMetaAttr)
        self.scrollViewAddSubView(subView: dataMeta)

        let dataItemAttr = NSMutableAttributedString(string:
            """
            数据项：
                一个数据元素可以有若干个数据项组成（数据项是数据不可分割的最小单位）。
            """)
        self.setCommonAttrs(attr: dataItemAttr, boldRange: NSMakeRange(0, 4))
        let dataItem = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: dataItemAttr)
        self.scrollViewAddSubView(subView: dataItem)

        let dataObjectAttr = NSMutableAttributedString(string:
            """
            数据对象：
                是性质相同的数据元素的集合，是数据的子集。
            """)
        self.setCommonAttrs(attr: dataObjectAttr, boldRange: NSMakeRange(0, 5))
        let dataObject = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: dataObjectAttr)
        self.scrollViewAddSubView(subView: dataObject)

        let conclusionAttr = NSMutableAttributedString(string:
            """
            小结：
                数据结构是互相之间存在一种或多种特定关系的数据元素的集合。
            """)
        self.setCommonAttrs(attr: conclusionAttr, boldRange: NSMakeRange(0, 3))
        let conclusion = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: conclusionAttr)
        self.scrollViewAddSubView(subView: conclusion)

        let structLabelAttr = NSMutableAttributedString(string: "逻辑结构与物理结构")
        self.setCommonAttrs(attr: structLabelAttr, boldRange: NSMakeRange(0, structLabelAttr.length))
        let structLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding*2, width: contentWidth, height: 0), attributedStr: structLabelAttr)
        structLabel.textAlignment = .center
        self.scrollViewAddSubView(subView: structLabel)

        let structureImage = UIImage(named: "Structure")
        self.scrollViewAddImage(image: structureImage)

        let logicStructLabelAttr = NSMutableAttributedString(string:
            """
            逻辑结构：
                是指数据对象中的数据元素之间的相互关系。
            """)
        self.setCommonAttrs(attr: logicStructLabelAttr, boldRange: NSMakeRange(0, 5))
        let logicStructLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: logicStructLabelAttr)
        self.scrollViewAddSubView(subView: logicStructLabel)
        
        let setAttr = NSMutableAttributedString(string:
            """
            （1）集合结构：
                集合结构中的数据元素除了同属于一个集合外，它们之间没有任何其他关系。
            """)
        self.setCommonAttrs(attr: setAttr, boldRange: NSMakeRange(0, 0))
        setAttr.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSMakeRange(0, 8))
        let setLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: setAttr)
        self.scrollViewAddSubView(subView: setLabel)
        //draw setStructure image
        self.drawSetStructure()
        
        let linearAttr = NSMutableAttributedString(string:
            """
            （2）线性结构：
                线性结构中的数据元素之间时一对一的关系。
            """)
        self.setCommonAttrs(attr: linearAttr, boldRange: NSMakeRange(0, 0))
        linearAttr.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSMakeRange(0, 8))
        let linearLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: linearAttr)
        self.scrollViewAddSubView(subView: linearLabel)
        
        let linearImage = UIImage(named: "LinearStructure")
        self.scrollViewAddImage(image: linearImage)
        
        let treeAttr = NSMutableAttributedString(string:
            """
            （3）树形结构：
                树形结构中的数据元素之间存在一种一对多的层级关系。
            """)
        self.setCommonAttrs(attr: treeAttr, boldRange: NSMakeRange(0, 0))
        treeAttr.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSMakeRange(0, 8))
        let treeLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: treeAttr)
        self.scrollViewAddSubView(subView: treeLabel)
        
        let treeImage = UIImage(named: "TreeStructure")
        self.scrollViewAddImage(image: treeImage)
        
        let graphicsAttr = NSMutableAttributedString(string:
            """
            （4）图形结构：
                图形结构中的数据元素是多对多的关系。
            """)
        self.setCommonAttrs(attr: graphicsAttr, boldRange: NSMakeRange(0, 0))
        graphicsAttr.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSMakeRange(0, 8))
        let graphicsLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: graphicsAttr)
        self.scrollViewAddSubView(subView: graphicsLabel)
        //draw graphisStruture image
        self.drawGraphisStructure()
        
        let physicsAttr = NSMutableAttributedString(string:
            """
            物理结构：
                是指数据的逻辑结构在计算机中的储存形式。
            """)
        self.setCommonAttrs(attr: physicsAttr, boldRange: NSMakeRange(0, 5))
        let physicsLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: physicsAttr)
        self.scrollViewAddSubView(subView: physicsLabel)
        
        let inOrderAttr = NSMutableAttributedString(string:
            """
            （1）顺序储存结构：
                顺序储存结构，是把数据元素存放在地址连续的储存单元里，其数据间的逻辑关系和物理关系是一致的。
            """)
        self.setCommonAttrs(attr: inOrderAttr, boldRange: NSMakeRange(0, 0))
        inOrderAttr.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSMakeRange(0, 10))
        let inOrderLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: inOrderAttr)
        self.scrollViewAddSubView(subView: inOrderLabel)
        //draw inOrderStructure image
        self.drawInOrderStructure()
        
        let linkAttr = NSMutableAttributedString(string:
            """
            （2）链式储存结构：
                链式储存结构，是把数据元素存放在任意的储存单元里，这组储存单元可以是连续的，也可以是不连续的。
            """)
        self.setCommonAttrs(attr: linkAttr, boldRange: NSMakeRange(0, 0))
        linkAttr.addAttributes([NSAttributedStringKey.font: heavyFont], range: NSMakeRange(0, 10))
        let linkLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: linkAttr)
        self.scrollViewAddSubView(subView: linkLabel)
        //draw linkStructure image
        self.drawLinkStructure()
        
        let structureConclusionAttr = NSMutableAttributedString(string:
            """
            小结：
                逻辑结构是面向问题的，而物理结构就是面向计算机的，其基本的目的就是将数据及逻辑关系储存到计算机的内存中。
            """)
        self.setCommonAttrs(attr: structureConclusionAttr, boldRange: NSMakeRange(0, 3))
        let structureConclusion = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: structureConclusionAttr)
        self.scrollViewAddSubView(subView: structureConclusion)
        
        let abstractAttr = NSMutableAttributedString(string: "抽象数据类型")
        self.setCommonAttrs(attr: abstractAttr, boldRange: NSMakeRange(0, abstractAttr.length))
        let abstractLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding*2, width: contentWidth, height: 0), attributedStr: abstractAttr)
        abstractLabel.textAlignment = .center
        self.scrollViewAddSubView(subView: abstractLabel)
        
        let dataTypeAttr = NSMutableAttributedString(string:
        """
        数据类型：
            是指一组性质相同的值的集合及定义在此集合上的一些操作的总称。
        """)
        self.setCommonAttrs(attr: dataTypeAttr, boldRange: NSMakeRange(0, 5))
        let dataTypeLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: dataTypeAttr)
        self.scrollViewAddSubView(subView: dataTypeLabel)
        
        let dataTypeImage = UIImage(named: "DataType")
        self.scrollViewAddImage(image: dataTypeImage)
        
        let abstractDataTypeAttr = NSMutableAttributedString(string:
        """
        抽象数据类型（ADT）：
            是指一个数学模型及定义在该模型上的一组操作（抽象是指抽取出事物具有的普遍性的本质）。“抽象”的意义在于数据类型的数学抽象特性。事实上，抽象数据类型体现了程序设计中问题分解、抽象和信息隐藏的特性。
        """)
        self.setCommonAttrs(attr: abstractDataTypeAttr, boldRange: NSMakeRange(0, 12))
        let abstractDataTypeLabel = self.createAttributedLabel(frame: CGRect(x: padding, y: totalHeight+padding, width: contentWidth, height: 0), attributedStr: abstractDataTypeAttr)
        self.scrollViewAddSubView(subView: abstractDataTypeLabel)
        
        let abstractDataTypeDefineImage = UIImage(named: "AbstractDataTypeDefine")
        self.scrollViewAddImage(image: abstractDataTypeDefineImage)
    }
    
    deinit {
        print("dealloc")
    }
        
    //Event response
    @objc func handleClickEvent(button: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Private methods
    private func drawLinkStructure() {
        var linkImage: UIImage?
        UIGraphicsBeginImageContextWithOptions(CGSize(width: contentWidth, height: contentWidth), true, UIScreen.main.scale)
        imageBackgroundColor.setFill()
        lineColor.setStroke()
        UIRectFill(CGRect(x: 0, y: 0, width: contentWidth, height: contentWidth))
        let points = [
                CGPoint(x: CGFloat(contentWidth/2-100), y: CGFloat(padding+60)),
                CGPoint(x: CGFloat(contentWidth/2+60), y: CGFloat(padding+60)),
                CGPoint(x: CGFloat(contentWidth/2), y: CGFloat(padding+100)),
                CGPoint(x: CGFloat(contentWidth/2+60), y: CGFloat(contentWidth-padding-80)),
                CGPoint(x: CGFloat(contentWidth/2-50), y: CGFloat(padding+130)),
                CGPoint(x: CGFloat(contentWidth/2-20), y: CGFloat(contentWidth-padding-60)),
                CGPoint(x: CGFloat(contentWidth/2+80), y: CGFloat(padding+120)),
                CGPoint(x: CGFloat(contentWidth/2-90), y: CGFloat(padding+180)),
                CGPoint(x: CGFloat(contentWidth/2+110), y: CGFloat(padding+40))]
        itemColor.setFill()
        //draw circle
        let context = UIGraphicsGetCurrentContext()
        let fontHeight = regularFont.lineHeight;
        //points
        let point1 = points[0]
        let point2 = points[1]
        let point3 = points[2]
        let point4 = points[3]
        let point5 = points[4]
        let point6 = points[5]
        let point7 = points[6]
        let point8 = points[7]
        let point9 = points[8]
        
        let lineBezierPath = UIBezierPath()
        lineBezierPath.lineWidth = 1
        lineBezierPath.move(to: point1)
        lineBezierPath.addQuadCurve(to: point2, controlPoint: CGPoint(x: (point2.x+point1.x)/2, y: point1.y/2-CGFloat(20)))
        lineBezierPath.addQuadCurve(to: point3, controlPoint: CGPoint(x: point3.x, y: point2.y-CGFloat(10)))
        lineBezierPath.addQuadCurve(to: point4, controlPoint: CGPoint(x: (point3.x+point4.x)/2+CGFloat(20), y: point3.y+CGFloat(20)))
        lineBezierPath.addQuadCurve(to: point5, controlPoint: CGPoint(x: (point4.x+point5.x)/2+CGFloat(20), y: point5.y+CGFloat(30)))
        lineBezierPath.addQuadCurve(to: point6, controlPoint: CGPoint(x: (point5.x+point6.x)/2+CGFloat(20), y: point5.y+CGFloat(30)))
        lineBezierPath.addQuadCurve(to: point7, controlPoint: CGPoint(x: (point7.x+point6.x)/2+CGFloat(30), y: point6.y-CGFloat(20)))
        lineBezierPath.addQuadCurve(to: point8, controlPoint: CGPoint(x: (point7.x+point8.x)/2+CGFloat(10), y: point8.y+CGFloat(20)))
        lineBezierPath.addQuadCurve(to: point9, controlPoint: CGPoint(x: (point9.x+point8.x)/2-CGFloat(50), y: point9.y-CGFloat(50)))
        lineBezierPath.stroke()
        
        for (index, point) in points.enumerated() {
            let circleItem = UIBezierPath(roundedRect: CGRect(x: point.x-15, y: point.y-15, width: 30, height: 30), cornerRadius: 15)
            circleItem.lineWidth = 1
            circleItem.fill()
            circleItem.stroke()
            context?.saveGState()
            let attr = NSMutableAttributedString(string: "\(index+1)")
            attr.addAttributes([NSAttributedStringKey.font: regularFont, NSAttributedStringKey.foregroundColor: lineColor], range: NSMakeRange(0, attr.length))
            attr.draw(at: CGPoint(x: point.x-6, y: point.y-fontHeight/2))
            context?.restoreGState()
        }
        //draw triangle
        lineColor.setFill()
        
        self.drawTriangle(startPoint: CGPoint(x: point2.x-CGFloat(13), y: point2.y-CGFloat(8)), toUp: true, toLeft: true)
        
        self.drawTriangle(startPoint: CGPoint(x: point3.x+CGFloat(0.5), y: point3.y-CGFloat(15.5)), toUp: true, toLeft: false)
        
        self.drawTriangle(startPoint: CGPoint(x: point4.x, y: point4.y-CGFloat(15)), toUp: true, toLeft: true)
        
        self.drawTriangle(startPoint: CGPoint(x: point5.x+CGFloat(14), y: point5.y+CGFloat(6)), toUp: false, toLeft: false)
        
        self.drawTriangle(startPoint: CGPoint(x: point6.x-CGFloat(1), y: point6.y-CGFloat(15)), toUp: true, toLeft: false)
        
        self.drawTriangle(startPoint: CGPoint(x: point7.x-CGFloat(11), y: point7.y+CGFloat(11)), toUp: false, toLeft: true)
        
        self.drawTriangle(startPoint: CGPoint(x: point8.x+CGFloat(15), y: point8.y+CGFloat(1)), toUp: false, toLeft: false)
        
        self.drawTriangle(startPoint: CGPoint(x: point9.x-CGFloat(15), y: point9.y-CGFloat(3)), toUp: true, toLeft: true)

        linkImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.scrollViewAddImage(image: linkImage)
    }
    
    func drawTriangle(startPoint: CGPoint, toUp: Bool, toLeft: Bool) {
        var viaPoint1: CGPoint?
        var viaPoint2: CGPoint?
        let space:CGFloat = 8
        if toUp, toLeft {
            viaPoint1 = CGPoint(x: startPoint.x, y: startPoint.y-space)
            viaPoint2 = CGPoint(x: startPoint.x-space, y: startPoint.y)
        } else if toUp, !toLeft {
            viaPoint1 = CGPoint(x: startPoint.x, y: startPoint.y-space)
            viaPoint2 = CGPoint(x: startPoint.x+space, y: startPoint.y)
        } else if !toUp, toLeft {
            viaPoint1 = CGPoint(x: startPoint.x-space, y: startPoint.y)
            viaPoint2 = CGPoint(x: startPoint.x, y: startPoint.y+space)
        } else {
            viaPoint1 = CGPoint(x: startPoint.x+space, y: startPoint.y)
            viaPoint2 = CGPoint(x: startPoint.x, y: startPoint.y+space)
        }
        
        let trianglePath = UIBezierPath()
        trianglePath.lineWidth = 2
        trianglePath.lineCapStyle = .round
        trianglePath.move(to: viaPoint1!)
        trianglePath.addLine(to: startPoint)
        trianglePath.addLine(to: viaPoint2!)
        trianglePath.stroke()
    }
    
    private func drawInOrderStructure() {
        var inOrderImage: UIImage?
        let inOrderSize = CGSize(width: contentWidth, height: CGFloat(roundf(Float(contentWidth/3))))
        let circleWidth = 30
        let center = CGPoint(x: contentWidth/2, y: inOrderSize.height/2)
        let originalCenterPoint = CGPoint(x: center.x-30*4-4*2, y: center.y)
        UIGraphicsBeginImageContextWithOptions(inOrderSize, true, UIScreen.main.scale)
        imageBackgroundColor.setFill()
        lineColor.setStroke()
        UIRectFill(CGRect(x: 0, y: 0, width: inOrderSize.width, height: inOrderSize.height))
        let context = UIGraphicsGetCurrentContext()
        let circleFontHeight = heavyFont.lineHeight;
        itemColor.setFill()
        let lineBezierPath = UIBezierPath()
        lineBezierPath.move(to: CGPoint(x: originalCenterPoint.x-CGFloat(circleWidth/2)-CGFloat(1), y: center.y-CGFloat(circleWidth/2)-CGFloat(1)))
        for index in 1...9 {
            let point = CGPoint(x: originalCenterPoint.x+CGFloat((index-1)*(circleWidth+2)), y: center.y)
            let rect = CGRect(x: point.x-CGFloat(circleWidth/2), y: point.y-CGFloat(circleWidth/2), width: CGFloat(circleWidth), height: CGFloat(circleWidth))
            lineBezierPath.addLine(to: CGPoint(x: rect.minX-CGFloat(1), y: rect.minY-CGFloat(1)))
            lineBezierPath.addLine(to: CGPoint(x: rect.minX-CGFloat(1), y: rect.maxY+CGFloat(1)))
            lineBezierPath.addLine(to: CGPoint(x: rect.maxX+CGFloat(1), y: rect.maxY+CGFloat(1)))
            lineBezierPath.addLine(to: CGPoint(x: rect.maxX+CGFloat(1), y: rect.minY-CGFloat(1)))
            let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: CGFloat(circleWidth/2))
            bezierPath.lineWidth = 1
            bezierPath.fill()
            bezierPath.stroke()
            context?.saveGState()
            let attr = NSMutableAttributedString(string: "\(index)")
            attr.addAttributes([NSAttributedStringKey.font: regularFont, NSAttributedStringKey.foregroundColor: lineColor], range: NSMakeRange(0, attr.length))
            attr.draw(at: CGPoint(x: point.x-6, y: point.y-circleFontHeight/2))
            context?.restoreGState()
        }
        lineBezierPath.stroke()
        inOrderImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.scrollViewAddImage(image: inOrderImage)
    }
    
    private func drawSetStructure() {
        var logicImage: UIImage?
        let logicSize = CGSize(width: contentWidth, height: CGFloat(roundf(Float(contentWidth*2/3))))
        UIGraphicsBeginImageContextWithOptions(logicSize, true, UIScreen.main.scale)
        imageBackgroundColor.setFill()
        lineColor.setStroke()
        UIRectFill(CGRect(x: 0, y: 0, width: logicSize.width, height: logicSize.height))
        let circleRect = CGRect(x: (logicSize.width-logicSize.height-margin*2)/2, y: margin, width: logicSize.height-margin*2, height: logicSize.height-margin*2)
        let radius = (logicSize.height-margin*2)/2
        let bezierPath = UIBezierPath(roundedRect: circleRect, cornerRadius: radius)
        
        bezierPath.lineWidth = 1.0
        bezierPath.stroke()
        
        let circleCenter = CGPoint(x: circleRect.midX, y: circleRect.midY)
        let points = [CGPoint(x: circleCenter.x-30, y: circleCenter.y-30), CGPoint(x: circleCenter.x+10, y: circleCenter.y-60), CGPoint(x: circleCenter.x+15, y: circleCenter.y+25), CGPoint(x: circleCenter.x+50, y: circleCenter.y+40), CGPoint(x: circleCenter.x-50, y: circleCenter.y+15), CGPoint(x: circleCenter.x+70, y: circleCenter.y-30)]
        itemColor.setFill()
        let context = UIGraphicsGetCurrentContext()
        let circleFontHeight = heavyFont.lineHeight;
        for (index, point) in points.enumerated() {
            let circleItem = UIBezierPath(roundedRect: CGRect(x: point.x-15, y: point.y-15, width: 30, height: 30), cornerRadius: 15)
            circleItem.lineWidth = 1
            circleItem.fill()
            circleItem.stroke()
            context?.saveGState()
            let attr = NSMutableAttributedString(string: "\(index+1)")
            attr.addAttributes([NSAttributedStringKey.font: regularFont, NSAttributedStringKey.foregroundColor: lineColor], range: NSMakeRange(0, attr.length))
            attr.draw(at: CGPoint(x: point.x-6, y: point.y-circleFontHeight/2))
            context?.restoreGState()
        }
        
        logicImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.scrollViewAddImage(image: logicImage)
    }
    
    private func drawGraphisStructure() {
        var graphicsImage: UIImage?
        UIGraphicsBeginImageContextWithOptions(CGSize(width: contentWidth, height: contentWidth), true, UIScreen.main.scale)
        imageBackgroundColor.setFill()
        lineColor.setStroke()
        UIRectFill(CGRect(x: 0, y: 0, width: contentWidth, height: contentWidth))
        var graphicsPoints = [CGPoint(x: CGFloat(contentWidth/2), y: CGFloat(padding+20)), CGPoint(x: CGFloat(contentWidth/2-80), y: CGFloat(padding+70)), CGPoint(x: CGFloat(contentWidth/2+120), y: CGFloat(padding+80)), CGPoint(x: CGFloat(contentWidth/2-120), y: CGFloat(padding+180)), CGPoint(x: CGFloat(contentWidth/2+20), y: CGFloat(padding+100)), CGPoint(x: CGFloat(contentWidth/2+80), y: CGFloat(contentWidth-padding*2-25)), CGPoint(x: CGFloat(contentWidth/2+70), y: CGFloat(contentWidth-padding*2-80)), CGPoint(x: CGFloat(contentWidth/2-50), y: CGFloat(padding+160)), CGPoint(x: CGFloat(contentWidth/2+20), y: CGFloat(contentWidth-padding*2-10))]
        itemColor.setFill()
        //link circle
        let point1 = graphicsPoints[0]
        let point2 = graphicsPoints[1]
        let point3 = graphicsPoints[2]
        let point5 = graphicsPoints[4]
        let graphicsBezierPath1 = UIBezierPath()
        graphicsBezierPath1.lineWidth = 1
        graphicsBezierPath1.move(to: point1)
        graphicsBezierPath1.addLine(to: point2)
        graphicsBezierPath1.addLine(to: point5)
        graphicsBezierPath1.addLine(to: point3)
        graphicsBezierPath1.close()
        graphicsBezierPath1.stroke()
        
        let point4 = graphicsPoints[3]
        let point8 = graphicsPoints[7]
        let point9 = graphicsPoints[8]
        let graphicsBezierPath2 = UIBezierPath()
        graphicsBezierPath2.lineWidth = 1
        graphicsBezierPath2.move(to: point2)
        graphicsBezierPath2.addLine(to: point4)
        graphicsBezierPath2.addLine(to: point9)
        graphicsBezierPath2.addLine(to: point8)
        graphicsBezierPath2.close()
        graphicsBezierPath2.stroke()
        
        let point6 = graphicsPoints[5]
        let point7 = graphicsPoints[6]
        let graphicsBezierPath3 = UIBezierPath()
        graphicsBezierPath3.lineWidth = 1
        graphicsBezierPath3.move(to: point5)
        graphicsBezierPath3.addLine(to: point9)
        graphicsBezierPath3.addLine(to: point6)
        graphicsBezierPath3.addLine(to: point7)
        graphicsBezierPath3.close()
        graphicsBezierPath3.stroke()
        
        let lineBezierPath1 = UIBezierPath()
        lineBezierPath1.lineWidth = 1
        lineBezierPath1.move(to: point4)
        lineBezierPath1.addLine(to: point8)
        lineBezierPath1.stroke()
        
        let lineBezierPath2 = UIBezierPath()
        lineBezierPath2.lineWidth = 1
        lineBezierPath2.move(to: point7)
        lineBezierPath2.addLine(to: point9)
        lineBezierPath2.stroke()
        
        let lineBezierPath3 = UIBezierPath()
        lineBezierPath3.lineWidth = 1
        lineBezierPath3.move(to: point3)
        lineBezierPath3.addLine(to: point6)
        lineBezierPath3.stroke()
        //draw circle
        let context = UIGraphicsGetCurrentContext()
        let circleFontHeight = heavyFont.lineHeight;
        for (index, point) in graphicsPoints.enumerated() {
            let circleItem = UIBezierPath(roundedRect: CGRect(x: point.x-15, y: point.y-15, width: 30, height: 30), cornerRadius: 15)
            circleItem.lineWidth = 1
            circleItem.fill()
            circleItem.stroke()
            context?.saveGState()
            let attr = NSMutableAttributedString(string: "\(index+1)")
            attr.addAttributes([NSAttributedStringKey.font: regularFont, NSAttributedStringKey.foregroundColor: lineColor], range: NSMakeRange(0, attr.length))
            attr.draw(at: CGPoint(x: point.x-6, y: point.y-circleFontHeight/2))
            context?.restoreGState()
        }
        
        graphicsImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.scrollViewAddImage(image: graphicsImage)
    }
    
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
    
    private func scrollViewAddSubView(subView: UIView) {
        scrollView.addSubview(subView)
        totalHeight = subView.frame.maxY
        scrollView.contentSize = CGSize(width: width, height: totalHeight)
    }
    
    private func scrollViewAddImage(image: UIImage?) {
        guard let realImage = image else {
            return;
        }
        let ratio = realImage.size.height/realImage.size.width
        let imageView = UIImageView(frame: CGRect(x: padding, y: totalHeight+margin, width: contentWidth, height: contentWidth*ratio))
        imageView.image = realImage
        imageView.contentMode = .scaleToFill
        self.scrollViewAddSubView(subView: imageView)
    }
    
    func setCommonAttrs(attr: NSMutableAttributedString, boldRange: NSRange) {
        let paragraph = NSMutableParagraphStyle.init()
        paragraph.lineSpacing = 8
        attr.convinceAddAttributes(font: lightFont, color: textBlack, kern: 1, paragraph: paragraph, range: NSMakeRange(0, attr.length))
        attr.attributesWithRanges(attributes: [NSAttributedStringKey.font: heavyMaxFont], ranges: [boldRange])
    }
}
