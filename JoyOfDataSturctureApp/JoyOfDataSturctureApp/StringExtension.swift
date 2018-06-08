//
//  StringExtension.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/6/6.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit

extension String {
    func hexStringToColor() -> UIColor {
        var color = UIColor.white
        if !self.isEmpty {
            let rawValue = self.uppercased()
            let redValue = String(rawValue.prefix(2))
            let startIndex = rawValue.index(rawValue.startIndex, offsetBy: 2)
            let endIndex = rawValue.index(rawValue.startIndex, offsetBy: 3)
            let greenValue = String(rawValue[startIndex...endIndex])
            let blueValue = String(rawValue.suffix(2))
            color = UIColor(red: CGFloat(redValue.hexStringToInt())/255.0, green: CGFloat(greenValue.hexStringToInt())/255.0, blue: CGFloat(blueValue.hexStringToInt())/255.0, alpha: 1.0)
        }
        return color
    }
    func hexStringToInt() -> Int {
        // 0 -> 48 1 -> 49 2 -> 50 3 -> 51 4 -> 52 5 -> 53 6 -> 54 7 -> 55 8 -> 56 9 -> 57
        // A -> 65 B -> 66 C -> 67 D -> 68 E -> 69 F -> 70
        let str = self.uppercased();
        var sum = 0
        for i in str.utf8 {
            sum = sum * 16 + Int(i) - 48  //0 -> 48
            if i >= 65 {
                sum -= 7 // (F -> 70) - (0 -> 48) = 22 => 22-15 = 7
            }
        }
        return sum
    }
}
