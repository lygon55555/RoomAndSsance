//
//  RoomNoticeViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/24.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class RoomNoticeViewController: UIViewController {
    @IBOutlet var noticeTableView: UITableView!
    
    override func viewDidLoad() {
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
    }
}

extension RoomNoticeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomNoticeCell", for: indexPath) as! RoomNoticeTableViewCell
        return cell
    }
}
