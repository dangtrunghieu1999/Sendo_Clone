//
//  PromotionCellCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class PromotionCellCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - UI Elements
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()

    // MARK: - Life Cycles
    
    override func initialize() {
        super.initialize()
        layoutImageView()
    }
    
    // MARK: - Public Method
    
    public func configCell(image: UIImage?) {
        imageView.image = image
    }
    
    // MARK: - Layout
    
    private func layoutImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.bottom.equalToSuperview()
        }
    }
    
}
