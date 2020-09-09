//
//  HistoryLikeViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/31.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class HistoryLikeViewController: UIViewController {
    
    @IBOutlet var historyLikeTableView: UITableView!
    
    override func viewDidLoad() {
        historyLikeTableView.delegate = self
        historyLikeTableView.dataSource = self
        
        historyLikeTableView.isScrollEnabled = false
    }
}

extension HistoryLikeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyTestCell2", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row+1)"
        return cell
    }
}
