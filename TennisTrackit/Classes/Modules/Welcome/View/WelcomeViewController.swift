//
//  WelcomeViewController.swift
//  Generated using vipergen
//
//  Copyright © 2017. All rights reserved.
//

import UIKit

class WelcomeViewController: ViewController, WelcomeViewInput {
    
    var eventHandler: WelcomeViewOutput!
    
    // MARK: - ViewController

    override func setupNavigationBar() {
        super.setupNavigationBar()
        navigationItem.title = NSLocalizedString("Welcome", comment: "")
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
    
    // MARK: - WelcomeViewInput

}
