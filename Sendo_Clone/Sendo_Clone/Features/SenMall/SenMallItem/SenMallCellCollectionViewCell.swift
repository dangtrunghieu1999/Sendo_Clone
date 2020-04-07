//
//  SenMallCellCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 4/7/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class SenMallCellCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Variables
    
    // MARK: - Properties
    
    // MARK: - UI Elements
    
    fileprivate lazy var containerView: BaseView = {
        let view = BaseView()
        view.backgroundColor = UIColor.lightBackground
        view.layer.cornerRadius = 5
        return view
    }()
    
    fileprivate lazy var shopImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageShop")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
        return imageView
    }()
    
    fileprivate lazy var titleShopLabel: UILabel = {
        let label = UILabel()
        label.text = "ZA"
        label.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        return label
    }()
    
    fileprivate lazy var quantityProductLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.h2.rawValue)
        label.textColor = UIColor(hex: "04329C")
        label.text = "541 Sản phẩm"
        return label
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 4
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.registerReusableCell(ImageCollectionViewCell.self)
        return collectionView
    }()
    
    
    // MARK: - ViewLifeCycles
    
    override func initialize() {
        super.initialize()
        layoutContainerView()
        layoutShopImageView()
        layoutTitleShopLabel()
        layoutQuantityProductLabel()
        layoutCollectionView()
    }
    
    // MARK: - Helper Method
    
    // MARK: - Public Method
    
    // MARK: - Layout
    
    private func layoutContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.largeMargin)
            make.left.equalToSuperview().offset(Dimension.shared.smallMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.smallMargin)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    private func layoutShopImageView() {
        addSubview(shopImageView)
        shopImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.width.height.equalTo(65)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
        }
    }
    
    private func layoutTitleShopLabel() {
        addSubview(titleShopLabel)
        titleShopLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.largeMargin)
            make.left.equalTo(shopImageView.snp.right).offset(Dimension.shared.smallMargin_8)
            
        }
    }
    
    private func layoutQuantityProductLabel() {
        addSubview(quantityProductLabel)
        quantityProductLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleShopLabel.snp.bottom).offset(Dimension.shared.smallMargin)
            make.left.equalTo(titleShopLabel)
        }
    }
    
    private func layoutCollectionView() {
        containerView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.left.equalToSuperview().offset(Dimension.shared.smallMargin_8)
            make.right.equalToSuperview().offset(-Dimension.shared.smallMargin_8)
            make.height.equalTo(60)
        }
    }
    
}

extension SenMallCellCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 3 * 4 ) / 4
        return CGSize(width: width, height: 50)
    }
}

extension SenMallCellCollectionViewCell: UICollectionViewDelegate {
    
}

extension SenMallCellCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
