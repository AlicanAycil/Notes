//
//  NoteDetailDataBaseStore.swift
//  Notes
//
//  Created by Alican Aycil on 19.12.2020.
//

import Foundation
import RealmSwift

final class NoteDetailDataBaseStore: NoteDetailStoreProtocol {
    var realmManager: RealmManager
    
    init(realmManager: RealmManager = RealmManager()) {
        self.realmManager = realmManager
    }
    
    func fetchNoteDetail(request: NoteDetailModels.Request, then handler: @escaping (Result<NoteDetailModels.Response, Error>) -> Void) {
        realmManager.getObject(
            object: NoteDataModel.self,
            forKey: request.note.id
        ) { (result) in
            switch result {
            case .success(let response):

                let note = NoteDetailModels.Note(
                    id: response.id,
                    title: response.title,
                    description: response.detail
                )
                
                let response = NoteDetailModels.Response(note: note)
                handler(.success(response))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addAndUpdateNote(request: NoteDetailModels.Request, then handler: @escaping (Result<Void, Error>) -> Void) {
        let object = NoteDataModel(
            id: request.note.id,
            title: request.note.title ?? "",
            description: request.note.description
        )
        
        realmManager.addObj(obj: object.self) { result in
            switch result {
            case .success:
                handler(.success)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func deleteNote(request: NoteDetailModels.Request, then handler: @escaping (Result<Void, Error>) -> Void) {
        realmManager.deleteObj(
            object: NoteDataModel.self,
            forKey: request.note.id
        ) { result in
            switch result {
            case .success:
                handler(.success)
            case .failure(let error):
                print(error)
            }
        }
    }
}
