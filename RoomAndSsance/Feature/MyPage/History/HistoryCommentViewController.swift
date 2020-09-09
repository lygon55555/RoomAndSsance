//
//  HistoryCommentViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/31.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class HistoryCommentViewController: UIViewController {
    @IBOutlet var historyCommentTableView: UITableView!
    
    override func viewDidLoad() {
        historyCommentTableView.delegate = self
        historyCommentTableView.dataSource = self
        
        historyCommentTableView.isScrollEnabled = false
    }
}

extension HistoryCommentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyTestCell1", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row+1)"
        return cell
    }
}
