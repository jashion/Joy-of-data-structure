//
//  CommonHeader.swift
//  JoyOfDataSturctureApp
//
//  Created by Jashion on 2018/6/6.
//  Copyright © 2018 BMu. All rights reserved.
//

import UIKit

let textWhite = UIColor.white
let textBlack  = "333333".hexStringToColor()
let textGray = "444444".hexStringToColor()
let textBlue = UIColor.init(red: 103.0/255.0, green: 192.0/255.0, blue: 1.0, alpha: 1.0)
let textRed = UIColor.red
let textGreen = "09BC8A".hexStringToColor()
let backgroundColor = "EEF6FE".hexStringToColor()
let imageBackgroundColor = "F3F4F9".hexStringToColor()
let lineColor = "16407C".hexStringToColor()
let itemColor = "D5DFFC".hexStringToColor()

let padding:CGFloat = 15
let margin:CGFloat = 5
let space:CGFloat = 10
let lightMaxFont: UIFont = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.light)
let heavyMaxFont: UIFont = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.heavy)
let lightFont: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
let regularFont: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
let boldFont: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
let heavyFont: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.heavy)
let titleFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)

let screen_width = UIScreen.main.bounds.size.width
let screen_height = UIScreen.main.bounds.size.height
let contentWidth = screen_width-padding*2
