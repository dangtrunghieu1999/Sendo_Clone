//
//  SenMallCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class SenMallCollectionViewCell: BaseCollectionViewCell {
    
    
    // MARK: - Variables
    
    // MARK: - Properties
    
    // MARK: - UI Elements
    
    private let containerView: BaseView = {
        let view = BaseView()
        view.backgroundColor = .white
        return view
    }()
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.senMall
        label.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue, weight: .bold)
        label.textColor = .topBackground
        return label
    }()
    
    fileprivate let seeAllButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.setTitle(TextManager.seeAllButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.h2.rawValue, weight: .medium)
        button.setTitleColor(UIColor(hex: "04329C"), for: .normal)
        return button
    }()
    
    fileprivate let nextImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageManager.next
        imageView.image = imageView.image?.imageWithColor(color1: UIColor(hex: "04329C"))
        return imageView
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerReusableCell(SenMallCellCollectionViewCell.self)
        return collectionView
    }()
    
    
    // MARK: - ViewLifeCycles
    
    override func initialize() {
        super.initialize()
        layoutContainerView()
        layoutTitleLabel()
        layoutNextImageView()
        layoutSeeAllButton()
    }
    
    // MARK: - Helper Method
    
    // MARK: - Public Method
    
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
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SenMallCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 1.3
        return CGSize(width: width, height: 100)
    }
}

// MARK: - UICollectionViewDelegate

extension SenMallCollectionViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension SenMallCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SenMallCellCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
}
