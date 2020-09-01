//
//  HistoryPostViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/31.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class HistoryPostViewController: UIViewController {
    
    @IBOutlet var historyPostTableView: UITableView!
    
    override func viewDidLoad() {
        historyPostTableView.delegate = self
        historyPostTableView.dataSource = self
        
        historyPostTableView.isScrollEnabled = false
    }
}

extension HistoryPostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyTestCell", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row+1)"
        return cell
    }
}
