//
//  BannerCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: BaseCollectionViewCell {
    
    
    // MARK: - UI Elements
    
    fileprivate lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = ImageManager.bannerEvent
        return imageView
    }()
    
    // MARK: - View Life Cycles
    
    override func initialize() {
        super.initialize()
        backgroundColor = UIColor.white
        layoutBannerImageView()
    }
    
    // MARK: - Layout
    
    private func layoutBannerImageView() {
        addSubview(bannerImageView)
        bannerImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.top.equalToSuperview().offset(Dimension.shared.smallMargin)
            make.height.equalTo(100)
        }
    }
}
