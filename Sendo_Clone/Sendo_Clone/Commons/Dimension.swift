//
//  Dimension.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

let dimesion = Dimension.shared

class Dimension {
    class var shared: Dimension {
        struct Static{
            static var instance = Dimension()
        }
        return Static.instance
    }
    
    var widthScreen: CGFloat = 1.0
    var heightScreen: CGFloat = 1.0
    var widthScale: CGFloat = 1.0
    var heightScale: CGFloat = 1.0
    
    // MARK: - Initialize
    private init() {
        self.widthScreen = UIScreen.main.bounds.width
        self.heightScreen = UIScreen.main.bounds.height
    }
    
    // MARK: - Spacing
    
    var smallMargin: CGFloat {
        return 4 * widthScale
    }
    
    var smallMargin_8: CGFloat {
        return 8 * widthScale
    }
    
    var mediumMargin: CGFloat {
        return 12 * widthScale
    }
    
    var normalMargin: CGFloat {
        return 16 * widthScale
    }
    
    var largeMargin: CGFloat {
        return 24 * widthScale
    }
    
    var largeMargin_32: CGFloat {
        return 32 * widthScale
    }
    
    var largeMargin_42: CGFloat {
        return 42 * widthScale
    }
    
     var largeMargin_56: CGFloat {
         return 56 * self.widthScale
     }
    
     var largeMargin_60: CGFloat {
         return 60 * self.widthScale
     }
     
     var largeMargin_90: CGFloat {
         return 90 * self.widthScale
     }
    
     var largeMargin_120: CGFloat {
         return 120 * self.widthScale
     }
    
    
    // MARK: - ConerRadius
    
    var smallCornerRadius: CGFloat {
        return 5 * widthScale
    }
    
    // MARK: - PageIndicator
    
    var defaultWidthPageIndicator: CGFloat {
        return 100 * widthScale
    }
    
    var defaultHeightPageIndicator: CGFloat {
        return 16 * widthScale
    }
    
    // MARK: - BaseView
    
    var smallHeightView: CGFloat {
        return 50 * widthScale
    }
    
    var mediumHeightView: CGFloat {
        return 100 * widthScale
    }
    
    var normalHeightView: CGFloat {
        return 150 * widthScale
    }
    
}

