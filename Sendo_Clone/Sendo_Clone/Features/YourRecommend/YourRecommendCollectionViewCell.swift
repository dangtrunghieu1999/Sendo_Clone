//
//  YourRecommendCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class YourRecommendCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Variables
    
    
    // MARK: - Properties
    
    private let viewModel: YourRecommendModel = {
        let viewModel = YourRecommendModel()
        return viewModel
    }()
    
    // MARK: - UI Elements
    
    private let containerView: BaseView = {
        let view = BaseView()
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let titleRecommendLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.yourRecommend
        label.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue, weight: .semibold)
        return label
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.25
        layout.minimumInteritemSpacing = 0.25
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.registerReusableCell(YourItemCollectionViewCell.self)
        return collectionView
    }()
    
    // MARK: - ViewLifeCycles
    
    override func initialize() {
        super.initialize()
        layoutContainerView()
        layoutTitleRecommendLabel()
        layoutCollectionView()
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
    
    private func layoutTitleRecommendLabel() {
        containerView.addSubview(titleRecommendLabel)
        titleRecommendLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.smallMargin_8)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
        }
    }
    
    private func layoutCollectionView() {
        containerView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(titleRecommendLabel.snp.bottom).offset(Dimension.shared.normalMargin)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
}
extension YourRecommendCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 0.25 * 2) / 3
        return CGSize(width: width, height: 120)
    }
}

extension YourRecommendCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: YourItemCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configCell(image: viewModel.images[indexPath.row], title: viewModel.titles[indexPath.row])
        return cell
    }
}
