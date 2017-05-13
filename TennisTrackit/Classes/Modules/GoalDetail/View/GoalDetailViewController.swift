//
//  GoalDetailViewController.swift
//  Generated using vipergen
//
//  Created by Annie on 27/01/2017.
//  Copyright © 2017 Dogfish Mobile. All rights reserved.
//

import UIKit
import Cartography
import TPKeyboardAvoiding

class GoalDetailViewController: ViewController, GoalDetailViewInput, UITextFieldDelegate, UITextViewDelegate {
    
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
            titleLabel.tag = 1
        }
    }
    
    @IBOutlet var descLabel: UILabel! {
        didSet {
            descLabel.text = "Tap to add description".localized()
            descLabel.textColor = UIColor.gray
            descLabel.font = Font.lightFontWithSketchSize(size: Font.size16)
            descLabel.numberOfLines = 0
            descLabel.isUserInteractionEnabled = true
            descLabel.tag = 2
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
            tagsLabel.tag = 3
        }
    }
    
    // MARK: - Editable fields
    
    @IBOutlet var descTextViewHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var titleTextField: UITextField! {
        didSet {
            titleTextField.isHidden = true
            titleTextField.placeholder = "Add description".localized()
            titleTextField.textColor = UIColor.gray
            titleTextField.font = Font.mediumFontWithSketchSize(size: Font.size16)
            titleTextField.delegate = self
            titleTextField.tag = 4
        }
    }
    
    @IBOutlet var descTextView: UITextView! {
        didSet {
            descTextView.isHidden = true
            descTextView.text = ""
            descTextView.textColor = UIColor.gray
            descTextView.font = Font.lightFontWithSketchSize(size: Font.size16)
            descTextView.delegate = self
            descTextView.tag = 5
            descTextView.layer.borderWidth = 1
            descTextView.layer.cornerRadius = 5
            descTextView.layer.borderColor = Color.textViewBorderColor()
        }
    }
    
    @IBOutlet var tagsTextView: UITextView! {
        didSet {
            tagsTextView.isHidden = true
            tagsTextView.text = ""
            tagsTextView.textColor = UIColor.lightGray
            tagsTextView.font = Font.lightFontWithSketchSize(size: Font.size14)
            tagsTextView.delegate = self
            tagsTextView.tag = 6
            tagsTextView.layer.borderWidth = 1
            tagsTextView.layer.cornerRadius = 5
            tagsTextView.layer.borderColor = Color.textViewBorderColor()
        }
    }
    
    private func updateViewWith(tag: Int) {
        switch tag {
        case 4:
            if let textField = view.viewWithTag(tag) as? UITextField {
                titleLabel.text = textField.text
            }
        case 5:
            if let textView = view.viewWithTag(tag) as? UITextView {
                descLabel.text = textView.text
            }
        case 6:
            if let textView = view.viewWithTag(tag) as? UITextView {
                tagsLabel.text = textView.text
            }
        default: break
        }
        
    }
    
    private func resetEditMode() {
        titleLabel.isHidden = false
        descLabel.isHidden = false
        tagsLabel.isHidden = false
        
        titleTextField.isHidden = true
        descTextView.isHidden = true
        tagsTextView.isHidden = true
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
            
            resetEditMode()
            
            switch tappedLabel.tag {
            case 1: // title
                if let textField = view.viewWithTag(4) as? UITextField {
                    textField.becomeFirstResponder()
                }
                titleLabel.isHidden = true
                titleTextField.isHidden = false
            case 2: // description
                if let textView = view.viewWithTag(5) as? UITextView {
                    textView.becomeFirstResponder()
                }
                descLabel.isHidden = true
                descTextView.isHidden = false
                displayEditableDescription()
            case 3: // tags
                if let textView = view.viewWithTag(6) as? UITextView {
                    textView.becomeFirstResponder()
                }
                tagsLabel.isHidden = true
                tagsTextView.isHidden = false
            default: return
            }
            
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
    
    private func displayEditableDescription() {
        // TODO: - Resize description view
    }
    
    // MARK: - GoalDetailViewInput
    
    func setupView(goal: GoalDetailDisplayDataItem?) {
        
        // TODO: - Setup subtasks

        if let goal = goal {
            navigationItem.title = goal.title
            titleLabel.text = goal.title
            titleTextField.text = goal.title
            doneButton.isChecked = goal.done
            
            if nil != goal.description {
                descLabel.text = goal.description!
                descTextView.text = goal.description!
            }
            
            if nil != goal.tags {
                tagsLabel.text = goal.tags!
                tagsTextView.text = goal.tags!
            }
        } else {
            navigationItem.title = "New goal".localized()
        }
        
        
        // TODO: - Calculate height of desc label. desc text view will always be equal or smaller in size
    }
    
    // MARK: UITextViewDelegate
    
    func textViewDidEndEditing(_ textView: UITextView) {
        updateViewWith(tag: textView.tag)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            resetEditMode()
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateViewWith(tag: textField.tag)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resetEditMode()
        textField.resignFirstResponder()
        return true
    }
    

}
