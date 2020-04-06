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
        collectionView.registerReusableCell(SenLiveItemCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: Dimension.shared.normalMargin, bottom: 0, right: Dimension.shared.normalMargin)
        return collectionView
    }()
    
    // MARK: - ViewLifeCycles
    
    override func initialize() {
        super.initialize()
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
    
}
