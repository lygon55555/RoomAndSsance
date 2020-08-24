//
//  RoomCommunityViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/24.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class RoomCommunityViewController: UIViewController {
    @IBOutlet var communityTableView: UITableView!
    
    override func viewDidLoad() {
        communityTableView.delegate = self
        communityTableView.dataSource = self
    }
}

extension RoomCommunityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCommunityCell", for: indexPath) as! RoomCommunityTableViewCell
        return cell
    }
}
