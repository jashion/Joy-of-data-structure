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
        
        
    }
}
