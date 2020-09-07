//
//  ProfileSettingViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/09/07.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class ProfileSettingViewController: UIViewController {
    override func viewDidLoad() {
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let leftButton = UIButton(type: UIButton.ButtonType.custom)
        leftButton.setImage(UIImage(named: "back"), for: .normal)
        leftButton.addTarget(self, action:#selector(goBack), for: .touchDown)
        leftButton.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItems = [leftBarButton]
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func done() {
        // 프로필 설정 완료
    }
}
