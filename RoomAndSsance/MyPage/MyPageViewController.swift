//
//  MyPageViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/20.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import Parchment

struct ImageItem: PagingItem, Hashable, Comparable {
  let index: Int
  let title: String
  let headerImage: UIImage
  let images: [UIImage]
  
  static func < (lhs: ImageItem, rhs: ImageItem) -> Bool {
    return lhs.index < rhs.index
  }
}

class MyPageViewController: UIViewController {
    
    @IBOutlet var myPagePagingView: UIView!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myRoomVC = storyboard.instantiateViewController(withIdentifier: "MyRoomVC")
        let scrapVC = storyboard.instantiateViewController(withIdentifier: "ScrapVC")
        let paymentVC = storyboard.instantiateViewController(withIdentifier: "PaymentVC")
        
        let pagingViewController = PagingViewController(viewControllers: [
            myRoomVC,
            scrapVC,
            paymentVC
        ])
        
        addChild(pagingViewController)
        myPagePagingView.addSubview(pagingViewController.view)
        myPagePagingView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.indicatorColor = UIColor(red: 0.651, green: 0.435, blue: 0.898, alpha: 1)
        pagingViewController.menuInteraction = .none
        pagingViewController.textColor = UIColor(red: 0.733, green: 0.733, blue: 0.733, alpha: 1)
        pagingViewController.selectedTextColor = UIColor(red: 0.267, green: 0.267, blue: 0.267, alpha: 1)
        pagingViewController.menuItemSize = .fixed(width: UIScreen.main.bounds.width/3, height: 110)
        pagingViewController.menuHorizontalAlignment = .center
    }
}
