//
//  Constants.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/15/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    enum ColorName: Int {
        case oatmeal = 0xdddfd4ff
        case yellow = 0xfae596ff
        case turquoise = 0x3fb0acff
        case darkBlue = 0x173e43ff
    }
}

extension UIColor {
    convenience init(named name: ColorName) {
        let rgbaValue = name.rawValue
        let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
        let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
        let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
        let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

struct Constants {
    
    static let key: String = "AIzaSyCbSMc7W4GMkAJTZuv1ai03wDvrn5-OGFA"
    
    static let key2: String = "AIzaSyDVfmnEa-AgJdoLFoaZcy9ZBCH3jeVEGSE"
    
    
    //LAYOUT
    
    enum gridLayout: CGFloat {
        case InterBlockHorizontalSpacing = 30
        case InterBlockVerticalSpacing = 57
        case GridTopMargin = 60
        case GridSideMargin = 63
    }
    
    enum cardSizes: CGFloat {
        case BlockWidth = 276
        case BlockHeight = 267
    }
    
    enum image: CGFloat {
        case ImageWidth = 276
        case ImageHeight = 207
        case ImageCornerRadius = 10
        case ImageBorderWidth = 2
    }

    
}
