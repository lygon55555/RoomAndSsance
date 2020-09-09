//
//  WeeklyPagingCell.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/24.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import UIKit
import Parchment

class WeeklyPagingCell: PagingCell {
  
    private var options: PagingOptions?
    
    lazy var dateLabel: UILabel = {
        let monthLabel = UILabel(frame: .zero)
        monthLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return monthLabel
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
        
        dateLabel.frame = CGRect(
            x: 0,
            y: 0,
            width: contentView.bounds.width,
            height: contentView.bounds.height)
    }

    fileprivate func configure() {
        dateLabel.backgroundColor = .clear
        dateLabel.textAlignment = .center
        
        addSubview(dateLabel)
    }

    fileprivate func updateSelectedState(selected: Bool) {
        guard let options = options else { return }
        if selected {
            dateLabel.textColor = options.selectedTextColor
        }
        else {
            dateLabel.textColor = options.textColor
        }
    }

    override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
        self.options = options
        let calendarItem = pagingItem as! WeeklyPagingItem
        dateLabel.text = calendarItem.thisMon + " ~ " + calendarItem.thisSun

        updateSelectedState(selected: selected)
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let options = options else { return }

        if let attributes = layoutAttributes as? PagingCellLayoutAttributes {
            dateLabel.textColor = UIColor.interpolate(
                from: options.textColor,
                to: options.selectedTextColor,
                with: attributes.progress)
        }
    }
}
