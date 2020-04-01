//
//  FlashSaleCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class FlashSaleCollectionViewCell: BaseCollectionViewCell {
    
    
    // MARK: - UI Elements
    
    private let containerTopView: BaseView = {
        let containerView = BaseView()
        containerView.backgroundColor = UIColor.colorEvent
        containerView.layer.cornerRadius = 5
        return containerView
    }()
    
    private let saleIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = ImageManager.flashSale
        return imageView
    }()
    
    fileprivate let saleTitleLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.flashSale
        label.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    fileprivate let seeAllButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.setTitle(TextManager.seeAllButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.h2.rawValue, weight: .medium)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    fileprivate let nextImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageManager.next
        return imageView
    }()
    
    fileprivate let containerMainView: BaseView = {
        let containerVeiw = BaseView()
        containerVeiw.roundCorners([.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 5, borderColor: UIColor.lightBackground, borderWidth: 1)
        return containerVeiw
    }()
    
    
    fileprivate lazy var saleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 4, right: 16)
        collectionView.registerReusableCell(FlashSaleItemCollectionViewCell.self)
        return collectionView
    }()
    
    
    // MARK: - ViewLifeCycles
    
    override func initialize() {
        super.initialize()
        layoutContainerTopView()
        layoutSaleIconImage()
        layoutSaleTitleLabel()
        layoutNextImageView()
        layoutSeeAllButton()
        layoutContainerMainView()
        layoutSaleCollectionView()
    }
    
    // MARK: - Layout
    
    private func layoutContainerTopView() {
        addSubview(containerTopView)
        containerTopView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(70)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.height.equalTo(45)
        }
    }
    
    private func layoutSaleIconImage() {
        containerTopView.addSubview(saleIconImage)
        saleIconImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.height.width.equalTo(15)
        }
    }
    
    private func layoutSaleTitleLabel() {
        containerTopView.addSubview(saleTitleLabel)
        saleTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(saleIconImage.snp.right).offset(Dimension.shared.mediumMargin)
        }
    }
    
    private func layoutNextImageView() {
        containerTopView.addSubview(nextImageView)
        nextImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.width.height.equalTo(5)
        }
    }
    
    private func layoutSeeAllButton() {
        containerTopView.addSubview(seeAllButton)
        seeAllButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(nextImageView.snp.left).offset(-Dimension.shared.mediumMargin)
        }
    }
    
    private func layoutContainerMainView() {
        addSubview(containerMainView)
        containerMainView.snp.makeConstraints { (make) in
            make.top.equalTo(containerTopView.snp.bottom).offset(-5)
            make.left.right.equalTo(containerTopView)
            make.bottom.equalToSuperview()
        }
    }
    
    private func layoutSaleCollectionView() {
        addSubview(saleCollectionView)
        saleCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(containerTopView.snp.bottom).offset(-5)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-Dimension.shared.mediumMargin)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension FlashSaleCollectionViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FlashSaleItemCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension FlashSaleCollectionViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FlashSaleCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (saleCollectionView.frame.width - 2 * 3) / 3.5
        return CGSize(width: width, height: 140)
    }
}

