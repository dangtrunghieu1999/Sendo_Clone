//
//  ViewController.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Variables
    
    fileprivate enum SectionType: Int {
        case promotion          = 0
        case category           = 1
        case bannerEvent        = 2
        case flashSale          = 3
        case service            = 4
        case hotDeal            = 5
        case senLive            = 6
        case sendMall           = 7
        case yourRecommend      = 8
        case productRecommend   = 9
        
        static func numberOfSections() -> Int {
            return 10
        }
    }
    
    // MARK: - UI Elements
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.lightBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    
    // MARK: - ViewLifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutCollectionView()
        registerCollectionView()
    }
    
    // MARK: - Method Helper
    
    private func registerCollectionView() {
        collectionView.registerReusableCell(PromotionCollectionViewCell.self)
        collectionView.registerReusableCell(CategoryCollectionViewCell.self)
        collectionView.registerReusableCell(BannerCollectionViewCell.self)
        collectionView.registerReusableCell(FlashSaleCollectionViewCell.self)
        collectionView.registerReusableCell(ServiceCollectionViewCell.self)
        collectionView.registerReusableCell(HotDealCollectionViewCell.self)
        collectionView.registerReusableCell(SenLiveCollectionViewCell.self)
        collectionView.registerReusableCell(SenMallCollectionViewCell.self)
        collectionView.registerReusableCell(ProductRecommendCollectionViewCell.self)
        collectionView.registerReusableCell(YourRecommendCollectionViewCell.self)
    }
    
    // MARK: - Layout
    
    private func layoutCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch SectionType(rawValue: indexPath.section) {
        case .promotion:
            let cell: PromotionCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .category :
            let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .bannerEvent:
            let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .flashSale:
            let cell: FlashSaleCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .service:
            let cell: ServiceCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .hotDeal:
            let cell: HotDealCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .senLive:
            let cell: SenLiveCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .sendMall:
            let cell: SenMallCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .yourRecommend:
            let cell: YourRecommendCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        default:
            let cell: ProductRecommendCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        }
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        switch SectionType(rawValue: indexPath.section) {
        case .promotion:
            return CGSize(width: width, height: 230)
        case .category:
            return CGSize(width: width, height: 180)
        case .bannerEvent:
            return CGSize(width: width, height: 50)
        case .flashSale:
            return CGSize(width: width, height: 450)
        case .service:
            return CGSize(width: width, height: 420)
        case .hotDeal:
            return CGSize(width: width, height: 250)
        case .senLive:
            return CGSize(width: width, height: 220)
        case .sendMall:
            return CGSize(width: width, height: 210)
        case .yourRecommend:
            return CGSize(width: width, height: 450)
        default:
            return CGSize(width: width, height: 200)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    
}

