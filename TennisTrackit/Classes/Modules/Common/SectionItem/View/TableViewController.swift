//
//  TableViewController.swift
//  App
//
//  Copyright © 2015. All rights reserved.
//

import Foundation
import Cartography
import UIKit

class TableViewController<T: SectionItem>: UIViewController, SectionItemViewInput {
    
    lazy var tableViewController: UITableViewController = {
       let temp = UITableViewController()

        self.addAndInformChildViewController(childViewController: temp, toView:self.view)

        return temp
    }()
    var tableView: UITableView {
        get {
            return tableViewController.tableView
        }
    }
    lazy var tableViewDataSource: TableViewDataSource<T>? = self.lazyTableViewDataSource
    var lazyTableViewDataSource: TableViewDataSource<T>? { return nil }
    lazy var tableViewDelegate: TableViewDelegate<T>? = self.lazyTableViewDelegate
    var lazyTableViewDelegate: TableViewDelegate<T>? { return nil }
    
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
    
    // MARK: - TableViewController
    
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
    
    func setupTableView() {
     
        edgesForExtendedLayout = [UIRectEdge.bottom]
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
    }
    
    func setUpNavigationBarImageLeft() {
        
        let logoImage = UIImage(named: "goals")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 40.0)
        let leftBarItem = UIBarButtonItem(customView: logoImageView)
        navigationItem.leftBarButtonItem = leftBarItem

    }
    
    func setUpNavigationBarImageRight() {
        
        let logoImage = UIImage(named: "goals")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 40.0)
        let rightBarItem = UIBarButtonItem(customView: logoImageView)
        navigationItem.rightBarButtonItem = rightBarItem
        
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
    }
    
    // MARK: - SectionItemViewInput
    
    func showEmpty(empty: Bool) {
        
        emptyView.isHidden = !empty
        tableView.isScrollEnabled = !empty
        
        if empty {
            tableView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        }
    }
    
    func updateWithSectionItemDisplayDataCollection(collection: SectionItemDisplayDataCollection, reloadData: Bool) {
        
        tableViewDataSource?.data = collection
        
        if reloadData {
            tableView.reloadData()
        }
    }
    
    func updateSectionItemDisplayDataCollectionByAppendingItems(displayDataItems: [SectionItem]) {
        
        if let data = tableViewDataSource?.data {
            let indexPaths = data.appendItems(items: displayDataItems)
            
            tableView.insertRows(at: indexPaths as [IndexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    func reloadDisplayDataItem(displayDataItem: SectionItem) {
        
        let indexPath = tableViewDataSource?.data.indexPathForItem(item: displayDataItem)
        
        tableView.reloadRows(at: [indexPath! as IndexPath], with: UITableViewRowAnimation.bottom)
    }
}
