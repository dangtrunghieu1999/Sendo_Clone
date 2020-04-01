//
//  MenuItemCellCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 4/1/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class MenuItemCellCollectionViewCell: BaseCollectionViewCell {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.tintColor = UIColor(red: 91, green: 14, blue: 13, alpha: 0)
        return titleLabel
    }()
    
    override var isHighlighted: Bool {
        didSet {
            titleLabel.tintColor = isHighlighted ? UIColor.white : UIColor(red: 91, green: 14, blue: 13, alpha: 0)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.tintColor = isSelected ? UIColor.white : UIColor(red: 91, green: 14, blue: 13, alpha: 0)
        }
    }
    
    override func initialize() {
        super.initialize()
        layoutTitleLabel()
    }
    
    
    public func cellConfig(title: String) {
        titleLabel.text = title
    }
    
    private func layoutTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
