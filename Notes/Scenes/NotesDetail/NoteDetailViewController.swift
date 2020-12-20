//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Alican Aycil on 19.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol NoteDetailDisplayLogic: class {
    func displayNoteDetail(viewModel: NoteDetailModels.ViewModel)
    func popNotesViewController()
}

final class NoteDetailViewController: LayoutingViewController, NoteDetailDisplayLogic {
    
    typealias ViewType = NoteDetailView
    
    var interactor: NoteDetailBusinessLogic?
    var router: (NSObjectProtocol & NoteDetailRoutingLogic & NoteDetailDataPassing)?
    var tapGestureRecognizer: UITapGestureRecognizer {
        return UITapGestureRecognizer(
            target: self,
            action: #selector(UIInputViewController.dismissKeyboard))
    }
    
    static func builder() -> NoteDetailViewController {
        let viewController = NoteDetailViewController()
        let interactor = NoteDetailInteractor()
        let presenter = NoteDetailPresenter()
        let router = NoteDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Note Detail"
        
        if let _ = router?.dataStore?.id {
            layoutableView.updateUI()
            interactor?.fetchNoteDetail()
        }
        
        setKeybordObserves()
        setKeyboardActions()
        setLayoutableViewButtonActions()
    }
    
    func displayNoteDetail(viewModel: NoteDetailModels.ViewModel) {
        layoutableView.titleTextField.text = viewModel.note.title
        layoutableView.decriptionTextView.text = viewModel.note.description ?? ""
    }
    
    func popNotesViewController() {
        router?.routeToNotesViewController()
    }
}

//Setup
extension NoteDetailViewController {
    
    private func setKeybordObserves() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setKeyboardActions() {
        let navigationHideKeyboard = tapGestureRecognizer
        let containerHideKeyboard = tapGestureRecognizer
        layoutableView.addGestureRecognizer(containerHideKeyboard)
        navigationController?.navigationBar.addGestureRecognizer(navigationHideKeyboard)
    }
    
    private func setLayoutableViewButtonActions() {
        layoutableView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        layoutableView.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
            
}

//Actions
extension NoteDetailViewController {
    
    @objc private func saveButtonTapped() {
        guard let title = layoutableView.titleTextField.text, !title.isEmpty else {
            presentAlertMessage(message: "Title cant be empty.")
            return
        }
        let id: String? = router?.dataStore?.id
        let description: String = layoutableView.decriptionTextView.text
        let note: NoteDetailModels.Note = NoteDetailModels.Note(
            id: id != nil ? id! : UUID().uuidString ,
            title: title,
            description: description.isEmpty ? nil : description
        )
        let request = NoteDetailModels.Request(note: note)
        interactor?.addAndUpdateNote(note: request)
    }
    
    @objc private func deleteButtonTapped() {
        interactor?.deleteNote()
    }
}

//Notifications
extension NoteDetailViewController {
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let window = UIApplication.shared.keyWindow
            let safeAreabottomPadding = window?.safeAreaInsets.bottom
            let bottomConstant = -keyboardSize.height + (safeAreabottomPadding ?? 0)
            layoutableView.updateScreenHeight(bottomConstant: bottomConstant )
            self.view.layoutIfNeeded()
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        layoutableView.updateScreenHeight(bottomConstant: 0)
        self.view.layoutIfNeeded()
    }
    
    @objc private func dismissKeyboard() {
        layoutableView.endEditing(true)
    }
}
