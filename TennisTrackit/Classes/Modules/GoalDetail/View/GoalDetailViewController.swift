//
//  GoalDetailViewController.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit

class GoalDetailViewController: ViewController, GoalDetailViewInput {
    
    var eventHandler: GoalDetailViewOutput!
    
    // MARK: - ViewController

    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        setUpNavigationBarImageLeft()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "hamburger.png"), style: .plain, target: self, action: #selector(self.didTapMenuBarButton(button:)))
    }
    
    override func setupView() {
        
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler.viewWillAppear(animated: animated)
    }
    
    @objc private func didTapMenuBarButton(button: UIBarButtonItem) {
        eventHandler.openMenu()
    }
    
    // MARK: - GoalDetailViewInput
    
    func setupView(goal: GoalDetailDataItem?) {
        
        if let goal = goal {
            navigationItem.title = goal.title
        } else {
            navigationItem.title = "New goal".localized()
        }
        
        
    }

}
