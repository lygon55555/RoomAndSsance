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
    
    @IBOutlet var classBackgroundView: UIView!
    @IBOutlet var classBackgroundImageView: UIImageView!
    @IBOutlet var bottomPagingView: UIView!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.isTranslucent = false
        
        let leftButton = UIButton(type: UIButton.ButtonType.custom)
        leftButton.setImage(UIImage(named: "back"), for: .normal)
        leftButton.addTarget(self, action:#selector(goBack), for: .touchDown)
        leftButton.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItems = [leftBarButton]
        
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
//        pagingViewController.borderOptions = .hidden
        pagingViewController.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        pagingViewController.selectedFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        pagingViewController.menuItemSize = .fixed(width: UIScreen.main.bounds.width*100/375, height: UIScreen.main.bounds.height*44/667)
        pagingViewController.menuInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.borderOptions = .hidden
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let topSafeArea: CGFloat
        let bottomSafeArea: CGFloat

        if #available(iOS 11.0, *) {
            topSafeArea = view.safeAreaInsets.top
            bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            topSafeArea = topLayoutGuide.length
            bottomSafeArea = bottomLayoutGuide.length
        }

        // safe area values are now available to use
        
        
        self.classBackgroundView.topAnchor.constraint(equalTo: self.classBackgroundView.superview!.topAnchor, constant: topSafeArea*(-1)).isActive = true
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */

    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
