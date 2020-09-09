//
//  MyPagePagingCell.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/20.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import Parchment

class MyPagePagingCell: PagingCell {
  
    private var options: PagingOptions?

    fileprivate lazy var imageView: UIImageView = {
      let imageView = UIImageView(frame: .zero)
      imageView.contentMode = .scaleAspectFit
      return imageView
    }()

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont(name: "NotoSans-Medium", size: 18)
        return titleLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let insets = UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 0)
        
        imageView.frame = CGRect(
            x: 0,
            y: insets.top,
            width: contentView.bounds.width,
            height: contentView.bounds.midY - insets.top)

        titleLabel.frame = CGRect(
            x: 0,
            y: contentView.bounds.midY,
            width: contentView.bounds.width,
            height: contentView.bounds.midY - insets.bottom)
    }

    fileprivate func configure() {
        titleLabel.backgroundColor = .white
        titleLabel.textAlignment = .center

        addSubview(imageView)
        addSubview(titleLabel)
    }
    
    override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
        self.options = options
        let item = pagingItem as! ImageItem
        imageView.image = item.deselectedImage
        titleLabel.text = item.title
        
        if selected {
            imageView.image = item.selectedImage
        }
        else {
            imageView.image = item.deselectedImage
        }
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let options = options else { return }

        if let attributes = layoutAttributes as? PagingCellLayoutAttributes {
            titleLabel.textColor = UIColor.interpolate(
                from: options.textColor,
                to: options.selectedTextColor,
                with: attributes.progress)
        }
    }
}
