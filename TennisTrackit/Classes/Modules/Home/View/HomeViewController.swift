//
//  HomeViewController.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017. All rights reserved.
//

import UIKit

class HomeViewController: TableViewController<HomeListDisplayItem>, HomeViewInput {
    
    var eventHandler: HomeViewOutput!
        
    override var lazyTableViewDataSource:TableViewDataSource<HomeListDisplayItem> {
        let reuseIdentifier = HomeListTableViewCell.reuseIdentifier()
        let temp = TableViewDataSource<HomeListDisplayItem>(reuseIdentifier: reuseIdentifier)

        temp.setupCellWithObject = { (cell, object) -> Void in
            let cell = cell as! HomeListTableViewCell
            cell.setupWith(display: object)
        }
        
        return temp
    }
    
    override var lazyTableViewDelegate:TableViewDelegate<HomeListDisplayItem> {
        let temp = HomeTableViewDelegate()
        
        temp.didSelectRowAtIndexPath = { [weak self] (indexPath, object) in
			guard let strongSelf = self else { return }
            strongSelf.eventHandler.rowTappedWith(display: object)
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
        tableView.register(HomeListTableViewCell.nib(), forCellReuseIdentifier: HomeListTableViewCell.reuseIdentifier())
        
        tableView.isScrollEnabled = false
        tableView.alwaysBounceVertical = false
        tableView.separatorStyle = .none
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        setUpNavigationBarImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "hamburger.png"), style: .plain, target: self
            , action: #selector(self.didTapMenuBarButton(button:)))
        navigationItem.title = NSLocalizedString("Tennis TrackIt", comment: "")

    }
    
    // MARK: - UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler.viewWillAppear(animated: animated)
    }
    
    @objc private func didTapMenuBarButton(button: UIBarButtonItem) {
        eventHandler.openMenu()
    }
    
    // MARK: - HomeViewInput

}

class HomeTableViewDelegate: TableViewDelegate<HomeListDisplayItem> {
    
    private let rowHeight = (UIScreen.main.bounds.height - 64) / 3
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
}
