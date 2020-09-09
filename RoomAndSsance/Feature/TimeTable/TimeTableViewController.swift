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

        self.navigationController?.navigationBar.isHidden = false

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
        
        let rightButton = UIButton(type: UIButton.ButtonType.custom)
        rightButton.setImage(UIImage(named: "notice0"), for: .normal)
        rightButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 0)
        
        rightButton.addTarget(self, action:#selector(goToNotification), for: .touchDown)
        rightButton.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        let rightBarButton = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItems = [rightBarButton]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func goToNotification() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let notificationVC = storyboard.instantiateViewController(withIdentifier: "NotificationVC")
        self.navigationController?.pushViewController(notificationVC, animated: true)
    }
}
