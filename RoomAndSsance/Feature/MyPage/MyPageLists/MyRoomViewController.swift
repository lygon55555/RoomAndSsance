//
//  MyRoomViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/24.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class MyRoomViewController: UIViewController {
    
    @IBOutlet var myRoomTableView: UITableView!
    
    override func viewDidLoad() {
        myRoomTableView.isScrollEnabled = false
        myRoomTableView.delegate = self
        myRoomTableView.dataSource = self
    }
}

extension MyRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row+1)"
        return cell
    }
}
