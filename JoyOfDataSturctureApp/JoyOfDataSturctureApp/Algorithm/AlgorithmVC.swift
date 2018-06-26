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
        self.view.backgroundColor = backgroundColor;
        
        self.navigationItem.hidesBackButton = true
        let backButton = UIButton(type: .custom)
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        backButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10)
        backButton.addTarget(self, action: #selector(handleClickEvent), for: .touchUpInside)
        let backBarItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarItem
        self.navigationItem.title = "算法"
        
        self.view.addSubview(scrollView)
        scrollView.frame = self.view.bounds
        
        defer {
            scrollView.contentSize = CGSize(width: contentWidth, height: totalHeight+padding)
        }
        
        let algorithmDefineStr =
            """
            算法定义：
                算法是解决特定问题求解步骤的描述，在计算机中表现为指令的有限序列，并且每条指令代表一个或者多个操作。
            """
        let algorithmDefineLabel = self.buildLabel(topView: nil, content: algorithmDefineStr, boldTextRange: NSMakeRange(0, 5), alignment: .left)
        
        let algorithmCharacterStr = "算法特性"
        let algorithmCharacterLabel = self.buildLabel(topView: algorithmDefineLabel, content: algorithmCharacterStr, boldTextRange: NSMakeRange(0, algorithmCharacterStr.count), alignment: .center)
        
        let algorithmCharacterImageView = self.buildImageView(topView: algorithmCharacterLabel, image: UIImage(named: "AlgorithmCharacter")!)
        
        let algorithmDesignStr = "算法设计要求"
        let algorithmDesignLabel = self.buildLabel(topView: algorithmCharacterImageView, content: algorithmDesignStr, boldTextRange: NSMakeRange(0, algorithmDesignStr.count), alignment: .center)
        
        let algorithmDesignImageView = self.buildImageView(topView: algorithmDesignLabel, image: UIImage(named: "AlgorithmDesign")!)
        
        let rightPointStr =
            """
            正确性：
                算法的正确性是指算法至少应该具有输入,输出和加工处理无歧义性,能正确反映问题的需求,能够得到问题的正确答案。
            （1）算法程序没有语法错误。
            （2）算法程序对于合法的输入数据能够产生满足要求的输出结果。
            （3）算法程序对于非法的输入数据能够得出满足规格说明的结果。
            （4）算法程序对于精心选择的，甚至刁难的测试数据都有满足的要求的输出结果。
            """
        let rightPointLabel = self.buildLabel(topView: algorithmDesignImageView, content: rightPointStr, boldTextRange: NSMakeRange(0, 4), alignment: .left)
        
        let readableStr =
            """
            可读性：
                算法设计的另一个目的是为了便于阅读,理解和交流。
            """
        let readableLabel = self.buildLabel(topView: rightPointLabel, content: readableStr, boldTextRange: NSMakeRange(0, 4), alignment: .left)
        
        let strongStr =
            """
            健壮性：
                当输入数据不合法时，算法也能做出相关处理，而不是产生异常或莫名其妙的错误。
            """
        let strongLabel = self.buildLabel(topView: readableLabel, content: strongStr, boldTextRange: NSMakeRange(0, 4), alignment: .left)
        
        let timeAndSpaceStr =
            """
            时间效率高和储存量低：
                设计算法应该尽量满足时间效率高和储存量低的需求。
            """
        let timeAndSpaceLabel = self.buildLabel(topView: strongLabel, content: timeAndSpaceStr, boldTextRange: NSMakeRange(0, 11), alignment: .left)
        
        let algorithmSpeedStr =
            """
            算法效率的度量方法
            """
        let algorithmSpeedLabel = self.buildLabel(topView: timeAndSpaceLabel, content: algorithmSpeedStr, boldTextRange: NSMakeRange(0, algorithmSpeedStr.count), alignment: .center)
        
        let algorithmCheckImageView = self.buildImageView(topView: algorithmSpeedLabel, image: UIImage(named: "AlgorithmCheck")!)
        
        let statisticAfterStr =
            """
            事后统计法：
                这种方法主要是通过设计好的测试程序和数据，利用计算机计时器对不同算法编制的程序的运行时间比较，从而确定算法效率的高低。
            """
        let statusticAfterLabel = self.buildLabel(topView: algorithmCheckImageView, content: statisticAfterStr, boldTextRange: NSMakeRange(0, 6), alignment: .left)
        
        let estimateBeforeStr =
            """
            事前估算法：
                在计算机程序编程前，依据统计方法对算法进行估算。
            （1）算法采用的策略和方法。（重要）
            （2）编译产生的代码质量。
            （3）问题的输入规模。（重要）
            （4）机器执行指令的速度。
            """
        let estimateBeforeLabel = self.buildLabel(topView: statusticAfterLabel, content: estimateBeforeStr, boldTextRange: NSMakeRange(0, 6), alignment: .left)
        
        let growthProgressStr = "函数的渐进增长"
        let growthProgressLabel = self.buildLabel(topView: estimateBeforeLabel, content: growthProgressStr, boldTextRange: NSMakeRange(0, growthProgressStr.count), alignment: .center)
        
        let growthProgressImageView = self.buildImageView(topView: growthProgressLabel, image: UIImage(named: "GrowthProgress")!)
        
        let growthProgressDefinStr =
        """
            给定两个函数f(n)和g(n)，如果存在一个整数N，使得对于所有的n>N，f(n)>g(n)，那么，我们说f(n)的渐进增长快于g(n)。
        """
        let growthProgressDefinLabel = self.buildLabel(topView: growthProgressImageView, content: growthProgressDefinStr, boldTextRange: NSMakeRange(0, 0), alignment: .left)
        
        let growthProgressCharacterStr =
        """
        特性：
        （1）忽略加法常数
        （2）忽略高次项相乘的常数
        （3）判断一个算法的效率时，函数中的常数和其他次要项常常可以忽略，而更应该关注主项（最高阶）的阶数。
        """
        let growthProgressCharacterLabel = self.buildLabel(topView: growthProgressDefinLabel, content: growthProgressCharacterStr, boldTextRange: NSMakeRange(0, 3), alignment: .left)
        
        let growthProgressEffectStr =
        """
        作用：
            某个算法，随着n的增大，它会越来越优于另一个算法或者越来越差于另一个算法。
        """
        let growthProgressEffectLabel = self.buildLabel(topView: growthProgressCharacterLabel, content: growthProgressEffectStr, boldTextRange: NSMakeRange(0, 3), alignment: .left)
        
        let algorithmTimeComplexityStr = "算法时间复杂度"
        let algorithmTimeComplexityLabel = self.buildLabel(topView: growthProgressEffectLabel, content: algorithmTimeComplexityStr, boldTextRange: NSMakeRange(0, algorithmTimeComplexityStr.count), alignment: .center)
        
        let algorithmTimeComplexityDefineStr =
        """
            在进行算法分析时，语句总的执行次数T(n)是关于问题规模n的函数，进而分析T(n)随着n的变化情况并确定T(n)的数量级。算法的时间复杂度，也就是算法的时间量度，记作：T(n) = O(f(n))。它表示随问题规模n的增大，算法执行时间的增长率和f(n)的增长率相同，称作算法的渐进时间复杂度，简称为时间复杂度。其中f(n)是问题规模n的某个函数。
        """
        let algorithmTimeComplexityDefineLabel = self.buildLabel(topView: algorithmTimeComplexityLabel, content: algorithmTimeComplexityDefineStr, boldTextRange: NSMakeRange(0, 0), alignment: .left)
        
        let bigOStr =
        """
        推导大O阶：
        1.用常数1取代运行时间中的所有加法常数。
        2.在修改后的运行次数函数中，只保留最高阶项。
        3.如果最高阶项不存在且不是1，则去除与这个项相乘的常数。
        得到的结果就是大O阶。
        """
        let bigOLabel = self.buildLabel(topView: algorithmTimeComplexityDefineLabel, content: bigOStr, boldTextRange: NSMakeRange(0, 6), alignment: .left)
        
        let algorithmTimeComplexityImageView = self.buildImageView(topView: bigOLabel, image: UIImage(named: "AlgorithmTimeComplexity")!)
        
        let normalAlgorithmFunctionImageView = self.buildImageView(topView: algorithmTimeComplexityImageView, image: UIImage(named: "NormalAlgorithmFunction")!)
        
        let worstTimeComplexityStr =
        """
        最坏时间复杂度：
            最坏情况运行时间是一种保证，那就是运行时间将不会再坏了。在应用中，这是一种重要的需求，通常，除非特别指定，我们提到的运行时间都是最坏情况的运行时间。
        """
        let worstTimeComplexityLabel = self.buildLabel(topView: normalAlgorithmFunctionImageView, content: worstTimeComplexityStr, boldTextRange: NSMakeRange(0, 8), alignment: .left)
        
        let averageTimeComplexityStr =
        """
        平均运行时间：
            平均运行时间是所有情况中最有意义的，因为它是期望的运行时间。
        """
        let averageTimeComplexityLabel = self.buildLabel(topView: worstTimeComplexityLabel, content: averageTimeComplexityStr, boldTextRange: NSMakeRange(0, 7), alignment: .left)
        
        let algorithmSpaceComplexityStr = "算法空间复杂度"
        let algorithmSpaceComplexityLabel = self.buildLabel(topView: averageTimeComplexityLabel, content: algorithmSpaceComplexityStr, boldTextRange: NSMakeRange(0, algorithmSpaceComplexityStr.count), alignment: .center)
        
        let algorithmSpaceComplexityDefineStr =
        """
            算法的空间复杂度通过计算算法所需要的储存空间实现，算法空间复杂度的计算公式记作：S(n) = O(f(n))，其中，n为问题的规模，f(n)为语句关于n所占储存空间的函数。
        """
        _ = self.buildLabel(topView: algorithmSpaceComplexityLabel, content: algorithmSpaceComplexityDefineStr, boldTextRange: NSMakeRange(0, 0), alignment: .left)
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
    
    private func buildLabel(topView: UIView?, content: String, boldTextRange: NSRange, alignment: NSTextAlignment) -> UILabel {
        let result = self.buildLabel(topView: topView, superView: scrollView, content: content, boldTextRange: boldTextRange, alignment: alignment)
        totalHeight = totalHeight + result.1
        return result.0
    }
    
    private func buildImageView(topView: UIView?, image: UIImage) -> UIImageView {
        let result = self.buildImageView(topView: topView, superView: scrollView, image: image)
        totalHeight = totalHeight + result.1
        return result.0
    }
}
