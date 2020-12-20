//
//  NotesWorker.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

protocol NotesStoreProtocol {
    func fetchNotes(then handler: @escaping (Result<[NotesModels.Response], Error>) -> Void)
    func deleteNote(request: NotesModels.Request, then handler: @escaping (Result<Void, Error>) -> Void)
}

final class NotesWorker {
    
    var notesStore: NotesStoreProtocol
    
    init(moviesStore: NotesStoreProtocol) {
        self.notesStore = moviesStore
    }
    
    func fetchNotes(completionHandler: @escaping (Result<[NotesModels.Response], Error>) -> Void) {
        notesStore.fetchNotes(then: completionHandler)
    }
    
    func deleteNote(request: NotesModels.Request, then handler: @escaping (Result<Void, Error>) -> Void) {
        notesStore.deleteNote(request: request, then: handler)
    }
}
