//
//  WeeklyCollectionViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/19.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

class WeeklyCollectionViewController: UICollectionViewController, HorizontalFloatingHeaderLayoutDelegate {

    //MARK: - Configure methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        func configureCollectionView() {
            collectionView?.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
        
        func configureHeaderCell() {
            let headerNib = UINib(nibName: "HeaderView", bundle: nil)
            collectionView?.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
        }
        
        configureCollectionView()
        configureHeaderCell()
    }

    // MARK: - UICollectionView methods
    //MARK: Datasource
    //Number of Sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }

    //Number of Items
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    //Cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeeklyCell", for: indexPath) as! WeeklyCollectionViewCell
        return cell
    }
    
    //Headers
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath)
        return header
    }

    //MARK: Delegate (HorizontalFloatingHeaderDelegate)
    //Item Size
    func collectionView(_ collectionView: UICollectionView, horizontalFloatingHeaderItemSizeAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width:100, height: 48)
        return CGSize(width:153, height: 300)
    }
    
    //Header Size
    func collectionView(_ collectionView: UICollectionView, horizontalFloatingHeaderSizeAt section: Int) -> CGSize {
//        return CGSize(width:160, height:30)
        return CGSize(width:153, height:58)
    }
    
    //Item Spacing
    func collectionView(_ collectionView: UICollectionView, horizontalFloatingHeaderItemSpacingForSectionAt section: Int) -> CGFloat {
//        return 8.0
        return 35
    }
    
    //Line Spacing
    func collectionView(_ collectionView: UICollectionView, horizontalFloatingHeaderColumnSpacingForSectionAt section: Int) -> CGFloat {
//        return 8.0
        return 13
    }
    
    //Section Insets
    func collectionView(_ collectionView: UICollectionView, horizontalFloatingHeaderSectionInsetAt section: Int) -> UIEdgeInsets {
        
        switch section{
        case 0:
            return UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        default:
            return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0)
        }
    }
}
