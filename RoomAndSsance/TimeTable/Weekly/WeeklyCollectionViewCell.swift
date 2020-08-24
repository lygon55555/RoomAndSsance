//
//  WeeklyCollectionViewCell.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/19.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class WeeklyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var classTableView: UITableView!
    
    var ntdlArray = ["신생아 마사지", "포토샵 클래스", "좋은 시 쓰기"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        classTableView.delegate = self
        classTableView.dataSource = self
    }
}

extension WeeklyCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ntdlArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath) as! ClassTableViewCell
        cell.titleLabel.text = ntdlArray[indexPath.row]
        cell.backView.layer.cornerRadius = 12
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 161
    }
}
