//
//  CollectionViewController.swift
//  App
//
//  Copyright © 2017. All rights reserved.
//

import Foundation
import Cartography
import UIKit

class CollectionViewController<T: SectionItem>: UIViewController, SectionItemViewInput {
    
    lazy var collectionViewController: UICollectionViewController = {
        let layout = self.collectionViewLayout()
        let temp = UICollectionViewController(collectionViewLayout: layout)
        
        return temp
    }()
    var collectionView: UICollectionView {
        get {
            return collectionViewController.collectionView!
        }
    }
    lazy var collectionViewDataSource: CollectionViewDataSource<T>? = self.lazyCollectionViewDataSource
    var lazyCollectionViewDataSource: CollectionViewDataSource<T>? { return nil }
    lazy var collectionViewDelegate: CollectionViewDelegate<T>? = self.lazyCollectionViewDelegate
    var lazyCollectionViewDelegate: CollectionViewDelegate<T>? { return nil }
    
    private lazy var emptyView: EmptyView = {
        let temp = EmptyView.viewWithDerivedNibName() as! EmptyView
        
        temp.label?.text = NSLocalizedString("No Results", comment: "")
        
        self.view.addSubview(temp)
        
        constrain(temp, self.view) { temp, view in
            temp.size == view.size
            temp.center == view.center
        }
        
        return temp
    }()
    
    // MARK: - CollectionViewController
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNavigationBar() {
        
        // hook for subclasses
        
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func addCollectionViewControllerToViewHierachy() {
        addAndInformChildViewController(childViewController: collectionViewController, toView:view, topInset: 0)
    }
    
    func collectionViewLayout() -> UICollectionViewLayout {
        return UICollectionViewFlowLayout()
    }
    
    func setupCollectionView() {
        
        edgesForExtendedLayout = []
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        collectionView.backgroundColor = UIColor.white
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        addCollectionViewControllerToViewHierachy()
    }
    
    // MARK: - SectionItemViewInput
    
    func showEmpty(empty: Bool) {
        
        emptyView.isHidden = !empty
        collectionView.isScrollEnabled = !empty
        
        if empty {
            collectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        }
    }
    
    func updateWithSectionItemDisplayDataCollection(collection: SectionItemDisplayDataCollection, reloadData: Bool) {
        
        collectionViewDataSource?.data = collection
        
        if reloadData {
            collectionView.reloadData()
        }
    }
    
    func updateSectionItemDisplayDataCollectionByAppendingItems(displayDataItems: [SectionItem]) {
        
        if let data = collectionViewDataSource?.data {
            let indexPaths = data.appendItems(items: displayDataItems)
            
            collectionView.performBatchUpdates({ () -> Void in
                self.collectionView.insertItems(at: indexPaths as [IndexPath])
                }, completion: nil)
        }
    }
    
    func reloadDisplayDataItem(displayDataItem: SectionItem) {
        
        let indexPath = collectionViewDataSource?.data.indexPathForItem(item: displayDataItem)
        
        collectionView.performBatchUpdates({ () -> Void in
            self.collectionView.reloadItems(at: [indexPath! as IndexPath])
            }, completion: nil)
    }
}
