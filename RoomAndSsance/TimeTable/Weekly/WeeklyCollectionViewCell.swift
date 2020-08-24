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
    
    var ntdlArray = ["Play Video Games", "Eat out", "Watch Netflix"]
    
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
        cell.title.text = ntdlArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 17.5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 17.5
    }
}
