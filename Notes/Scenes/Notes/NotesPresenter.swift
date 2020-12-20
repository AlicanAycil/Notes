//
//  NotesPresenter.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NotesPresentationLogic {
    func presentNotes(response: [NotesModels.Response])
}

final class NotesPresenter: NotesPresentationLogic {
    
    weak var viewController: NotesDisplayLogic?
    
    func presentNotes(response: [NotesModels.Response]) {
        
        let viewModel = NotesModels.ViewModel(notes: response)
        viewController?.displayNotes(viewModel: viewModel)
    }
}
