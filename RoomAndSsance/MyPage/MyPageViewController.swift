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

class MyPageViewController: UIViewController {
    
    @IBOutlet var myPagePagingView: UIView!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
    }
}
