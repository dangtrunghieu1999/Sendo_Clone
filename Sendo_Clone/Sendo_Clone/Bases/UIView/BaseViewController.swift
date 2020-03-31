//
//  BaseViewController.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

enum BarButtonItemType {
    case left
    case right
}

typealias Target = (target: Any?, selector: Selector)

struct BarButtonItemModel {
    var image: UIImage?
    var title: String?
    var target: Target?
    
    init(_ image: UIImage?,_ target: Target?) {
        self.image = image
        self.target = target
    }
}

class BaseViewController: UIViewController {

    
    // MARK: - UI Elements
    
    lazy var searchBar: PaddingTextField = {
        let searchBar = PaddingTextField()
        searchBar.layer.cornerRadius = 2
        searchBar.layer.masksToBounds = true
        searchBar.placeholder = "Tìm kiếm trên Sendo"
        
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }
    
}

