//
//  MonthlyPagingCell.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/18.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import UIKit
import Parchment

class MonthlyPagingCell: PagingCell {
  
    private var options: PagingOptions?

    lazy var monthYearLabel: UILabel = {
        let yearLabel = UILabel(frame: .zero)
        yearLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return yearLabel
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
        monthYearLabel.frame = CGRect(
            x: 0,
            y: 0,
            width: contentView.bounds.width,
            height: contentView.bounds.height)
    }

    fileprivate func configure() {
        monthYearLabel.backgroundColor = .clear
        monthYearLabel.textAlignment = .center
        addSubview(monthYearLabel)
    }

    fileprivate func updateSelectedState(selected: Bool) {
        guard let options = options else { return }
        if selected {
            monthYearLabel.textColor = options.selectedTextColor
        }
        else {
            monthYearLabel.textColor = options.textColor
        }
    }

    override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
        self.options = options
        let calendarItem = pagingItem as! CalendarItem
        monthYearLabel.text = calendarItem.yearText + " - " + calendarItem.monthText

        updateSelectedState(selected: selected)
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let options = options else { return }

        if let attributes = layoutAttributes as? PagingCellLayoutAttributes {
            monthYearLabel.textColor = UIColor.interpolate(
                from: options.textColor,
                to: options.selectedTextColor,
                with: attributes.progress)
        }
    }
}
