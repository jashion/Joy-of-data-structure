//
//  ViewExtension.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/6/11.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit

extension UIViewController {
    func createLabel(font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        return label
    }
    
    func setCommonAttrs(attr: NSMutableAttributedString, boldRange: NSRange) {
        let paragraph = NSMutableParagraphStyle.init()
        paragraph.lineSpacing = 8
        attr.convinceAddAttributes(font: lightFont, color: textBlack, kern: 1, paragraph: paragraph, range: NSMakeRange(0, attr.length))
        attr.attributesWithRanges(attributes: [NSAttributedStringKey.font: heavyMaxFont], ranges: [boldRange])
    }
}
