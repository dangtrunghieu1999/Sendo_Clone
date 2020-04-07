//
//  SenLiveItemCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 4/6/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class SenLiveItemCollectionViewCell: BaseCollectionViewCell {
    
    fileprivate lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "sen_live")
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
            make.top.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.left.equalToSuperview().offset(Dimension.shared.smallMargin)
            make.right.equalToSuperview()
            make.height.equalTo(150)
        }
    }
    
}
