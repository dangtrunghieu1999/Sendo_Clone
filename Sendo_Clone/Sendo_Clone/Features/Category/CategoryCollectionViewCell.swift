//
//  CategoryCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: BaseCollectionViewCell {
    
    fileprivate lazy var viewModel: CategoryViewModel = {
        let viewModel = CategoryViewModel()
        return viewModel
    }()
    
    // MARK: - UI Elements
    
    private let containerView: BaseView = {
        let view = BaseView()
        return view
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 35
        layout.minimumInteritemSpacing = 18
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        collectionView.registerReusableCell(CategoryItemCollectionViewCell.self)
        return collectionView
    }()
    
    override  func initialize() {
        super.initialize()
        layoutContainerView()
        layoutCollectionView()
    }
    
    private func layoutContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func layoutCollectionView() {
        containerView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin)
            make.bottom.equalToSuperview()
        }
    }
        
}

extension CategoryCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 18 * 4) / 5
        return CGSize(width: width, height: 50)
    }
}

extension CategoryCollectionViewCell: UICollectionViewDelegate {
    
}

extension CategoryCollectionViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryItemCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configCell(image: viewModel.images[indexPath.row] , title: viewModel.titles[indexPath.row])
        return cell
    }
    
}
