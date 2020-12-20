//
//  NoteDetailWorker.swift
//  Notes
//
//  Created by Alican Aycil on 19.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol NoteDetailStoreProtocol {
    func fetchNoteDetail(request: NoteDetailModels.Request, then handler: @escaping (Result<NoteDetailModels.Response, Error>) -> Void)
    func addAndUpdateNote(request: NoteDetailModels.Request, then handler: @escaping (Result<Void, Error>) -> Void)
    func deleteNote(request: NoteDetailModels.Request, then handler: @escaping (Result<Void, Error>) -> Void)
}

final class NoteDetailWorker {
    
    var noteDetailStore: NoteDetailStoreProtocol
    
    init(noteDetailStore: NoteDetailStoreProtocol) {
        self.noteDetailStore = noteDetailStore
    }
    
    func fetchNoteDetail(request: NoteDetailModels.Request, completionHandler: @escaping (Result<NoteDetailModels.Response, Error>) -> Void) {
        noteDetailStore.fetchNoteDetail(request: request, then: completionHandler)
    }
    
    func addAndUpdateNote(request: NoteDetailModels.Request, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        noteDetailStore.addAndUpdateNote(request: request, then: completionHandler)
    }
    
    func deleteNote(request: NoteDetailModels.Request, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        noteDetailStore.deleteNote(request: request, then: completionHandler)
    }
    
}
