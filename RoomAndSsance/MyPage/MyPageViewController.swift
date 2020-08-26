//
//  MyPageViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/20.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import Parchment

struct ImageItem: PagingItem, Hashable, Comparable {
    let index: Int
    let title: String
    let selectedImage: UIImage
    let deselectedImage: UIImage

    static func < (lhs: ImageItem, rhs: ImageItem) -> Bool {
        return lhs.index < rhs.index
    }
}

class MyPageViewController: UIViewController {
    private let items = [
      ImageItem(
        index: 0,
        title: "마이 룸",
        selectedImage: UIImage(named: "scrap1")!,
        deselectedImage: UIImage(named: "scrap0")!
      ),
      ImageItem(
        index: 1,
        title: "관심 목록",
        selectedImage: UIImage(named: "scrap1")!,
        deselectedImage: UIImage(named: "scrap0")!
      ),
      ImageItem(
        index: 2,
        title: "결제 목록",
        selectedImage: UIImage(named: "payment1")!,
        deselectedImage: UIImage(named: "payment0")!
      )
    ]
    
    @IBOutlet var myPagePagingView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myRoomVC = storyboard.instantiateViewController(withIdentifier: "MyRoomVC")
        let scrapVC = storyboard.instantiateViewController(withIdentifier: "ScrapVC")
        let paymentVC = storyboard.instantiateViewController(withIdentifier: "PaymentVC")
        
        let pagingViewController = PagingViewController()
        pagingViewController.register(MyPagePagingCell.self, for: ImageItem.self)
        
        addChild(pagingViewController)
        myPagePagingView.addSubview(pagingViewController.view)
        myPagePagingView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.indicatorColor = UIColor(red: 0.651, green: 0.435, blue: 0.898, alpha: 1)
        pagingViewController.menuInteraction = .none
        pagingViewController.textColor = UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 1)
        pagingViewController.selectedTextColor = UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 1)
        pagingViewController.menuItemSize = .fixed(width: UIScreen.main.bounds.width*100/375, height: UIScreen.main.bounds.height*65/667)
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.select(pagingItem: items[0])
        pagingViewController.dataSource = self
        pagingViewController.menuInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        pagingViewController.borderOptions = .hidden
    }
    
    @IBAction func chooseProfileImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        self.present(picker, animated: true)
    }
}

extension MyPageViewController: PagingViewControllerDataSource {
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return items.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myRoomVC = storyboard.instantiateViewController(withIdentifier: "MyRoomVC")
        let scrapVC = storyboard.instantiateViewController(withIdentifier: "ScrapVC")
        let paymentVC = storyboard.instantiateViewController(withIdentifier: "PaymentVC")
        
        switch index {
        case 0: return myRoomVC
        case 1: return scrapVC
        case 2: return paymentVC
        default: return myRoomVC
        }
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return items[index]
    }
}

extension MyPageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
}

extension MyPageViewController: UIScrollViewDelegate {
    
}
