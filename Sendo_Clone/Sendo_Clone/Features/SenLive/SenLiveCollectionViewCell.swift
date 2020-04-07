//
//  SenLiveCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class SenLiveCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - UI Elements
    
    private let containerView: BaseView = {
        let view = BaseView()
        view.layer.cornerRadius = 5
        return view
    }()
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.senLive
        label.font = UIFont.systemFont(ofSize: FontSize.title.rawValue, weight: .bold)
        label.textColor = .topBackground
        return label
    }()
    
    fileprivate let seeAllButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.setTitle(TextManager.seeAllButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.h2.rawValue, weight: .medium)
        button.setTitleColor(UIColor(hex: "828B91"), for: .normal)
        return button
    }()
    
    fileprivate let nextImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageManager.next
        imageView.image = imageView.image?.imageWithColor(color1: UIColor(hex: "828B91"))
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
        collectionView.registerReusableCell(SenLiveItemCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: Dimension.shared.normalMargin, bottom: 0, right: Dimension.shared.normalMargin)
        return collectionView
    }()
    
    // MARK: - ViewLifeCycles
    
    override func initialize() {
        super.initialize()
        layoutContainerView()
        layoutTitleLabel()
        layoutNextImageView()
        layoutSeeAllButton()
        layoutCollectionView()
    }
    
    private func layoutContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.bottom.equalToSuperview()
        }
    }
    
    private func layoutTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
        }
    }
    
    private func layoutNextImageView() {
        containerView.addSubview(nextImageView)
        nextImageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.centerY.equalTo(titleLabel)
            make.width.height.equalTo(5)
        }
    }
    
    private func layoutSeeAllButton() {
        containerView.addSubview(seeAllButton)
        seeAllButton.snp.makeConstraints { (make) in
            make.right.equalTo(nextImageView.snp.left).offset(-Dimension.shared.mediumMargin)
            make.centerY.equalTo(titleLabel)
            
        }
    }
    
    private func layoutCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.normalMargin)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
}

extension SenLiveCollectionViewCell: UICollectionViewDelegate {
    
}

extension SenLiveCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SenLiveItemCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension SenLiveCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2.8
        return CGSize(width: width, height: 150)
    }
}
