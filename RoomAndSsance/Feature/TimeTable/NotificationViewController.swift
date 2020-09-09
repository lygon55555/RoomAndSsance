//
//  NotificationViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/09/09.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class NotificationViewController: UIViewController {
    @IBOutlet var notificationTableView: UITableView!
    
    override func viewDidLoad() {
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        
        let leftButton = UIButton(type: UIButton.ButtonType.custom)
        leftButton.setImage(UIImage(named: "back"), for: .normal)
        leftButton.addTarget(self, action:#selector(goBack), for: .touchDown)
        leftButton.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItems = [leftBarButton]
        
        self.navigationController?.navigationBar.setValue(false, forKey: "hidesShadow")
        self.navigationItem.title = "알림"
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationTableViewCell
        cell.titleLabel.text = "룸엔상스 회원가입을 축하합니다."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
