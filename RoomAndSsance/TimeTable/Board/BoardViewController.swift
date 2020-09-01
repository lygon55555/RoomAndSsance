//
//  BoardViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/31.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import Parchment

class BoardViewController: UIViewController {
    
    @IBOutlet var boardView: UIView!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        let leftButton = UIButton(type: UIButton.ButtonType.custom)
        leftButton.setImage(UIImage(named: "back"), for: .normal)
        leftButton.addTarget(self, action:#selector(goBack), for: .touchDown)
        leftButton.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItems = [leftBarButton]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let roomNoticeVC = storyboard.instantiateViewController(withIdentifier: "RoomNoticeVC")
        let roomCommunityVC = storyboard.instantiateViewController(withIdentifier: "RoomCommunityVC")
        
        let pagingViewController = PagingViewController(viewControllers: [
          roomNoticeVC,
          roomCommunityVC
        ])
            
        addChild(pagingViewController)
        boardView.addSubview(pagingViewController.view)
        boardView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.indicatorColor = UIColor(red: 0.651, green: 0.435, blue: 0.898, alpha: 1)
        pagingViewController.menuInteraction = .none
        pagingViewController.textColor = UIColor(red: 0.733, green: 0.733, blue: 0.733, alpha: 1)
        pagingViewController.selectedTextColor = UIColor(red: 0.267, green: 0.267, blue: 0.267, alpha: 1)
        pagingViewController.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        pagingViewController.selectedFont = UIFont.systemFont(ofSize: 28, weight: .bold)
        pagingViewController.menuItemSize = .fixed(width: UIScreen.main.bounds.width*170/375, height: UIScreen.main.bounds.height*65/667)
        pagingViewController.menuInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.backgroundColor = UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        pagingViewController.menuBackgroundColor = UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        pagingViewController.selectedBackgroundColor = UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        pagingViewController.indicatorOptions = .visible(height: 5, zIndex: 0,
                                                         spacing: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20),
                                                         insets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
