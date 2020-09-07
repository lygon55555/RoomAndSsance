//
//  PostViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/09/01.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var textViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
//        textView.sizeToFit()
//
//        var frame = self.textView.frame
//        frame.size.height = self.textView.contentSize.height
//        self.textView.frame = frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textViewHeight.constant = self.textView.contentSize.height
    }
}
