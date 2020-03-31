//
//  UIColor+Extension.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

// MARK: - App Color

extension UIColor {
    class var topBackground: UIColor {
        return UIColor(hex: "E6101E")
    }
    
    class var lightBackground: UIColor {
        return UIColor(hex: "F1F1F1")
    }
    
    class var coverGradient: UIColor {
        return UIColor(hex: "F5C9A6")
    }
    
    class var soldColor: UIColor {
        return UIColor(hex: "F9B44A")
    }
    
    class var colorEvent: UIColor {
        return UIColor(hex: "FF6340")
    }
    
    class var pageIndicatorTintColor: UIColor {
        return UIColor(hex: "E5101D")
    }
    
}

extension UIColor {
    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 1.0, green: 1.0, blue: 0.0, alpha: 0.0)
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: 1.0)
    }
}

