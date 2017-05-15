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
            titleTextField.placeholder = "Add title".localized()
            titleTextField.textColor = UIColor.gray
            titleTextField.font = Font.mediumFontWithSketchSize(size: Font.size16)
            titleTextField.delegate = self
            titleTextField.tag = 4
        }
    }
    
    @IBOutlet var descTextView: UITextView! {
        didSet {
            descTextView.text = ""
            descTextView.textColor = UIColor.gray
            descTextView.font = Font.lightFontWithSketchSize(size: Font.size16)
            descTextView.delegate = self
            descTextView.tag = 5
            descTextView.isScrollEnabled = false
            descTextView.text = "Tap to add description".localized()
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
            
            exitEditMode()
            
            switch tappedLabel.tag {
            case 1: // title
                if let textField = view.viewWithTag(4) as? UITextField {
                    textField.becomeFirstResponder()
                }
                titleLabel.isHidden = true
                titleTextField.isHidden = false
            case 3: // tags
                if let textView = view.viewWithTag(6) as? UITextView {
                    toggleEditMoreFor(textView: textView, enterEditMore: true)
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
        
        let tagsGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(didTapLabel(sender:)))
        tagsLabel.addGestureRecognizer(tagsGestureRecogniser)
    }
    
    private func updateViewWith(tag: Int) {
        switch tag {
        case 4:
            if let textField = view.viewWithTag(tag) as? UITextField {
                if textField.text != "" {
                    titleLabel.text = textField.text
                }
            }
        case 6:
            if let textView = view.viewWithTag(tag) as? UITextView {
                tagsLabel.text = textView.text
            }
        default: break
        }
        
    }
    
    private func exitEditMode() {
        titleLabel.isHidden = false
        tagsLabel.isHidden = false
        
        titleTextField.isHidden = true
        tagsTextView.isHidden = true
        
        toggleEditMoreFor(textView: descTextView, enterEditMore: false)
        toggleEditMoreFor(textView: tagsTextView, enterEditMore: false)
    }
    
    private func toggleEditMoreFor(textView: UITextView, enterEditMore: Bool) {
        if true == enterEditMore {
            textView.layer.cornerRadius = 5
            textView.layer.borderWidth = 1
            textView.layer.borderColor = Color.textViewBorderColor()
        } else {
            textView.layer.cornerRadius = 0
            textView.layer.borderWidth = 0
            textView.layer.borderColor = UIColor.clear.cgColor
        }
        
        view.layoutIfNeeded()
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
    
    private func resizeTextView(text: String?) {
        
        if let text = text, text.length > 0 {
            let newHeight = descTextView.sizeThatFits(CGSize(width: descTextView.frame.size.width, height: CGFloat.greatestFiniteMagnitude)).height
            descTextViewHeightConstraint.constant = newHeight
        }
        
        view.layoutIfNeeded()
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
                descTextView.text = goal.description!
            }
            
            if nil != goal.tags {
                tagsLabel.text = goal.tags!
                tagsTextView.text = goal.tags!
            }
        } else {
            navigationItem.title = "New goal".localized()
        }
        
        resizeTextView(text: descTextView.text)
    }
    
    // MARK: UITextViewDelegate
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Tap to add description".localized()
        }
        updateViewWith(tag: textView.tag)
        resizeTextView(text: descTextView.text)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            exitEditMode()
            textView.resignFirstResponder()
            return false
        }
        resizeTextView(text: descTextView.text)
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        exitEditMode()
        textView.becomeFirstResponder()
        
        // Manage placeholder text
        if textView.text == "Tap to add description".localized() {
            textView.text = ""
        }
        
        toggleEditMoreFor(textView: textView, enterEditMore: true)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        exitEditMode()
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateViewWith(tag: textField.tag)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        exitEditMode()
        textField.resignFirstResponder()
        return true
    }
    

}
