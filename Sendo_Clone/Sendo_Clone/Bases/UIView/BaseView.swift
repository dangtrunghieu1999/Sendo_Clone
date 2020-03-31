//
//  BaseView.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

open class BaseView: UIView {

    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   func initialize() {}
    
    
    
}
