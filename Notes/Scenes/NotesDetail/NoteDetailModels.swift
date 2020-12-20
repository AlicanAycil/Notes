//
//  NoteDetailModels.swift
//  Notes
//
//  Created by Alican Aycil on 19.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

enum NoteDetailModels {
    
    struct Request {
        let note: Note
    }
    
    struct Response {
        let note: Note
    }
    
    struct ViewModel {
        let note: Note
    }
}

extension NoteDetailModels {
    struct Note {
        let id: String
        var title: String? = nil
        var description: String? = nil
    }
}

