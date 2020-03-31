//
//  PaddingTextField.swift
//  Sendo_Clone
//
//  Created by DangTrungHieu on 3/31/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit

protocol PaddingTextFieldDelegate {
    func didTouchInRightView()
}

open class PaddingTextField: UITextField {
    var paddingViewDelegate: PaddingTextFieldDelegate?
    
    var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    var rightImage: UIImage? {
        didSet {
            setupViewImagesIfNeed()
        }
    }
    
    var leftImage: UIImage? {
        didSet {
            setupViewImagesIfNeed()
        }
    }
    
    lazy var rightImageFrame: CGRect = CGRect(x: -10, y: 2, width: 16, height: 16)
    lazy var leftImageFrame: CGRect = CGRect(x: 10, y: 2, width: 16, height: 16)
    
    private var isAddRightImage = false
    private var isAddLeftImage  = false
    private let containerViewWidth: CGFloat = 20
    
    private var correctPadding: UIEdgeInsets {
        var leftPadding = padding.left
        var rightPadding = padding.right
        if leftImage != nil {
            leftPadding += containerViewWidth
        }
        if rightImage != nil {
            rightPadding += containerViewWidth
        }
        
        return UIEdgeInsets(top: padding.top, left: leftPadding, bottom: padding.bottom, right: rightPadding)
    }
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: correctPadding)
    }
    
    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: correctPadding)
    }
    
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: correctPadding)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    @objc private func touchInRightView() {
        paddingViewDelegate?.didTouchInRightView()
    }
    
    func removeRightView() {
        rightView = nil
        rightImage = nil
        isAddRightImage = false
    }
    
    private func setupViewImagesIfNeed() {
        if let leftImage = leftImage, !isAddLeftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: leftImageFrame)
            imageView.image = leftImage
            imageView.contentMode = .scaleAspectFit
            let view = UIView(frame: CGRect(x: 0, y: 0, width: containerViewWidth, height: containerViewWidth))
            view.addSubview(imageView)
            leftView = view
            isAddLeftImage = true
        }
    }
}

