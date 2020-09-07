//
//  HistoryViewController.swift
//  RoomAndSsance
//
//  Created by Yonghyun on 2020/08/31.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit
import Parchment

class HistoryViewController: UIViewController {
    
    @IBOutlet var bottomPagingView: UIView!
    @IBOutlet var bottomPagingViewHeight: NSLayoutConstraint!
    
    var pageIndex: Int?
    
    let mainstoryboard = UIStoryboard(name: "Main", bundle: nil)
    lazy var historyPostVC = mainstoryboard.instantiateViewController(withIdentifier: "HistoryPostVC") as! HistoryPostViewController
    lazy var historyCommentVC = mainstoryboard.instantiateViewController(withIdentifier: "HistoryCommentVC") as! HistoryCommentViewController
    lazy var historyLikeVC = mainstoryboard.instantiateViewController(withIdentifier: "HistoryLikeVC") as! HistoryLikeViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pagingViewController = PagingViewController(viewControllers: [
          historyPostVC,
          historyCommentVC,
          historyLikeVC
        ])
        
        addChild(pagingViewController)
        bottomPagingView.addSubview(pagingViewController.view)
        bottomPagingView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.indicatorColor = UIColor.black
        pagingViewController.menuInteraction = .none
        pagingViewController.textColor = UIColor.black
        pagingViewController.selectedTextColor = UIColor.black
        pagingViewController.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        pagingViewController.selectedFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        pagingViewController.menuItemSize = .fixed(width: UIScreen.main.bounds.width*110/375, height: UIScreen.main.bounds.height*44/667)
        pagingViewController.menuInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        pagingViewController.menuHorizontalAlignment = .center
        pagingViewController.indicatorOptions = .visible(height: 3, zIndex: 0, spacing: .zero, insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        pagingViewController.delegate = self
        
        if let index = pageIndex {
            pagingViewController.select(index: index)
        }
        
        let leftButton = UIButton(type: UIButton.ButtonType.custom)
        leftButton.setImage(UIImage(named: "back"), for: .normal)
        leftButton.addTarget(self, action:#selector(goBack), for: .touchDown)
        leftButton.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItems = [leftBarButton]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bottomPagingViewHeight.constant = historyPostVC.historyPostTableView.contentSize.height + 50
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension HistoryViewController: PagingViewControllerDelegate {
    func pagingViewController(_ pagingViewController: PagingViewController, didScrollToItem pagingItem: PagingItem, startingViewController: UIViewController?, destinationViewController: UIViewController, transitionSuccessful: Bool) {
        if transitionSuccessful {
            if startingViewController is HistoryPostViewController {
                if destinationViewController is HistoryCommentViewController {
                    bottomPagingViewHeight.constant = historyCommentVC.historyCommentTableView.contentSize.height + 50
                }
                else {
                    bottomPagingViewHeight.constant = historyLikeVC.historyLikeTableView.contentSize.height + 50
                }
            }
            
            if startingViewController is HistoryLikeViewController {
                if destinationViewController is HistoryCommentViewController {
                    bottomPagingViewHeight.constant = historyCommentVC.historyCommentTableView.contentSize.height + 50
                }
                else {
                    bottomPagingViewHeight.constant = historyPostVC.historyPostTableView.contentSize.height + 50
                }
            }
            
            if startingViewController is HistoryCommentViewController {
                if destinationViewController is HistoryPostViewController {
                    bottomPagingViewHeight.constant = historyPostVC.historyPostTableView.contentSize.height + 50
                }
                else {
                    bottomPagingViewHeight.constant = historyLikeVC.historyLikeTableView.contentSize.height + 50
                }
            }
        }
    }
}
