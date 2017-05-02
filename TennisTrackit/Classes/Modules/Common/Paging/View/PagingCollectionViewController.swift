//
//  PagingCollectionViewController.swift
//  App
//
//  Copyright © 2017 All rights reserved.
//

import Foundation
import Cartography
import UIKit
import SwiftyTimer
import DKChainableAnimationKit

class PagingCollectionViewController<T: SectionItem> : CollectionViewController<T>, PagingViewInput {
    
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
            temp.top == view.top + self.collectionView.contentInset.top
        }
        
        return temp
    }()
    
    var pulledToRefresh: (() -> Void)? {
        didSet {
            setupRefreshControl()
        }
    }
    
    lazy private var refreshControl: UIRefreshControl = {
        let temp = UIRefreshControl()
        
        temp.addTarget(self, action: #selector(getter: PagingCollectionViewController.pulledToRefresh), for: UIControlEvents.valueChanged)

        
        return temp
    }()
    
    private var showingStaleDataWarning = false
    
    var approachingEndOfContent: (() -> Void)? {
        didSet {
            setupEndOfContentListener()
        }
    }
    
    // MARK: - PagingCollectionViewController
    
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
            collectionView.addSubview(refreshControl)
            collectionView.alwaysBounceVertical = true;
        }
    }
    
    private func setupEndOfContentListener() {
        
        collectionViewDelegate?.approachingLastCell = { () -> Void in
            if let closure = self.approachingEndOfContent {
                closure()
            }
        }
    }
    
    // MARK: - CollectionViewController
    
    override func setupCollectionView() {
        
        super.setupCollectionView()
        
        collectionView.register(PagingLoadingView.nib(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter,
            withReuseIdentifier: PagingLoadingView.reuseIdentifier())
    }
    
    // MARK: - PagingViewInput
    
    func showLoading(loading: Bool, forEmpty empty: Bool) {

        if !loading && true == refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
        
        collectionViewDelegate?.loading = loading
        collectionView.collectionViewLayout.invalidateLayout()
        
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
        let alertController = UIAlertController(title: NSLocalizedString("Error", comment: ""), message: NSLocalizedString("Failed to load page \(page)", comment: ""), preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .cancel, handler: nil))
        self.present(alertController, animated: false, completion: nil)
    }
    
    func endRefreshing() {
        
        refreshControl.endRefreshing()
    }
}
