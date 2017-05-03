//
//  GoalsViewController.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit
import Cartography

class GoalsViewController: TableViewController<GoalsListDisplayItem>, GoalsViewInput {
    
    var eventHandler: GoalsViewOutput!
    
    override var lazyTableViewDataSource:TableViewDataSource<GoalsListDisplayItem> {
        let reuseIdentifier = GoalsListTableViewCell.reuseIdentifier()
        let temp = GoalsListTableViewDataSource(reuseIdentifier: reuseIdentifier)
        
        temp.setupCellWithObjectForIndexPath = { (cell, object, indexPath) ->
            Void in
            if indexPath.row == 0 {
                _ = cell as! GoalsAddNewListTableViewCell
            } else {
                let cell = cell as! GoalsListTableViewCell
                cell.setupWith(display: object)
            }
        }
        
        return temp
    }
    
    override var lazyTableViewDelegate:TableViewDelegate<GoalsListDisplayItem> {
        let temp = GoalsTableViewDelegate()
        
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
        tableView.register(GoalsAddNewListTableViewCell.nib(), forCellReuseIdentifier: GoalsAddNewListTableViewCell.reuseIdentifier())
        
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        navigationItem.title = NSLocalizedString("Goals", comment: "")
        setUpNavigationBarImageLeft()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "hamburger.png"), style: .plain, target: self, action: #selector(self.didTapMenuBarButton(button:)))
    }
    
    // MARK: - UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler.viewWillAppear(animated: animated)        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc private func didTapMenuBarButton(button: UIBarButtonItem) {
        eventHandler.openMenu()
    }
    
    // MARK: - GoalsViewInput

}

class GoalsTableViewDelegate: TableViewDelegate<GoalsListDisplayItem> {
    
    private let rowHeight: CGFloat = 60
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
}

class GoalsListTableViewDataSource: TableViewDataSource <GoalsListDisplayItem> {
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = indexPath.row == 0 ? GoalsAddNewListTableViewCell.reuseIdentifier() : GoalsListTableViewCell.reuseIdentifier()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        // callback to setup cell
        if let closure = setupCellWithObject {
            let object = objectWithCell(cell: cell, indexPath: indexPath as NSIndexPath)
            closure(cell, object)
        } else if let closureWithIndexPath = setupCellWithObjectForIndexPath {
            let object = objectWithCell(cell: cell, indexPath: indexPath as NSIndexPath)
            closureWithIndexPath(cell, object, indexPath as NSIndexPath)
        }
        
        return cell
    }
    
//    override func tableView(
//        tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let object = objectWithCell(nil, indexPath: indexPath)
//        let reuseIdentifier = object.reuseIdentifier
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
//        
//        // callback to setup cell
//        if let closure = setupCellWithObject {
//            let object = objectWithCell(cell, indexPath: indexPath)
//            
//            closure(cell: cell, object: object)
//        } else if let closureWithIndexPath = setupCellWithObjectForIndexPath {
//            let object = objectWithCell(cell, indexPath: indexPath)
//            
//            closureWithIndexPath(cell: cell, object: object, indexPath: indexPath)
//        }
//        
//        return cell
//    }
}

