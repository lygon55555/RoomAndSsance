//
//  MonthlyTimeTableViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/18.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import Parchment

struct CalendarItem: PagingItem, Hashable, Comparable {
    let date: Date
    let monthText: String
    let yearText: String

    init(date: Date) {
        self.date = date
        self.monthText = DateFormatters.numberMonthFormatter.string(from: date)
        self.yearText = DateFormatters.yearFormatter.string(from: date)
    }

    static func < (lhs: CalendarItem, rhs: CalendarItem) -> Bool {
        return lhs.date < rhs.date
    }
}

class MonthlyTimeTableViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let pagingViewController = PagingViewController()
        pagingViewController.register(MonthlyPagingCell.self, for: CalendarItem.self)
        pagingViewController.menuItemSize = .selfSizing(estimatedWidth: 140, height: 80)
        pagingViewController.textColor = UIColor(red: 0.867, green: 0.882, blue: 0.914, alpha: 1)
        pagingViewController.selectedTextColor = UIColor.white
        pagingViewController.selectedBackgroundColor = UIColor(red: 0.533, green: 0.173, blue: 0.878, alpha: 1)
        pagingViewController.indicatorColor = UIColor(red: 0.533, green: 0.173, blue: 0.878, alpha: 1)
        pagingViewController.indicatorClass = RoundedIndicatorView.self
        pagingViewController.indicatorOptions = .visible(
            height: 35,
            zIndex: -1,
            spacing: .zero,
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 22, right: 0)
        )
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)

        pagingViewController.infiniteDataSource = self
        pagingViewController.select(pagingItem: CalendarItem(date: Date()))
    }
}

extension MonthlyTimeTableViewController: PagingViewControllerInfiniteDataSource {
    func pagingViewController(_: PagingViewController, itemAfter pagingItem: PagingItem) -> PagingItem? {
        let calendarItem = pagingItem as! CalendarItem
        let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: calendarItem.date)
        return CalendarItem(date: nextMonth!)
    }
    
    func pagingViewController(_: PagingViewController, itemBefore pagingItem: PagingItem) -> PagingItem? {
        let calendarItem = pagingItem as! CalendarItem
        let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: calendarItem.date)
        return CalendarItem(date: previousMonth!)
    }
    
    func pagingViewController(_: PagingViewController, viewControllerFor pagingItem: PagingItem) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let calendarVC = storyboard.instantiateViewController(withIdentifier: "CalendarVC") as! MonthlyCalendarViewController
        let pagingItem = pagingItem as! CalendarItem
        calendarVC.showMonth = pagingItem.monthText
        
        return calendarVC
    }
}

class RoundedIndicatorView: PagingIndicatorView {
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        layer.cornerRadius = layoutAttributes.bounds.height / 2
        layer.masksToBounds = true
    }
}
