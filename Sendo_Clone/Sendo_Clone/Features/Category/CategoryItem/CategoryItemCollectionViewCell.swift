//
//  CategoryItemCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class CategoryItemCollectionViewCell: BaseCollectionViewCell {
    // MARK: - UI Elements
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.h3.rawValue, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    // MARK: - Life Cycles
    
    override func initialize() {
        super.initialize()
        layoutImageView()
        layoutTitleLabel()
    }
    
    // MARK: - Public Method
    
    public func configCell(image: UIImage?, title: String?) {
        imageView.image = image
        titleLabel.text = title
    }
    
    // MARK: - Layout
    
    private func layoutImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func layoutTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(Dimension.shared.smallMargin)
            make.left.right.equalToSuperview()
        }
    }
}

