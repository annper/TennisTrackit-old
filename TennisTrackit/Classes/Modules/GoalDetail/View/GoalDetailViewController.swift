//
//  GoalDetailViewController.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit
//import AppCommon

class GoalDetailViewController: ViewController, GoalDetailViewInput {
    
    var eventHandler: GoalDetailViewOutput!
    
    // MARK: - ViewController

    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = NSLocalizedString("GoalDetail", comment: "")
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
    
    // MARK: - GoalDetailViewInput

}
