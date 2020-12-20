//
//  NoteDetailView.swift
//  Notes
//
//  Created by Alican Aycil on 19.12.2020.
//

import UIKit

final class NoteDetailView: LayoutableView {
    
    private weak var scrollViewBottomconstraint: NSLayoutConstraint!
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .appGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .appGray
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.appDarkGray.withAlphaComponent(0.5)
        textField.tintColor = .appYellow
        textField.textColor = .white
        textField.font = .boldSystemFont(ofSize: 20)
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(
            string: "Add title here",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.3),
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)
            ]
        )
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var decriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.appDarkGray.withAlphaComponent(0.5)
        textView.tintColor = .appYellow
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 18)
        textView.layer.cornerRadius = 5
        textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "save"), for: .normal)
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "trash"), for: .normal)
        button.tintColor = .appYellow
        button.adjustsImageWhenHighlighted = false
        button.isHidden = true
        return button
    }()
    
    func setupViews() {
        backgroundColor = UIColor.appGray
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        scrollView.addSubview(titleTextField)
        scrollView.addSubview(decriptionTextView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(saveButton)
        stackView.addArrangedSubview(deleteButton)
    }
    
    func setupLayout() {
        
        scrollViewBottomconstraint = scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
            
            //scrollView
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollViewBottomconstraint,
            
            //scrollView
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            containerView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            
            //titleTextField
            titleTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //decriptionTextView
            decriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            decriptionTextView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            decriptionTextView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            decriptionTextView.bottomAnchor.constraint(equalTo: stackView.topAnchor),
            
            //stackView
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
}

extension NoteDetailView {
    
    func updateUI() {
        deleteButton.isHidden = false
    }
    
    func updateScreenHeight(bottomConstant: CGFloat) {
        scrollViewBottomconstraint.constant = bottomConstant
    }
}


