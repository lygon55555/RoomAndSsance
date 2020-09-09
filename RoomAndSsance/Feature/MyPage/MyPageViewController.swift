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
    @IBOutlet var pagingViewHeight: NSLayoutConstraint!
    
    let mainstoryboard = UIStoryboard(name: "Main", bundle: nil)
    lazy var myRoomVC = mainstoryboard.instantiateViewController(withIdentifier: "MyRoomVC") as! MyRoomViewController
    lazy var scrapVC = mainstoryboard.instantiateViewController(withIdentifier: "ScrapVC") as! ScrapViewController
    lazy var paymentVC = mainstoryboard.instantiateViewController(withIdentifier: "PaymentVC") as! PaymentViewController
    let pagingViewController = PagingViewController()

    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
        
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
        pagingViewController.delegate = self
        pagingViewController.menuInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        pagingViewController.borderOptions = .hidden
        pagingViewController.indicatorOptions = .visible(height: 4, zIndex: 0,
                                                            spacing: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10),
                                                            insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 다른 탭 다녀오면 계속 실행됨
        // 다른 탭으로 이동할 때 height 기억하게 로직 수정
        
        pagingViewHeight.constant = myRoomVC.myRoomTableView.contentSize.height + 75
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
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

extension MyPageViewController: PagingViewControllerDelegate {
    func pagingViewController(_ pagingViewController: PagingViewController, didScrollToItem pagingItem: PagingItem, startingViewController: UIViewController?, destinationViewController: UIViewController, transitionSuccessful: Bool) {
        if transitionSuccessful {
            if startingViewController is MyRoomViewController {
                if destinationViewController is ScrapViewController {
                    pagingViewHeight.constant = scrapVC.scrapTableView.contentSize.height + 75
                }
                else {
                    pagingViewHeight.constant = paymentVC.paymentTableView.contentSize.height + 75
                }
            }
            
            if startingViewController is PaymentViewController {
                if destinationViewController is ScrapViewController {
                    pagingViewHeight.constant = scrapVC.scrapTableView.contentSize.height + 75
                }
                else {
                    pagingViewHeight.constant = myRoomVC.myRoomTableView.contentSize.height + 75
                }
            }
            
            if startingViewController is ScrapViewController {
                if destinationViewController is MyRoomViewController {
                    pagingViewHeight.constant = myRoomVC.myRoomTableView.contentSize.height + 75
                }
                else {
                    pagingViewHeight.constant = paymentVC.paymentTableView.contentSize.height + 75
                }
            }
        }
    }
}

extension MyPageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 선택한 사진을 프사로 등록하는 로직 구현
    }
}
