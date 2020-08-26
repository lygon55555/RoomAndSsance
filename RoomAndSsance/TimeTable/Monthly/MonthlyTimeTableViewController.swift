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

// First thing we need to do is create our own PagingItem that will
// hold our date. We need to make sure it conforms to Hashable and
// Comparable, as that is required by PagingViewController. We also
// cache the formatted date strings for performance.
struct CalendarItem: PagingItem, Hashable, Comparable {
    let date: Date
    let monthText: String
    let yearText: String

    init(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        
        self.date = date
        self.monthText = dateFormatter.string(from: date)
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
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        )
        
        // Add the paging view controller as a child view
        // controller and constrain it to all edges
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)

        // Set our custom data source
        pagingViewController.infiniteDataSource = self

        // Set the current date as the selected paging item
        pagingViewController.select(pagingItem: CalendarItem(date: Date()))
    }
}

// We need to conform to PagingViewControllerDataSource in order to
// implement our custom data source. We set the initial item to be the
// current date, and every time pagingItemBeforePagingItem: or
// pagingItemAfterPagingItem: is called, we either subtract or append
// the time interval equal to one day. This means our paging view
// controller will show one menu item for each day.
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
        //    let calendarItem = pagingItem as! CalendarItem
        //    let formattedDate = DateFormatters.shortDateFormatter.string(from: calendarItem.date)
        //    return ContentViewController(title: formattedDate)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let calendarVC = storyboard.instantiateViewController(withIdentifier: "CalendarVC")

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
