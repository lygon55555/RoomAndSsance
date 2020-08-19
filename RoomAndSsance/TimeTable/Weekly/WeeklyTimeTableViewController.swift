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

class WeeklyTimeTableViewController: UIViewController {
    override func viewDidLoad() {
      super.viewDidLoad()

      let pagingViewController = PagingViewController()
      pagingViewController.register(MonthlyPagingCell.self, for: CalendarItem.self)
      pagingViewController.menuItemSize = .fixed(width: 48, height: 58)
      pagingViewController.textColor = UIColor.gray
      
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

extension WeeklyTimeTableViewController: PagingViewControllerInfiniteDataSource {
  
  func pagingViewController(_: PagingViewController, itemAfter pagingItem: PagingItem) -> PagingItem? {
    let calendarItem = pagingItem as! CalendarItem
    return CalendarItem(date: calendarItem.date.addingTimeInterval(86400))
  }
  
  func pagingViewController(_: PagingViewController, itemBefore pagingItem: PagingItem) -> PagingItem? {
    let calendarItem = pagingItem as! CalendarItem
    return CalendarItem(date: calendarItem.date.addingTimeInterval(-86400))
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
