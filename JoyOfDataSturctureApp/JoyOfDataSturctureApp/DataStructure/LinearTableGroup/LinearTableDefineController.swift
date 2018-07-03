//
//  LinearTableDefineController.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/6/26.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class LinearTableDefineController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: UIScreen.main.bounds)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = true
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    var totalHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        self.view.addSubview(scrollView)
        
        defer {
            scrollView.contentSize = CGSize(width: contentWidth, height: totalHeight+padding)
        }
        
        let linearTableResult = self.buildLabel(topView: nil, superView: scrollView, content: "线性表（List）：零个或者多个数据元素的有限序列。", boldTextRange: NSMakeRange(0, 10), alignment: .left)
        totalHeight = totalHeight + linearTableResult.1
        
        let linearTableMatchResult = self.buildLabel(
            topView: linearTableResult.0,
            superView: scrollView,
            content:
            """
            线性表数学语言定义：
                若将线性表记为（a1, ..., ai-1, ai, ai+1, ..., an），表中ai-1是ai的直接前驱元素，ai+1是ai直接后续元素。当i=1, 2, ..., n-1时，ai有且仅有一个直接后续，当i=2, 3, ..., n时，ai有且仅有一个直接前驱。
            """,
            boldTextRange: NSMakeRange(0, 10),
            alignment: .left)
        totalHeight = totalHeight + linearTableMatchResult.1
        
        let linearTableImageViewResult = self.buildImageView(topView: linearTableMatchResult.0, superView: scrollView, image: UIImage(named: "LinearTable")!)
        totalHeight = totalHeight + linearTableImageViewResult.1
        
        let linearTableAbstractDataTypeResult = self.buildLabel(topView: linearTableImageViewResult.0, superView: scrollView, content: "线性表的抽象数据结构", boldTextRange: NSMakeRange(0, 10), alignment: .center)
        totalHeight = totalHeight + linearTableAbstractDataTypeResult.1
        
        let linearTableAbstractDataImageViewResult = self.buildImageView(topView: linearTableAbstractDataTypeResult.0, superView: scrollView, image: UIImage(named: "LinearTableAbstractDataType")!)
        totalHeight = totalHeight + linearTableAbstractDataImageViewResult.1
    }
}
