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
    
    func buildLabel(topView: UIView?, superView: UIView, content: String, boldTextRange: NSRange, alignment: NSTextAlignment) -> (UILabel, CGFloat) {
        let attributedText = NSMutableAttributedString(string: content)
        self.setCommonAttrs(attr: attributedText, boldRange: boldTextRange)
        let label = self.createLabel(font: lightFont, textColor: textBlack, textAlignment: alignment)
        label.attributedText = attributedText
        let textSize = label.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude))
        superView.addSubview(label)
        label.snp.makeConstraints { (make) in
            if let view = topView {
                make.top.equalTo(view.snp.bottom).offset(padding)
            } else {
                make.top.equalToSuperview().offset(padding)
            }
            if (alignment == .center) {
                make.centerX.equalToSuperview()
            } else {
                make.left.equalToSuperview().offset(padding)
            }
            make.size.equalTo(textSize)
        }
        return (label, textSize.height+padding)
    }
    
    func buildImageView(topView: UIView?, superView: UIView, image: UIImage) -> (UIImageView, CGFloat) {
        let ratio = image.size.height/image.size.width
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = true
        superView.addSubview(imageView)
        let imageHeight = ratio*contentWidth
        imageView.snp.makeConstraints({ (make) in
            if let view = topView {
                make.top.equalTo(view.snp.bottom).offset(margin)
            } else {
                make.top.equalToSuperview().offset(margin)
            }
            make.left.equalToSuperview().offset(padding)
            make.size.equalTo(CGSize(width: contentWidth, height: imageHeight))
        })
        return (imageView, imageHeight+margin)
    }
}
