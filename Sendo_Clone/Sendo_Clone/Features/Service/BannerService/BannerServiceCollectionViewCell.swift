//
//  BannerServiceCollectionViewCell.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class BannerServiceCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Variables
    
    var currentIndex = 0
    var timer: Timer?
    
    // MARK: - Properties
    
    fileprivate lazy var viewModel = PromotionViewModel()
    
    // MARK: - UI ELements
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerReusableCell(BannerServiceItemCollectionViewCell.self)
        return collectionView
    }()
    
    fileprivate let pageIndicator: UIPageControl = {
        let pageIndicator = UIPageControl()
        pageIndicator.numberOfPages = 5
        pageIndicator.currentPage = 0
        pageIndicator.currentPageIndicatorTintColor = UIColor.pageIndicatorTintColor
        pageIndicator.pageIndicatorTintColor = UIColor.white
        return pageIndicator
    }()
    
    
    // MARK: - View LifeCycles
    
    override func initialize() {
        super.initialize()
        layoutCollectionView()
        layoutPageIndicator()
        startTimer()
    }
    
    // MARK: - Helper Method
    
    func startTimer() {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.timeAction), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func timeAction() {
        if currentIndex < 5 {
            let index = IndexPath(item: currentIndex, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            currentIndex += 1
        } else {
            currentIndex = 0
            let index = IndexPath(item: currentIndex, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
    // MARK: - Layout
    
    private func layoutCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func layoutPageIndicator() {
           addSubview(pageIndicator)
           pageIndicator.snp.makeConstraints { (make) in
               make.centerX.equalToSuperview()
               make.height.equalTo(Dimension.shared.defaultHeightPageIndicator)
               make.width.equalTo(Dimension.shared.defaultWidthPageIndicator)
               make.bottom.equalTo(collectionView.snp.bottom).offset(-Dimension.shared.mediumMargin)
           }
       }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension BannerServiceCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: collectionView.frame.height)
    }
}

// MARK: - UICollectionViewDataSource

extension BannerServiceCollectionViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerServiceItemCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configCell(image: viewModel.image[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension BannerServiceCollectionViewCell: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / collectionView.frame.width)
        pageIndicator.currentPage = currentPage
    }
}

