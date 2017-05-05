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
    
    @IBOutlet var subtasksView: UIView!
    
    @IBOutlet var addSubtaskButton: UIButton! {
        didSet {
            addSubtaskButton.setTitle("+ Add subtask".localized(), for: .normal)
            addSubtaskButton.setTitleColor(Color.homeDarkOlive(), for: .normal)
        }
    }
    
    @IBOutlet var doneButton: CheckboxButton!
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Tap to add title".localized()
            titleLabel.textColor = UIColor.gray
            titleLabel.font = Font.mediumFontWithSketchSize(size: Font.size16)
            titleLabel.isUserInteractionEnabled = true
        }
    }
    
    @IBOutlet var descLabel: UILabel! {
        didSet {
            descLabel.text = "Tap to add description".localized()
            descLabel.textColor = UIColor.gray
            descLabel.font = Font.lightFontWithSketchSize(size: Font.size16)
            descLabel.numberOfLines = 15
            descLabel.isUserInteractionEnabled = true
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
            tagsLabel.text = "#untagged".localized()
            tagsLabel.numberOfLines = 0
            tagsLabel.font = Font.lightFontWithSketchSize(size: Font.size14)
            tagsLabel.textColor = UIColor.lightGray
            tagsLabel.isUserInteractionEnabled = true
        }
    }
    
    // MARK: - ViewController

    @IBAction func didTapAddSubtaskButton(_ sender: UIButton) {
        // TODO: - Add subtask
    }

    @IBAction func didTapDoneButton(_ sender: CheckboxButton) {
        // TODO: - Set goal as done
    }
    
    @objc private func didTapLabel(sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            guard let tappedLabel = sender.view as? UILabel else {
                return
            }
            print(tappedLabel.text)
            // TODO: - Change to textfield
        }
        
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        setUpNavigationBarImageLeft()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "hamburger.png"), style: .plain, target: self, action: #selector(self.didTapMenuBarButton(button:)))
    }
    
    override func setupView() {
        let titleGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(didTapLabel(sender:)))
        titleLabel.addGestureRecognizer(titleGestureRecogniser)
        
        let descGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(didTapLabel(sender:)))
        descLabel.addGestureRecognizer(descGestureRecogniser)
        
        let tagsGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(didTapLabel(sender:)))
        tagsLabel.addGestureRecognizer(tagsGestureRecogniser)
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
    
    func setupView(goal: GoalDetailDisplayDataItem?) {
        
        // TODO: - Setup subtasks

        if let goal = goal {
            navigationItem.title = goal.title
            titleLabel.text = goal.title
            doneButton.isChecked = goal.done
            
            if nil != goal.description {
                descLabel.text = goal.description
            }
            
            if nil != goal.tags {
                tagsLabel.text = goal.tags!
            }
        } else {
            navigationItem.title = "New goal".localized()
        }
        
    }

}
