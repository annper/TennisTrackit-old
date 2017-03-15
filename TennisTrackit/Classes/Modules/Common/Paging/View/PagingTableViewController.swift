//
//  PagingTableViewController.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation
import Cartography
import UIKit
import SwiftyTimer
import DKChainableAnimationKit

class PagingTableViewController<T: SectionItem> : TableViewController<T>, PagingViewInput {
    
    lazy private var loadingTableFooterView: PagingLoadingView = {
        let temp = PagingLoadingView.viewWithDerivedNibName() as! PagingLoadingView
        
        return temp
    }()
    
    lazy private var staleDataView: PagingStaleDataView = {
        let temp = PagingStaleDataView.viewWithDerivedNibName() as! PagingStaleDataView
        
        temp.alpha = 0
        self.view.addSubview(temp)
        
        constrain(temp, self.view) { temp, view in
            temp.centerX == view.centerX
            temp.width == view.width
            temp.top == view.top + self.tableView.contentInset.top
        }
        
        return temp
    }()
    
    private var showingStaleDataWarning = false
    
    var pulledToRefresh: (() -> Void)? {
        didSet {
            setupRefreshControl()
        }
    }
    
    var approachingEndOfContent: (() -> Void)? {
        didSet {
            setupEndOfContentListener()
        }
    }
    
    // MARK: - PagingTableViewController
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func pulledToRefresh(refreshControl: UIRefreshControl) {
        
        if let closure = pulledToRefresh {
            closure()
        }
    }
    
    private func setupRefreshControl() {
        
        if nil != pulledToRefresh {
            tableViewController.refreshControl = UIRefreshControl()
            
            tableViewController.refreshControl?.addTarget(self, action: #selector(getter: pulledToRefresh), for: UIControlEvents.valueChanged)
        }
    }
    
    private func setupEndOfContentListener() {
        
        tableViewDelegate?.approachingLastCell = { () -> Void in
            if let closure = self.approachingEndOfContent {
                closure()
            }
        }
    }
    
    // MARK: - PagingViewInput
    
    func showLoading(loading: Bool, forEmpty empty: Bool) {
        
        if loading {
            tableView.tableFooterView = loadingTableFooterView
        } else {
            if true == tableViewController.refreshControl?.isRefreshing {
                tableViewController.refreshControl?.endRefreshing()
            }
            
            tableView.tableFooterView = UIView()
        }
        
        showEmpty(empty: !loading && empty)
    }
    
    func showWarningForStaleDataOnPage(page: Int) {
        
        // only show for first page loads
        if 0 != page {
            return;
        }
        
        // ensure animations don't overlap
        if showingStaleDataWarning {
            return;
        }
        
        showingStaleDataWarning = true
        
        staleDataView.animation
            .makeAlpha(1).thenAfter(0.35.seconds)
            .makeAlpha(0).delay(3.seconds).animate(0.35.seconds)
            .animationCompletion = {
                self.showingStaleDataWarning = false
        }
    }
    
    func showErrorForFailedToLoadPage(page: Int) {
        UIAlertView(title: NSLocalizedString("Error", comment: ""),
                    message: NSLocalizedString("Failed to load page \(page)", comment: ""),
                    delegate: nil, cancelButtonTitle: NSLocalizedString("Ok", comment: "")).show()
    }
    
    func endRefreshing() {
        
        tableViewController.refreshControl?.endRefreshing()
    }
}
