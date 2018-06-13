//
//  AlgorithmVC.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/5/27.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class AlgorithmVC: UIViewController {
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = true
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    var size: CGSize!
    var width: CGFloat!
    var height: CGFloat!
    var contentWidth: CGFloat!
    var totalHeight: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor;
        
        size = self.view.frame.size
        width = size.width
        height = size.height
        contentWidth = width-padding*2
        
        self.navigationItem.hidesBackButton = true
        let backButton = UIButton(type: .custom)
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        backButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10)
        backButton.addTarget(self, action: #selector(handleClickEvent), for: .touchUpInside)
        let backBarItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarItem
        
        self.view.addSubview(scrollView)
        scrollView.frame = self.view.bounds
        
        let algorithmDefineAttr = NSMutableAttributedString.init(string:
            """
            算法定义：
                算法是解决特定问题求解步骤的描述，在计算机中表现为指令的有限序列，并且每条指令代表一个或者多个操作。
            """)
        self.setCommonAttrs(attr: algorithmDefineAttr, boldRange: NSMakeRange(0, 5))
        let algorithmDefine = self.createLabel(font: lightFont, textColor: textBlack, textAlignment: .left)
        algorithmDefine.attributedText = algorithmDefineAttr
        let algorithmSize = algorithmDefine.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude))
        scrollView.addSubview(algorithmDefine)
        algorithmDefine.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(padding)
            make.size.equalTo(algorithmSize)
        }
        
        self.scrollViewAddImage(image: UIImage(named: "AlgorithmCharacter")) { (imageView, ratio) in
            scrollView.addSubview(imageView)
            let imageHeight = ratio*contentWidth
            imageView.snp.makeConstraints({ (make) in
                make.left.equalToSuperview().offset(padding)
                make.top.equalTo(algorithmDefine.snp.bottom).offset(padding)
                make.width.equalTo(contentWidth)
                make.height.equalTo(imageHeight)
            })
        }
    }
    
    //Event response
    @objc func handleClickEvent(button: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTapImage(tapGesture: UITapGestureRecognizer) {
        if scrollView.isDecelerating {
            return
        }
        
    }
    
    private func scrollViewAddImage(image: UIImage?,
                                    completion: (UIImageView, CGFloat) -> Void) {
        guard let realImage = image else {
            return;
        }
        let ratio = realImage.size.height/realImage.size.width
        let imageView = UIImageView()
        imageView.image = realImage
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapImage))
        imageView.addGestureRecognizer(tapGesture)
        completion(imageView, ratio)
    }
}
