//
//  ViewController.swift
//  App
//
//  Copyright © 2015. All rights reserved.
//

import Foundation
import UIKit
import Cartography

class ViewController : UIViewController {
    
    // MARK: - ViewController
    
    func setupView() {
        
        // hook for subclass
    }
    
    func setupNavigationBar() {
        
        // hook for subclasses
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func setUpNavigationBarImage() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
//        let logo = UIImageView(image: UIImage(named: "eastCoastHeaderLogo"))
//        
//        logo.contentMode = .scaleAspectFit
//        
//        headerView.addSubview(logo)
//        
//        constrain(logo, headerView) { logo, headerView in
//            logo.leading == headerView.leading + 10
//            logo.trailing == headerView.trailing - 30
//            logo.top == headerView.top + 10
//            logo.bottom == headerView.bottom - 20
//        }
        
        navigationItem.titleView = headerView
    }
    
    func setUpNavigationBarImageLeft() {
        
        let logoImage = UIImage(named: "goals")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 40.0)
        let leftBarItem = UIBarButtonItem(customView: logoImageView)
        navigationItem.leftBarButtonItem = leftBarItem
        
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupNavigationBar()
        setupView()
    }
}
