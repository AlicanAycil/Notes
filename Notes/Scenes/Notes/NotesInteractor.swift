//
//  NotesInteractor.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NotesBusinessLogic {
    func fetchNotes()
    func deleteNote(id: String)
}

protocol NotesDataStore {}

final class NotesInteractor: NotesBusinessLogic, NotesDataStore {
        
    var presenter: NotesPresentationLogic?
    var worker: NotesWorker?
    
    func fetchNotes() {
        worker = NotesWorker(moviesStore: NotesDataBaseStore())
        worker?.fetchNotes(completionHandler: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.presentNotes(response: response)
            case .failure(_):
                break
            }
        })
    }
    
    func deleteNote(id: String) {
        worker = NotesWorker(moviesStore: NotesDataBaseStore())
        worker?.deleteNote(request: NotesModels.Request(id: id), then: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.fetchNotes()
            case .failure(_):
                break
            }
        })
    }
    
}

