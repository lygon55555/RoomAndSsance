//
//  ClassPageViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/21.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import Parchment

class ClassPageViewController: UIViewController {
    
    @IBOutlet var bottomPagingView: UIView!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = false
                
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let classInfoVC = storyboard.instantiateViewController(withIdentifier: "ClassInfoVC")
        let classScheduleVC = storyboard.instantiateViewController(withIdentifier: "ClassScheduleVC")
        let classReviewVC = storyboard.instantiateViewController(withIdentifier: "ClassReviewVC")
        
        // Initialize a FixedPagingViewController and pass
        // in the view controllers.
        let pagingViewController = PagingViewController(viewControllers: [
          classInfoVC,
          classScheduleVC,
          classReviewVC
        ])
        
        // Make sure you add the PagingViewController as a child view
        // controller and contrain it to the edges of the view.
        addChild(pagingViewController)
        bottomPagingView.addSubview(pagingViewController.view)
        bottomPagingView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.indicatorColor = UIColor(red: 0.651, green: 0.435, blue: 0.898, alpha: 1)
        pagingViewController.menuInteraction = .none
        pagingViewController.textColor = UIColor(red: 0.733, green: 0.733, blue: 0.733, alpha: 1)
        pagingViewController.selectedTextColor = UIColor(red: 0.267, green: 0.267, blue: 0.267, alpha: 1)
        pagingViewController.borderOptions = .hidden
        pagingViewController.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        pagingViewController.selectedFont = UIFont.systemFont(ofSize: 18, weight: .bold)
        pagingViewController.menuItemSize = .fixed(width: UIScreen.main.bounds.width/3, height: 44)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}
