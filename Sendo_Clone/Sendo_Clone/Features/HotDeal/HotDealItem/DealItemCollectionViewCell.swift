//
//  DealItemCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 4/6/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class DealItemCollectionViewCell: BaseCollectionViewCell {
    
    private let containerView: BaseView = {
        let view = BaseView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        return view
    }()
    
    fileprivate lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "product_hotdeal")
        return imageView
    }()
    
    fileprivate lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "109.000đ"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: FontSize.h2.rawValue, weight: .bold)
        label.textColor = UIColor.topBackground
        return label
    }()
    
    override func initialize() {
        super.initialize()
        layoutContainerView()
        layoutImageView()
        layoutPriceLabel()
    }
    
    // MARK: - Layout

    private func layoutContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.normalMargin)
            make.left.equalToSuperview().offset(Dimension.shared.smallMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.smallMargin)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    private func layoutImageView() {
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.smallMargin)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(125)
        }
    }
    
    private func layoutPriceLabel() {
        containerView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(Dimension.shared.smallMargin_8)
            make.centerX.equalTo(imageView)
        }
    }
}
