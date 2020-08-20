//
//  TimeTableViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/18.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import Parchment

class TimeTableViewController: UIViewController {
    
    @IBOutlet var timeTableView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load each of the view controllers you want to embed
        // from the storyboard.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let weeklyTimeTableViewController = storyboard.instantiateViewController(withIdentifier: "WeeklyTimeTableVC")
        let monthlyTimeTableViewController = storyboard.instantiateViewController(withIdentifier: "MonthlyTimeTableVC")
        
        let testVC = storyboard.instantiateViewController(withIdentifier: "WeeklyCollectionVC")

        
        // Initialize a FixedPagingViewController and pass
        // in the view controllers.
        let pagingViewController = PagingViewController(viewControllers: [
          weeklyTimeTableViewController,
          monthlyTimeTableViewController
        ])
        
        // Make sure you add the PagingViewController as a child view
        // controller and contrain it to the edges of the view.
        addChild(pagingViewController)
        timeTableView.addSubview(pagingViewController.view)
        timeTableView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.indicatorColor = UIColor(red: 0.651, green: 0.435, blue: 0.898, alpha: 1)
        pagingViewController.menuInteraction = .none
        pagingViewController.textColor = UIColor(red: 0.733, green: 0.733, blue: 0.733, alpha: 1)
        pagingViewController.selectedTextColor = UIColor(red: 0.267, green: 0.267, blue: 0.267, alpha: 1)
        pagingViewController.borderOptions = .hidden
      }
}
