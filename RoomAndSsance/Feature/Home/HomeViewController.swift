//
//  HomeViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/19.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.setValue(false, forKey: "hidesShadow")
    }
}
