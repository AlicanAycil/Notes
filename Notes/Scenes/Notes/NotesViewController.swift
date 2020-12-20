//
//  NotesViewController.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol NotesDisplayLogic: class {
    func displayNotes(viewModel: NotesModels.ViewModel)
}

final class NotesViewController: LayoutingViewController, NotesDisplayLogic {
    
    typealias ViewType = NotesView
    
    var interactor: NotesBusinessLogic?
    var router: (NSObjectProtocol & NotesRoutingLogic & NotesDataPassing)?
    var viewModel = NotesModels.ViewModel(notes: [])
    
    static func builder() -> NotesViewController {
        let viewController = NotesViewController()
        let interactor = NotesInteractor()
        let presenter = NotesPresenter()
        let router = NotesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
    
    // MARK: View lifecycle
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutableView.tableView.delegate = self
        layoutableView.tableView.dataSource = self
        layoutableView.headerAddButton.addTarget(self, action: #selector(headerAddButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
        interactor?.fetchNotes()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    func displayNotes(viewModel: NotesModels.ViewModel) {
        self.viewModel = viewModel
        layoutableView.tableView.reloadData()
    }
}

//Actions
extension NotesViewController {
    
    @objc private func headerAddButtonTapped() {
        router?.routeToNoteDetailViewController(id: nil)
    }
}
