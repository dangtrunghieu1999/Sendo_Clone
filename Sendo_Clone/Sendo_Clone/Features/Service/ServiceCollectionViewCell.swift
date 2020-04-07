//
//  ServiceCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class ServiceCollectionViewCell: BaseCollectionViewCell {

   // MARK: - Variables
    
    fileprivate enum SectionType: Int {
        case banner         = 0
        case utilities      = 1
        
        static func numberOfSections() -> Int {
            return 2
        }
    }
    
     // MARK: - UI Elements
    
    fileprivate let containerView: BaseView = {
        let containerVeiw = BaseView()
        containerVeiw.layer.cornerRadius = 5
        return containerVeiw
    }()
    
    fileprivate let serviceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Dịch vụ và tiện ích"
        label.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue, weight: .bold)
        label.textColor = UIColor(hex: "364955")
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.registerReusableCell(BannerServiceCollectionViewCell.self)
        collectionView.registerReusableCell(UtilitiesServiceCollectionViewCell.self)
        return collectionView
    }()
    
    
    // MARK: - View LifeCycles
    
    override func initialize() {
        super.initialize()
        layoutContainerView()
        layoutServiceTitleLabel()
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
    
    private func layoutServiceTitleLabel() {
        containerView.addSubview(serviceTitleLabel)
        serviceTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.left.equalToSuperview().offset(Dimension.shared.normalMargin)
        }
    }
    
    private func layoutNextImageView() {
        containerView.addSubview(nextImageView)
        nextImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(serviceTitleLabel)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.width.height.equalTo(5)
        }
    }
    
    private func layoutSeeAllButton() {
        containerView.addSubview(seeAllButton)
        seeAllButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(nextImageView)
            make.right.equalTo(nextImageView.snp.left).offset(-Dimension.shared.mediumMargin)
        }
    }
    
    private func layoutCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension ServiceCollectionViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension ServiceCollectionViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.numberOfSections()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: BannerServiceCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        } else {
            let cell: UtilitiesServiceCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ServiceCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
    
        if indexPath.section == 0 {
            return CGSize(width: width, height: 200)
        } else {
            return CGSize(width: width, height: 220)
        }
    }
}
