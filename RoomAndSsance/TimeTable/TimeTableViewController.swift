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

        self.navigationController?.navigationBar.isHidden = true

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let weeklyTimeTableViewController = storyboard.instantiateViewController(withIdentifier: "WeeklyTimeTableVC")
        let monthlyTimeTableViewController = storyboard.instantiateViewController(withIdentifier: "MonthlyTimeTableVC")
        
        let pagingViewController = PagingViewController(viewControllers: [
          weeklyTimeTableViewController,
          monthlyTimeTableViewController
        ])
        
        addChild(pagingViewController)
        timeTableView.addSubview(pagingViewController.view)
        timeTableView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.indicatorColor = UIColor(red: 0.651, green: 0.435, blue: 0.898, alpha: 1)
        pagingViewController.menuInteraction = .none
        pagingViewController.textColor = UIColor(red: 0.733, green: 0.733, blue: 0.733, alpha: 1)
        pagingViewController.selectedTextColor = UIColor(red: 0.267, green: 0.267, blue: 0.267, alpha: 1)
        pagingViewController.borderOptions = .hidden
        pagingViewController.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        pagingViewController.selectedFont = UIFont.systemFont(ofSize: 28, weight: .bold)
        pagingViewController.menuItemSize = .fixed(width: UIScreen.main.bounds.width*170/375, height: UIScreen.main.bounds.height*44/667)
        pagingViewController.menuInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.indicatorOptions = .visible(height: 5, zIndex: 0,
                                                            spacing: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10),
                                                            insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}
