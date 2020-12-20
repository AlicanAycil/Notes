//
//  NotesModels.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

enum NotesModels {
  
    struct Request {
        let id: String
    }
    
    struct Response {
        let id: String
        let title: String
    }
    
    struct ViewModel {
        let notes: [NotesModels.Response]
    }
}
