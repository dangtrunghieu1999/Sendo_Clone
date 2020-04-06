//
//  HotDealCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class HotDealCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - UI Elements
    
    private let containerView: BaseView = {
        let view = BaseView()
        view.backgroundColor = UIColor.colorEvent
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let hotDealImage: UIImageView = {
         let imageView = UIImageView()
         imageView.layer.masksToBounds = true
         imageView.contentMode = .scaleAspectFit
         imageView.image = ImageManager.hotDeal
         return imageView
     }()
     
     fileprivate let hotDealTitleLabel: UILabel = {
         let label = UILabel()
         label.text = TextManager.hotDeal
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
    
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerReusableCell(DealItemCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: Dimension.shared.normalMargin, bottom: 0, right: Dimension.shared.normalMargin)
        return collectionView
    }()
    
    
    // MARK: - View LifeCycles
    
    override func initialize() {
        super.initialize()
    
        layoutContainerView()
        layoutHotDealImage()
        layoutHotDealTitleLabel()
        layoutNextImageView()
        layoutSeeAllButton()
        layoutCollectionView()
    }
    
    // MARK: - Layout
    
    private func layoutContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.bottom.equalToSuperview()
        }
    }
    
    private func layoutHotDealImage() {
        containerView.addSubview(hotDealImage)
        hotDealImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.height.width.equalTo(15)
        }
    }
    
    private func layoutHotDealTitleLabel() {
        containerView.addSubview(hotDealTitleLabel)
        hotDealTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(hotDealImage)
            make.left.equalTo(hotDealImage.snp.right).offset(Dimension.shared.mediumMargin)
        }
    }
    
    private func layoutNextImageView() {
        containerView.addSubview(nextImageView)
        nextImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(hotDealTitleLabel)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.width.height.equalTo(5)
        }
    }
    
    private func layoutSeeAllButton() {
        containerView.addSubview(seeAllButton)
        seeAllButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(hotDealTitleLabel)
            make.right.equalTo(nextImageView.snp.left).offset(-Dimension.shared.mediumMargin)
        }
    }
    
    private func layoutCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension HotDealCollectionViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HotDealCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 10 * 3) / 3.2
        return CGSize(width: width, height: 200)
    }
}

// MARK: - UICollectionViewDataSource

extension HotDealCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DealItemCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
