//
//  NoteDataModel.swift
//  Notes
//
//  Created by Alican Aycil on 20.12.2020.
//

import Foundation
import RealmSwift

class NoteDataModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var detail: String? = ""
    @objc dynamic var date: Date = Date()
    
    convenience init(id: String, title: String, description: String?) {
        self.init()
        self.id = id
        self.title = title
        self.detail = description
    }
    
    override class func primaryKey() -> String {
        return "id"
    }
}

