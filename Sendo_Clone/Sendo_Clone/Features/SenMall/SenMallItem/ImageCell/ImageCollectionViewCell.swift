//
//  ImageCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 4/7/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: BaseCollectionViewCell {
    
    fileprivate lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 5
        imageView.image = UIImage(named: "productShop")
        return imageView
    }()
    
    
    override func initialize() {
        super.initialize()
        layoutImageView()
    }
    
    // MARK: - Layout
    
    
    private func layoutImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(Dimension.shared.smallMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.smallMargin)
            make.bottom.equalToSuperview()
        }
    }
}
