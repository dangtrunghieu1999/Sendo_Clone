//
//  FlashSaleItemCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class FlashSaleItemCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - UI Elements
    
    fileprivate lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "product_sale")
        imageView.layer.cornerRadius = 5
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightBackground.cgColor
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
    
    private let coverSoldView: BaseView = {
        let view = BaseView()
        view.backgroundColor = UIColor.coverGradient
        view.layer.cornerRadius = 5
        return view
    }()
    
    fileprivate lazy var soldChangeView: BaseView = {
        let view = BaseView()
        view.backgroundColor = UIColor.soldColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    fileprivate lazy var soldLabel: UILabel = {
        let label = UILabel()
        label.text = "Da ban 18"
        label.font = UIFont.systemFont(ofSize: 8, weight: .medium)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        return label
    }()
    

    // MARK: - ViewLifeCycles
    
    override func initialize() {
        super.initialize()
        layoutImageView()
        layoutPriceLabel()
        layoutCoverSoldView()
        layoutSoldChangeView()
        layoutSoldLabel()
    }
    
    // MARK: - Layout
    
    private func layoutImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(Dimension.shared.smallMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.smallMargin)
            make.height.equalTo(100)
        }
    }
    
    private func layoutPriceLabel() {
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(Dimension.shared.smallMargin_8)
            make.centerX.equalTo(imageView)
        }
    }
    
    private func layoutCoverSoldView() {
        addSubview(coverSoldView)
        coverSoldView.snp.makeConstraints { (make) in
            make.top.equalTo(priceLabel.snp.bottom).offset(Dimension.shared.smallMargin_8)
            make.width.equalTo(90)
            make.centerX.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    
    private func layoutSoldChangeView() {
        coverSoldView.addSubview(soldChangeView)
        soldChangeView.snp.makeConstraints { (make) in
            make.width.equalTo(20)
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    
    private func layoutSoldLabel() {
        coverSoldView.addSubview(soldLabel)
        soldLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
        }
    }

}

