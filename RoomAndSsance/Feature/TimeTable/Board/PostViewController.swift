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
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.isTranslucent = false
        
        let leftButton = UIButton(type: UIButton.ButtonType.custom)
        leftButton.setImage(UIImage(named: "back"), for: .normal)
        leftButton.addTarget(self, action:#selector(goBack), for: .touchDown)
        leftButton.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItems = [leftBarButton]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textViewHeight.constant = self.textView.contentSize.height
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
