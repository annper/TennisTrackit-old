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
    
    private let screenWidth = UIScreen.main.bounds.width
    
    // MARK: - IBOUtlets
    
    @IBOutlet var contentViewWidthConstraint: NSLayoutConstraint! {
        didSet {
            contentViewWidthConstraint.constant = screenWidth
        }
    }
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Tap to add title"
            titleLabel.textColor = UIColor.gray
            titleLabel.font = Font.mediumFontWithSketchSize(size: Font.size16)
        }
    }
    
    @IBOutlet var descLabel: UILabel! {
        didSet {
            descLabel.text = "Tap to add description"
            descLabel.textColor = UIColor.gray
            descLabel.font = Font.lightFontWithSketchSize(size: Font.size16)
            descLabel.numberOfLines = 15
        }
    }
    
    @IBOutlet var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = Color.homeDarkOlive()
            separatorView.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet var secondSeparatorView: UIView! {
        didSet {
            secondSeparatorView.backgroundColor = Color.homeDarkOlive()
            secondSeparatorView.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet var tagsLabel: UILabel! {
        didSet {
            tagsLabel.text = "#untagged"
            tagsLabel.numberOfLines = 0
            tagsLabel.font = Font.lightFontWithSketchSize(size: Font.size14)
            tagsLabel.textColor = UIColor.lightGray
        }
    }
    
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
