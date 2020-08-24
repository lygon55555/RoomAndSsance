//
//  ClassPageViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/21.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class ClassPageViewController: UIViewController {
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}
