//
//  NoteDetailInteractor.swift
//  Notes
//
//  Created by Alican Aycil on 19.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol NoteDetailBusinessLogic {
    func fetchNoteDetail()
    func addAndUpdateNote(note: NoteDetailModels.Request)
    func deleteNote()
}

protocol NoteDetailDataStore {
    var id: String? { get set }
}

final class NoteDetailInteractor: NoteDetailBusinessLogic, NoteDetailDataStore {

    var presenter: NoteDetailPresentationLogic?
    var worker: NoteDetailWorker?
    var id: String?
    

    func fetchNoteDetail() {
        guard let noteId = self.id else { return }
        worker = NoteDetailWorker(noteDetailStore: NoteDetailDataBaseStore())
        let note = NoteDetailModels.Note(id: noteId)
        worker?.fetchNoteDetail(request: NoteDetailModels.Request(note: note), completionHandler: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.presentNoteDetail(response: response)
            case .failure(_):
                break
            }
        })
    }
    
    func addAndUpdateNote(note: NoteDetailModels.Request) {
        worker = NoteDetailWorker(noteDetailStore: NoteDetailDataBaseStore())
        worker?.addAndUpdateNote(request: note, completionHandler: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success:
                self.presenter?.popNotesViewController()
            case .failure(_):
                break
            }
        })
    }
    
    func deleteNote() {
        guard let noteId = self.id else { return }
        worker = NoteDetailWorker(noteDetailStore: NoteDetailDataBaseStore())
        let note = NoteDetailModels.Note(id: noteId)
        worker?.deleteNote(request: NoteDetailModels.Request(note: note), completionHandler: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success:
                self.presenter?.popNotesViewController()
            case .failure(_):
                break
            }
        })
    }
}
