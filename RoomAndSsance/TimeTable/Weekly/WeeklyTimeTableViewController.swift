//
//  WeeklyTimeTableViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/18.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import Parchment

struct WeeklyPagingItem: PagingItem, Hashable, Comparable {
    let date: Date
    let thisMon: String
    let thisSun: String
    
    init(date: Date) {
        let dateFormat = "MM.dd" // Date format
        self.date = date
        self.thisMon = self.date.getWeekDates().thisWeek.first!.toDate(format: dateFormat)
        self.thisSun = self.date.getWeekDates().thisWeek[self.date.getWeekDates().thisWeek.count - 1].toDate(format: dateFormat)
    }

    static func < (lhs: WeeklyPagingItem, rhs: WeeklyPagingItem) -> Bool {
        return lhs.date < rhs.date
    }
}

class WeeklyTimeTableViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let pagingViewController = PagingViewController()
        pagingViewController.register(WeeklyPagingCell.self, for: WeeklyPagingItem.self)
        pagingViewController.menuItemSize = .selfSizing(estimatedWidth: 165, height: 80)
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
        pagingViewController.select(pagingItem: WeeklyPagingItem(date: Date()))
    }
}

extension WeeklyTimeTableViewController: PagingViewControllerInfiniteDataSource {
  
  func pagingViewController(_: PagingViewController, itemAfter pagingItem: PagingItem) -> PagingItem? {
    let calendarItem = pagingItem as! WeeklyPagingItem
    return WeeklyPagingItem(date: calendarItem.date.addingTimeInterval(86400*7))
  }
  
  func pagingViewController(_: PagingViewController, itemBefore pagingItem: PagingItem) -> PagingItem? {
    let calendarItem = pagingItem as! WeeklyPagingItem
    return WeeklyPagingItem(date: calendarItem.date.addingTimeInterval(-86400*7))
  }
  
  func pagingViewController(_: PagingViewController, viewControllerFor pagingItem: PagingItem) -> UIViewController {
//    let calendarItem = pagingItem as! CalendarItem
//    let formattedDate = DateFormatters.shortDateFormatter.string(from: calendarItem.date)
//    return ContentViewController(title: formattedDate)
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let weeklyCollectionVC = storyboard.instantiateViewController(withIdentifier: "WeeklyCollectionVC")
    
    return weeklyCollectionVC
  }
}

extension Date {
    func getWeekDates() -> (thisWeek: [Date], nextWeek: [Date]) {
        var tuple: (thisWeek: [Date], nextWeek: [Date])
        var arrThisWeek: [Date] = []
        
        for i in 0..<7 {
            arrThisWeek.append(Calendar.current.date(byAdding: .day, value: i, to: startOfWeek)!)
        }
        
        var arrNextWeek: [Date] = []
        
        for i in 1...7 {
            arrNextWeek.append(Calendar.current.date(byAdding: .day, value: i, to: arrThisWeek.last!)!)
        }
        tuple = (thisWeek: arrThisWeek, nextWeek: arrNextWeek)
        return tuple
    }

    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }

    var startOfWeek: Date {
        let gregorian = Calendar(identifier: .gregorian)
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        return gregorian.date(byAdding: .day, value: 1, to: sunday!)!
    }

    func toDate(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
