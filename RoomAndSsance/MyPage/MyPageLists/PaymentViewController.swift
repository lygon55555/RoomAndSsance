//
//  PaymentViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/24.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet var paymentTableView: UITableView!
    
    override func viewDidLoad() {
        paymentTableView.isScrollEnabled = false
        paymentTableView.delegate = self
        paymentTableView.dataSource = self
    }
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row+1)"
        return cell
    }
}
