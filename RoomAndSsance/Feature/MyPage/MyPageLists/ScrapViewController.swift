//
//  ScrapViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/24.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class ScrapViewController: UIViewController {
    
    @IBOutlet var scrapTableView: UITableView!
    
    override func viewDidLoad() {
        scrapTableView.isScrollEnabled = false
        scrapTableView.delegate = self
        scrapTableView.dataSource = self
    }
}

extension ScrapViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row+1)"
        return cell
    }
}
