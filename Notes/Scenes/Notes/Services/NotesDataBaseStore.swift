//
//  NotesDataBaseStore.swift
//  Notes
//
//  Created by Alican Aycil on 19.12.2020.
//

import Foundation
import RealmSwift

final class NotesDataBaseStore: NotesStoreProtocol {
    
    var realmManager: RealmManager
    
    init(realmManager: RealmManager = RealmManager()) {
        self.realmManager = realmManager
    }
    
    func fetchNotes(then handler: @escaping (Result<[NotesModels.Response], Error>) -> Void) {
        
        realmManager.getAllDb(object: NoteDataModel.self, byKeyPath: "date") { (result) in
            switch result {
            case .success(let response):
                let notes: [NotesModels.Response] = response
                    .map { (noteDataModel) -> NotesModels.Response in
                        return NotesModels.Response(
                            id: noteDataModel.id,
                            title: noteDataModel.title
                        )
                    }
                handler(.success(notes))
            case .failure(let error):
                print(error)
            }
        }
       
    }
    
    func deleteNote(request: NotesModels.Request, then handler: @escaping (Result<Void, Error>) -> Void) {
        realmManager.deleteObj(
            object: NoteDataModel.self,
            forKey: request.id
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
