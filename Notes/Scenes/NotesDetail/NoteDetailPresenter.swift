//
//  NoteDetailPresenter.swift
//  Notes
//
//  Created by Alican Aycil on 19.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NoteDetailPresentationLogic {
    func presentNoteDetail(response: NoteDetailModels.Response)
    func popNotesViewController()
}

final class NoteDetailPresenter: NoteDetailPresentationLogic {
    weak var viewController: NoteDetailDisplayLogic?
    
    func presentNoteDetail(response: NoteDetailModels.Response) {
        let viewModel = NoteDetailModels.ViewModel(note: response.note)
        viewController?.displayNoteDetail(viewModel: viewModel)
    }
    
    func popNotesViewController() {
        viewController?.popNotesViewController()
    }
}
