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
        
        let algorithmCharacterAttr = NSMutableAttributedString(string: "算法特性")
        self.setCommonAttrs(attr: algorithmCharacterAttr, boldRange: NSMakeRange(0, algorithmCharacterAttr.length))
        let algorithmCharacterLabel = self.createLabel(font: lightFont, textColor: textBlack, textAlignment: .center)
        algorithmCharacterLabel.attributedText = algorithmCharacterAttr
        let algorithmCharacterSize = algorithmCharacterLabel.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude))
        scrollView.addSubview(algorithmCharacterLabel)
        algorithmCharacterLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(algorithmDefine.snp.bottom).offset(padding)
            make.size.equalTo(algorithmCharacterSize)
        }
        
        var algorithmCharacterImageView: UIImageView?
        var algorithmCharacterRatio: CGFloat?
        self.scrollViewAddImage(image: UIImage(named: "AlgorithmCharacter")) { (imageView, ratio) in
            algorithmCharacterImageView = imageView
            algorithmCharacterRatio = ratio;
        }
        scrollView.addSubview(algorithmCharacterImageView!)
        let imageHeight = algorithmCharacterRatio!*contentWidth
        algorithmCharacterImageView!.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(padding)
            make.top.equalTo(algorithmCharacterLabel.snp.bottom).offset(margin)
            make.size.equalTo(CGSize(width: contentWidth, height: imageHeight))
        })
        
        let algorithmDesignAttr = NSMutableAttributedString(string: "算法设计要求")
        self.setCommonAttrs(attr: algorithmDesignAttr, boldRange: NSMakeRange(0, algorithmDesignAttr.length))
        let algorithmDesignLabel = self.createLabel(font: lightFont, textColor: textBlack, textAlignment: .center)
        algorithmDesignLabel.attributedText = algorithmDesignAttr
        let algorithmDesignSize = algorithmDesignLabel.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude))
        scrollView.addSubview(algorithmDesignLabel)
        algorithmDesignLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo((algorithmCharacterImageView?.snp.bottom)!).offset(padding)
            make.size.equalTo(algorithmDesignSize)
        }
        
        var algorithmDesignImageView: UIImageView?
        var algorithmDesignRatio: CGFloat?
        self.scrollViewAddImage(image: UIImage(named: "AlgorithmDesign")) { (imageView, ratio) in
            algorithmDesignImageView = imageView
            algorithmDesignRatio = ratio;
        }
        scrollView.addSubview(algorithmDesignImageView!)
        let imageHeight2 = algorithmDesignRatio!*contentWidth
        algorithmDesignImageView!.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(padding)
            make.top.equalTo(algorithmDesignLabel.snp.bottom).offset(margin)
            make.size.equalTo(CGSize(width: contentWidth, height: imageHeight2))
        })
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
