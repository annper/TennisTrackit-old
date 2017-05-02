//
//  GoalsViewController.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalsViewController: TableViewController<GoalsListDisplayItem>, GoalsViewInput {
    
    var eventHandler: GoalsViewOutput!
        
    override var lazyTableViewDataSource:TableViewDataSource<GoalsListDisplayItem> {
        let reuseIdentifier = GoalsListTableViewCell.reuseIdentifier()
        let temp = TableViewDataSource<GoalsListDisplayItem>(reuseIdentifier: reuseIdentifier)
        
        temp.setupCellWithObject = { (cell, object) -> Void in
            let cell = cell as! GoalsListTableViewCell
            cell.textLabel!.text = object.text
        }
        
        return temp
    }
    
    override var lazyTableViewDelegate:TableViewDelegate<GoalsListDisplayItem> {
        let temp = TableViewDelegate<GoalsListDisplayItem>()
        
        temp.didSelectRowAtIndexPath = { [weak self] (indexPath, object) in
			guard let strongSelf = self else { return }
			// strongSelf.eventHandler.didBlah(..)
            print("Selected row: \(indexPath.row) in section: \(indexPath.section)")
        }
        
        return temp
    }
    
    // MARK: - TableViewController
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupTableView() {
        super.setupTableView()
        
        // configure table view
        tableView.register(GoalsListTableViewCell.nib(), forCellReuseIdentifier: GoalsListTableViewCell.reuseIdentifier())
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        navigationItem.title = NSLocalizedString("Goals", comment: "")
    }
    
    // MARK: - UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler.viewWillAppear(animated: animated)
    }
    
    // MARK: - GoalsViewInput

}
